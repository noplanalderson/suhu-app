    <script>
    $('#access_lists').DataTable( {
        'info': false,
        'searchable':true,
        'responsive': true,
        'lengthMenu': [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
        "language": {
          "zeroRecords": "No Access Type Found"
        },
        "order": [[ 0, "asc" ]],
        'columnDefs': [ 
            {
                'targets': [1,2],
                'orderable': false,
            }
        ],
        "dom": '<"left"l>rtip',
    });
    $(function(){
        $('.add-access').on('click', function() {
        	$('.modal-title').html('Add Access Type');
            $('.modal-footer button[type=submit]').html('Add');
            $('.modal-body form').attr('action', '<?= base_url("add-access");?>');
            $('#type_id').val('');
            $('#type_name').val('');
            $('#menu_id').select2({
                dropdownParent: $('#accessModal'),
                minimumResultsForSearch: Infinity,
                placeholder: 'Choose Privileges'
            }).val('').trigger('change');
        });
        $('.edit-access').on('click', function() {
            $('.modal-title').html('Edit Access Type');
            $('.modal-footer button[type=submit]').html('Edit');
            $('.modal-body form').attr('action', '<?= base_url("edit-access");?>');

            const type_id = $(this).data('id');
            $.ajax({
                url: '<?= base_url("get-access");?>',
                data: {
                        id: type_id, 
                        <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
                    },
                method: 'post',
                dataType: 'json',
                success: function(data){
                    $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                    $('#type_id').val(type_id);
                    $('#type_name').val(data.type_name);

                    var priv = data.priv;

                    if (priv) {
                        var arrayRoles = priv.split(',');
                        $('#menu_id').select2({
                            dropdownParent: $('#accessModal'),
                            minimumResultsForSearch: Infinity,
                            placeholder: 'Choose Privileges'
                        }).val(arrayRoles).trigger('change');
                    }
                    else
                    {
                        $('#menu_id').select2({
                            dropdownParent: $('#accessModal'),
                            minimumResultsForSearch: Infinity,
                            placeholder: 'Choose Privileges'
                        }).val('').trigger('change');
                    }
                }
            });
        });
    });

    $("#submit").click(function() {
        var formAction = $("#accessForm").attr('action');
        var accessData = {
            type_id: $("#type_id").val(),
            type_name: $("#type_name").val(),
            menu_id: $("#menu_id").val(),
            <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
        };

        $.ajax({
            type: "POST",
            url: formAction,
            data: accessData,
            dataType: 'json',
            success: function(data) {
                $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                $("#access_msg").removeAttr('style');
                if (data.result == 1) {
                    $('#access_msg').attr('class', 'alert alert-success');
                    $('.access_msg').html(data.msg);
                    $("#access_msg").slideDown('slow');
                    $("#access_msg").alert().delay(6000).slideUp('slow');
                    setTimeout(location.reload.bind(location), 1000);
                } else {
                    $('#access_msg').attr('class', 'alert alert-danger');
                    $('.access_msg').html(data.msg);
                    $("#access_msg").slideDown('slow');
                    $("#access_msg").alert().delay(3000).slideUp('slow');
                }
            }
        });
        return false;
    });

    $('.delete').click(function(){
        var result = confirm("Are You Sure to Delete Access Type?");

        if (result) {
            var $tr = $(this).closest('tr');
            const user_id = $(this).data('id');
            $.ajax({
                url: '<?= base_url("delete-access");?>',
                data: {
                        id: user_id, 
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