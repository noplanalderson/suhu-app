<script>
    var realTimeTemp = "<?= base_url('get-real-temp') ?>";
    var logsUrl = "<?= base_url('get-logs') ?>";

    $('input[name="time_range"]').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
        }
    });
    
    function graph(hash, data)
    {
        new RGraph.Meter({
            id: 'temp_' + hash,
            min: 0,
            max: 45,
            value: data.temperature,
            options: {
                border: false,
                tickmarksSmallCount: 0,
                tickmarksLargeCount: 0,
                anglesStart: RGraph.HALFPI + (RGraph.HALFPI / 1.5),
                anglesEnd: RGraph.TWOPI + RGraph.HALFPI - (RGraph.HALFPI / 1.5),
                segmentsRadiusStart: 110,
                textSize: 8,
                colorsRanges: [
                    [0,11,'Gradient(red:#fcc:red)'],
                    [11,18,'Gradient(yellow:#ffc:yellow)'],
                    [18,27,'Gradient(#0c0:#cfc:#0c0)'],
                    [27,35,'Gradient(yellow:#ffc:yellow)'],
                    [35,45,'Gradient(red:#fcc:red)']
                ],
                needleRadius: 65,
                marginTop: 10,
                marginLeft: 20,
                marginRight: 20,
                marginBottom: 65
            }
        }).grow()

        new RGraph.Meter({
            id: 'hum_' + hash,
            min: 0,
            max: 100,
            value: data.humidity,
            options: {
                border: false,
                tickmarksSmallCount: 0,
                tickmarksLargeCount: 0,
                anglesStart: RGraph.HALFPI + (RGraph.HALFPI / 1.5),
                anglesEnd: RGraph.TWOPI + RGraph.HALFPI - (RGraph.HALFPI / 1.5),
                segmentsRadiusStart: 110,
                textSize: 8,
                colorsRanges: [
                    [0,30,'Gradient(red:#fcc:red)'],
                    [30,40,'Gradient(yellow:#ffc:yellow)'],
                    [40,60,'Gradient(#0c0:#cfc:#0c0)'],
                    [60,70,'Gradient(yellow:#ffc:yellow)'],
                    [70,100,'Gradient(red:#fcc:red)']
                ],
                needleRadius: 65,
                marginTop: 10,
                marginLeft: 20,
                marginRight: 20,
                marginBottom: 65
            }
        }).grow()

        new RGraph.Meter({
            id: 'dew_' + hash,
            min: 0,
            max: 20,
            value: data.dew_point,
            options: {
                border: false,
                tickmarksSmallCount: 0,
                tickmarksLargeCount: 0,
                anglesStart: RGraph.HALFPI + (RGraph.HALFPI / 1.5),
                anglesEnd: RGraph.TWOPI + RGraph.HALFPI - (RGraph.HALFPI / 1.5),
                segmentsRadiusStart: 110,
                textSize: 8,
                colorsRanges: [
                    [0,4,'Gradient(red:#fcc:red)'],
                    [4,5.5,'Gradient(yellow:#ffc:yellow)'],
                    [5.5,15,'Gradient(#0c0:#cfc:#0c0)'],
                    [15,16.5,'Gradient(yellow:#ffc:yellow)'],
                    [16.5,20,'Gradient(red:#fcc:red)']
                ],
                needleRadius: 65,
                marginTop: 10,
                marginLeft: 20,
                marginRight: 20,
                marginBottom: 65
            }
        }).grow()
    }

    function getData(hash, thermo_url)
    {
        $.ajax({
            url: thermo_url,
            timeout: 10000,
            type: 'GET',
            async: false,
            dataType: "json",
            success: function (data) {
                graph(hash, data);
                $('.temp_'+hash).html(data.temperature + '<br/> Temperature (°C)');
                $('.hum_'+hash).html(data.humidity + '<br/> Humidity (%)');
                $('.dew_'+hash).html(data.dew_point.toFixed(2) + '<br/> Dew Point (°C)');
            }
        });
    }

    <?php foreach ($sensors as $sensor) :?>
        getData("<?= $sensor->thermo_hash ?>", realTimeTemp + "/<?= $sensor->thermo_hash ?>");
    <?php endforeach;?>

    var logs = $('#logs').DataTable( {
        'processing' : true,
        'serverside' : true,
        'info': false,
        'searchable':false,
        'responsive': true,
        'lengthMenu': [ [5, 10, 25, 50, -1], [5, 10, 25, 50, "All"] ],
        "language": {
          "zeroRecords": "No data Found"
        },
        "order": [[ 0, "desc" ]],
        'columnDefs': [ 
            {
                'targets': [0,1],
                'orderable': false,
            }
        ],
        "autoWidth" : false,
        'dom': 'lrtip',
        'ajax': {
            url : "<?= base_url('get-logs') ?>",
            timeout: 10000
        },
        "columns": [
            {
                "data" : "datetime",
                "width": "300px"
            },
            {
                "data" : "message",
                "width": "1000px"
            }
        ]
    });

    setInterval(function(){
        <?php foreach ($sensors as $sensor) :?>
            getData("<?= $sensor->thermo_hash ?>", realTimeTemp + "/<?= $sensor->thermo_hash ?>");
        <?php endforeach;?>
        logs.ajax.reload();
    }, <?= $this->app->fetch_data_time ?>);

    $("#submit_range").click(function() {
        var formAction = $("#range_form").attr('action');
        var time_range = $("#time_range").val();
        var range = time_range.split(' - ');
        var logs_url = logsUrl + '/' + range[0] + "/" + range[1];
        $.ajax({
            type: "GET",
            url: logs_url,
            dataType: 'json',
            success: function(data) {
                $("#logs").DataTable().clear().draw();
                $("#logs").DataTable().ajax.url(logs_url).load();
            }
        });
        return false;
    });
</script>
