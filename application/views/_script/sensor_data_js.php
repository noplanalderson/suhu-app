<script>
    var graphUrl = "<?= base_url('sensor-data/graphData/'.$sensor->thermo_hash)?>";
    
    var dataUrl = "<?= base_url('sensor-data/'.$sensor->thermo_hash);?>";

    $('input[name="time_range"]').daterangepicker({
        "locale": {
            "format": "YYYY-MM-DD",
        }
    });

	var sensorData = $('#sensor-data').DataTable( {
        'processing' : true,
        'serverside' : true,
        'info': false,
        'searchable':false,
        'responsive': true,
        'lengthMenu': [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
        "language": {
          "zeroRecords": "No data Found"
        },
        "order": [[ 0, "desc" ]],
        'columnDefs': [ 
            {
                'targets': [0,1,2,3],
                'orderable': false,
            }
        ],
        "autoWidth" : false,
        'ajax': {
            url : dataUrl,
            timeout : 10000
        },
        "columns": [
            {
                "data" : "datetime",
                "width": "300px"
            },
            {
                "data" : "temperature"
            },
            {
                "data" : "humidity"
            },
            {
                "data" : "dew_point"
            }
        ],
        "dom": '<"left"l>Btip',
        "buttons": [
        	{
                extend: 'excelHtml5',
                pageSize: 'Legal',
                orientation: 'potrait',
                title: "Temperature Report - <?= $sensor->thermo_location ?>",
                messageTop: "Temperature Report - <?= $sensor->thermo_location ?> \n",
                messageTop: "Export Date : <?= date('d F Y H:i:s') ?> \n",
            },
            {
                extend: 'pdfHtml5',
                pageSize: 'Legal',
                orientation: 'potrait',
                title: "Temperature Report - <?= $sensor->thermo_location ?>",
            	customize : function(doc) 
            	{
                	doc.content.splice(0, 1, {
                	text: [
                        {
	                        text: "TEMPERATURE REPORT\n",
	                        fontSize: 14,
	                        alignment: 'center'
                        }, 
                        {
                        	text: "<?= $this->app->company_name ?>\n\n",
                        	fontSize: 11,
                        	alignment: 'center'
                        },
                        {
                        	text: "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n\n\n",
                        	fontSize: 11,
                        	alignment: 'center'
                        },
                        {
                        	text: "Sensor Location : <?= $sensor->thermo_location ?> \n",
                        	fontSize: 8,
                        	alignment: 'left'
                        },
                        {
                        	text: "Export Date : <?= date('d F Y H:i:s') ?>\n\n\n",
                        	fontSize: 8,
                        	alignment: 'left'
                        },
                    ]
                	});
                    doc.content[1].margin = [ 10, 0, 10, 0 ];
                    doc.content[1].table.widths = [200,100,100,100];
              	},
            }
        ]
    });

    Highcharts.setOptions({
	    time: {
	        timezone: 'Asia/Jakarta'
	    },
        exporting: {
          enabled:true
        }
	});

    function graph(data)
    {
    	Highcharts.chart('sensorGraph', {
			chart: {
				zoomType: 'x'
			},
			title: {
				text: '<?= $sensor->thermo_location ?> Temperature'
			},
			subtitle: {
				text: document.ontouchstart === undefined ?
				'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
			},
			xAxis: {
				type: 'datetime',
			},
			yAxis: {
				title: {
					text: 'Temperature (°C)'
				}
			},
			legend: {
				enabled: false
			},
			plotOptions: {
				area: {
					fillColor: {
						linearGradient: {
							x1: 0,
							y1: 0,
							x2: 0,
							y2: 1
						},
						stops: [
						[0, Highcharts.getOptions().colors[0]],
						[1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
						]
					},
					marker: {
						radius: 2
					},
					lineWidth: 1,
					states: {
						hover: {
							lineWidth: 1
						}
					},
					threshold: null
				}
			},
			series: [{
				type: 'area',
				name: 'Temperature',
				data: data
			}],
		});
    }

    function getData(graph_url) {
        $.ajax({
            url: graph_url,
            timeout: 10000,
            type: 'GET',
            async: true,
            dataType: "json",
            success: function (data) {
                graph(data);
            }
        });
    };

	getData(graphUrl);
    
    setInterval(function(){
    	getData(graphUrl);
      	sensorData.ajax.reload();
    }, <?= $this->app->fetch_data_time ?>);

    $("#submit_range").click(function() {
        var formAction = $("#range_form").attr('action');
        var time_range = $("#time_range").val();
        var range = time_range.split(' - ');
        var data_range = dataUrl + '/' + range[0] + "/" + range[1];
        var graph_range = graphUrl + '/' + range[0] + "/" + range[1];

        getData(graph_range);
        
        $.ajax({
            type: "GET",
            url: data_range,
            dataType: 'json',
            success: function(data) {
                $("#sensor-data").DataTable().clear().draw();
                $("#sensor-data").DataTable().ajax.url(data_range).load();
            }
        });
        return false;
    });
</script>