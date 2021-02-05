<script>
	$("#formLogin").on('submit', function(e) {
        e.preventDefault();
        
        var formAction = $("#formLogin").attr('action');
        var dataLogin = {
        	submit: $("#submitLogin").attr('name'),
            user_name: $("#user_name").val(),
            user_password: $("#user_password").val(),
            ingat_aku: $("#ingat_aku").serialize(),
            <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
        };

        $.ajax({
            type: "POST",
            url: formAction,
            data: dataLogin,
            dataType: 'json',
            success: function(data) {
                if (data.result == 1) {
                    $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                    $("#msg_login").removeAttr('style');
                    $('#msg_login').attr('class', 'alert alert-success');
                    $('.msg_login').html(data.msg);
                    $("#msg_login").slideDown('slow');
                    $("#msg_login").alert().delay(6000).slideUp('slow');
                    setTimeout(function () { window.location.href = "<?= base_url('dashboard');?>";}, 2000);
                } else {
                    $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                    $("#msg_login").removeAttr('style');
                    $('#msg_login').attr('class', 'alert alert-danger');
                    $('.msg_login').html(data.msg);
                    $("#msg_login").slideDown('slow');
                    $("#msg_login").alert().delay(3000).slideUp('slow');
                }
            }
        });
        return false;
    });
</script>