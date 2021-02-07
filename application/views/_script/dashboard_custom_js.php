<script>
    <?php foreach ($sensors as $sensor) :?>
    $.getJSON( "<?= $sensor->thermo_url ?>", function( json ) {
        temp_<?= $sensor->thermo_hash ?> = new RGraph.Meter({
            id: 'temp_<?= $sensor->thermo_hash ?>',
            min: 0,
            max: 100,
            value: json.temperature,
            options: {
                border: false,
                tickmarksSmallCount: 0,
                tickmarksLargeCount: 0,
                anglesStart: RGraph.HALFPI + (RGraph.HALFPI / 1.5),
                anglesEnd: RGraph.TWOPI + RGraph.HALFPI - (RGraph.HALFPI / 1.5),
                segmentsRadiusStart: 110,
                textSize: 8,
                colorsRanges: [
                    [0,40,'Gradient(#0c0:#cfc:#0c0)'],
                    [40,80,'Gradient(yellow:#ffc:yellow)'],
                    [80,100,'Gradient(red:#fcc:red)']
                ],
                needleRadius: 65,
                marginTop: 10,
                marginLeft: 20,
                marginRight: 20,
                marginBottom: 65
            }
        }).draw()

        hum_<?= $sensor->thermo_hash ?> = new RGraph.Meter({
            id: 'hum_<?= $sensor->thermo_hash ?>',
            min: 0,
            max: 100,
            value: json.humidity,
            options: {
                border: false,
                tickmarksSmallCount: 0,
                tickmarksLargeCount: 0,
                anglesStart: RGraph.HALFPI + (RGraph.HALFPI / 1.5),
                anglesEnd: RGraph.TWOPI + RGraph.HALFPI - (RGraph.HALFPI / 1.5),
                segmentsRadiusStart: 110,
                textSize: 8,
                colorsRanges: [
                    [0,40,'Gradient(#0c0:#cfc:#0c0)'],
                    [40,80,'Gradient(yellow:#ffc:yellow)'],
                    [80,100,'Gradient(red:#fcc:red)']
                ],
                needleRadius: 65,
                marginTop: 10,
                marginLeft: 20,
                marginRight: 20,
                marginBottom: 65
            }
        }).draw()

        dew_<?= $sensor->thermo_hash ?> = new RGraph.Meter({
            id: 'dew_<?= $sensor->thermo_hash ?>',
            min: 0,
            max: 100,
            value: json.dew_point,
            options: {
                border: false,
                tickmarksSmallCount: 0,
                tickmarksLargeCount: 0,
                anglesStart: RGraph.HALFPI + (RGraph.HALFPI / 1.5),
                anglesEnd: RGraph.TWOPI + RGraph.HALFPI - (RGraph.HALFPI / 1.5),
                segmentsRadiusStart: 110,
                textSize: 8,
                colorsRanges: [
                    [0,40,'Gradient(#0c0:#cfc:#0c0)'],
                    [40,80,'Gradient(yellow:#ffc:yellow)'],
                    [80,100,'Gradient(red:#fcc:red)']
                ],
                needleRadius: 65,
                marginTop: 10,
                marginLeft: 20,
                marginRight: 20,
                marginBottom: 65
            }
        }).draw()
    });
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
        'columnDefs': [ 
            {
                'targets': [0,1], /* table column index */
                'orderable': false, /* true or false */
            }
        ],
        "autoWidth" : false,
        'dom': 'lrtip',
        'ajax': "<?= base_url('get-logs');?>",
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
</script>