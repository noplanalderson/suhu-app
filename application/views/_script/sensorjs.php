<script>
	var sensor_list = $('#sensor_list').DataTable({
        bProcessing: true,
        scrollCollapse: true,
        autoWidth: true,
        responsive: true,
        searching: false,
        bLengthChange: true,
        bPaginate: true,
        bInfo: true,
        "ordering": false,
        "iDisplayLength": 10,
        "language": {
            "info": "_START_-_END_ of _TOTAL_ entries",
            paginate: {
                next: '<i class="ion-chevron-right"></i>',
                previous: '<i class="ion-chevron-left"></i>'  
            }
        },
    });
    $(function(){
        $('.add-sensor').on('click', function() {
            $('.modal-title').html('Add Sensor');
            $('.modal-footer button[type=submit]').html('Add');
            $('.modal-body form').attr('action', '<?= base_url("add-sensor");?>');
            $('#thermo_hash').val('');
            $('#thermo_url').val('');
            $('#thermo_location').val('');
        });
        $('.edit-sensor').on('click', function() {
            $('.modal-title').html('Edit Sensor');
            $('.modal-footer button[type=submit]').html('Edit');
            $('.modal-body form').attr('action', '<?= base_url("edit-sensor");?>');

            const thermo_hash = $(this).data('id');
            $.ajax({
                url: '<?= base_url("get-sensor");?>',
                data: {
                        id: thermo_hash, 
                        <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
                    },
                method: 'post',
                dataType: 'json',
                success: function(data){
                    $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                    $('#thermo_hash').val(thermo_hash);
                    $('#thermo_url').val(data.thermo_url);
                    $('#thermo_location').val(data.thermo_location);
                    $('#is_active').val(data.is_active);
                }
            });
        });
    });

    $("#submit").click(function() {
        var formAction = $("#sensorForm").attr('action');
        var sensor = {
            thermo_hash: $("#thermo_hash").val(),
            thermo_url: $("#thermo_url").val(),
            thermo_location: $("#thermo_location").val(),
            is_active: $("#is_active").val(),
            <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
        };

        $.ajax({
            type: "POST",
            url: formAction,
            data: sensor,
            dataType: 'json',
            success: function(data) {
                $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                $("#sensor_msg").removeAttr('style');
                $('.sensor_msg').html(data.msg);
                $("#sensor_msg").slideDown('slow');
                
                if (data.result == 1) {
                    $('#sensor_msg').attr('class', 'alert alert-success');
                    $("#sensor_msg").alert().delay(3000).slideUp('slow');
                    setTimeout(location.reload.bind(location), 1000);
                } else {
                    $('#sensor_msg').attr('class', 'alert alert-danger');
                    $("#sensor_msg").alert().delay(3000).slideUp('slow');
                }
            }
        });
        return false;
    });

    $('.delete').click(function(){
        var result = confirm("Are You Sure to Delete Sensor?");

        if (result) {
            var $tr = $(this).closest('tr');
            const thermo_hash = $(this).data('id');
            $.ajax({
                url: '<?= base_url("delete-sensor");?>',
                data: {
                        id: thermo_hash, 
                        <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
                    },
                method: 'post',
                dataType: 'json',
                success: function(data) {
                    $('.modal-body input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                    $("#delete_msg").removeAttr('style');
                    
                    if (data.result == 1) {
                        $('#delete_msg').attr('class', 'alert alert-success');
                        $tr.find('td').fadeOut(1000,function(){ 
                            $tr.remove();                    
                        });
                    } else {
                        $('#delete_msg').attr('class', 'alert alert-danger');
                    }

                    $('.delete_msg').html(data.msg);
                    $("#delete_msg").slideDown('slow');
                    $("#delete_msg").alert().delay(6000).slideUp('slow');
                }
            });
        }
    });
</script>