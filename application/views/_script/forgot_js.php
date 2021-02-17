<script>
    $("#formForgot").on('submit', function(e) {
        e.preventDefault();
        
        var formAction = $("#formForgot").attr('action');
        var dataEmail = {
            submit: $("#submitEmail").attr('name'),
            user_email: $("#user_email").val(),
            <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
        };

        $.ajax({
            type: "POST",
            url: formAction,
            data: dataEmail,
            dataType: 'json',
            success: function(data) {
                $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                $("#msg_forgot").removeAttr('style');
                
                if (data.result == 1) {
                    $('#msg_forgot').attr('class', 'alert alert-success');
                    $('.msg_forgot').html(data.msg);
                    $("#msg_forgot").slideDown('slow');
                    $("#msg_forgot").alert().delay(6000).slideUp('slow');
                    setTimeout(function () { window.location.href = "<?= base_url('login');?>";}, 2000);
                } else {
                    $('#msg_forgot').attr('class', 'alert alert-danger');
                    $('.msg_forgot').html(data.msg);
                    $("#msg_forgot").slideDown('slow');
                    $("#msg_forgot").alert().delay(3000).slideUp('slow');
                }
            }
        });
        return false;
    });
</script>