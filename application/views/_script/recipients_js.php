<script>
    $('#recipients').DataTable( {
        'info': false,
        'searchable':true,
        'responsive': true,
        'lengthMenu': [ [10, 25, 50, -1], [10, 25, 50, "All"] ],
        "language": {
          "zeroRecords": "No data Found"
        },
        "order": [[ 0, "asc" ]],
        'columnDefs': [ 
            {
                'targets': [0,1],
                'orderable': false,
            }
        ],
        "dom": '<"left"l>rftip',
    });

    $(function(){
        $('.add-recipient').on('click', function() {
            $('.modal-title').html('Add Recipient');
            $('.modal-footer button[type=submit]').html('Add');
            $('.modal-body form').attr('action', '<?= base_url("add-recipient");?>');
            $('#email_address').val('');
        });
        $('.edit-recipient').on('click', function() {
            $('.modal-title').html('Edit Recipient');
            $('.modal-footer button[type=submit]').html('Edit');
            $('.modal-body form').attr('action', '<?= base_url("edit-recipient");?>');

            const email_id = $(this).data('id');
            $.ajax({
                url: '<?= base_url("get-recipient");?>',
                data: {
                        id: email_id, 
                        <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
                    },
                method: 'post',
                dataType: 'json',
                success: function(data){
                    $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                    $('#email_address').val(data.email_address);
                }
            });
        });
    });

    $("#submit").click(function() {
        var formAction = $("#recipientForm").attr('action');
        var recipient = {
            email_id: $("#email_id").val(),
            email_address: $("#email_address").val(),
            <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
        };

        $.ajax({
            type: "POST",
            url: formAction,
            data: recipient,
            dataType: 'json',
            success: function(data) {
                $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                $("#recipient_msg").removeAttr('style');
                $('.recipient_msg').html(data.msg);
                $("#recipient_msg").slideDown('slow');
                
                if (data.result == 1) {
                    $('#recipient_msg').attr('class', 'alert alert-success');
                    $("#recipient_msg").alert().delay(3000).slideUp('slow');
                    setTimeout(location.reload.bind(location), 1000);
                } else {
                    $('#recipient_msg').attr('class', 'alert alert-danger');
                    $("#recipient_msg").alert().delay(3000).slideUp('slow');
                }
            }
        });
        return false;
    });

    $('.delete').click(function(){
        var result = confirm("Are You Sure to Delete Recipient?");

        if (result) {
            var $tr = $(this).closest('tr');
            const email_id = $(this).data('id');
            $.ajax({
                url: '<?= base_url("delete-recipient");?>',
                data: {
                        id: email_id, 
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