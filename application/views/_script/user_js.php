<script>
    $('#users').DataTable( {
        'info': false,
        'searchable':true,
        'responsive': true,
        'lengthMenu': [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
        "language": {
          "zeroRecords": "No user Found"
        },
        "order": [[ 0, "asc" ]],
        'columnDefs': [ 
            {
                'targets': [2,3,4,5],
                'orderable': false,
            }
        ],
        "dom": '<"left"l>rftip',
    });

    $(function(){
        $('.add-user').on('click', function() {
            $('.modal-title').html('Add User');
            $('.modal-footer button[type=submit]').html('Add');
            $('.modal-body form').attr('action', '<?= base_url("add-user");?>');
            $('#user_name').val('');
            $('#user_realname').val('');
            $('#user_email').val('');
            $('#type_id').val('');
        });
        $('.edit-user').on('click', function() {
            $('.modal-title').html('Edit User');
            $('.modal-footer button[type=submit]').html('Edit');
            $('.modal-body form').attr('action', '<?= base_url("edit-user");?>');

            const user_id = $(this).data('id');
            $('#user_id').val(user_id);

            $.ajax({
                url: '<?= base_url("get-user");?>',
                data: {
                        id: user_id, 
                        <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
                    },
                method: 'post',
                dataType: 'json',
                success: function(data){
                    $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                    $('#user_name').val(data.user_name);
                    $('#user_realname').val(data.user_realname);
                    $('#user_email').val(data.user_email);
                    $('#type_id').val(data.type_id);
                }
            });
        });
    });

    $("#submit").click(function() {
        var formAction = $("#userForm").attr('action');
        var userData = {
            user_id: $("#user_id").val(),
            user_name: $("#user_name").val(),
            user_realname: $("#user_realname").val(),
            user_email: $("#user_email").val(),
            type_id: $("#type_id").val(),
            <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
        };

        $.ajax({
            type: "POST",
            url: formAction,
            data: userData,
            dataType: 'json',
            success: function(data) {
                $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                $("#user_msg").removeAttr('style');
                $('.user_msg').html(data.msg);
                $("#user_msg").slideDown('slow');
                
                if (data.result == 1) {
                    $('#user_msg').attr('class', 'alert alert-success');
                    $("#user_msg").alert().delay(3000).slideUp('slow');
                    setTimeout(location.reload.bind(location), 1000);
                } else {
                    $('#user_msg').attr('class', 'alert alert-danger');
                    $("#user_msg").alert().delay(3000).slideUp('slow');
                }
            }
        });
        return false;
    });

    $('.delete').click(function(){
        var result = confirm("Are You Sure to Delete User?");

        if (result) {
            var $tr = $(this).closest('tr');
            const user_id = $(this).data('id');
            $.ajax({
                url: '<?= base_url("delete-user");?>',
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