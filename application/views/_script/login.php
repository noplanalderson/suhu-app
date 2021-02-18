<script>
	$("#formLogin").on('submit', function(e) {
        e.preventDefault();
        
        var formAction = $("#formLogin").attr('action');
        var dataLogin = {
        	submit: $("#submitLogin").attr('name'),
            user_name: $("#user_name").val(),
            user_password: $("#user_password").val(),
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

    $("#formActivation").on('submit', function(e) {
        e.preventDefault();
        
        var formAction = $("#formActivation").attr('action');
        var dataActive = {
            submit: $("#submitPassword").attr('name'),
            user_token: $("#user_token").val(),
            user_password: $("#user_password").val(),
            user_password_repeat: $("#user_password_repeat").val(),
            <?= $this->security->get_csrf_token_name();?>: $('input[name="<?= $this->security->get_csrf_token_name();?>"]').attr('value')
        };

        $.ajax({
            type: "POST",
            url: formAction,
            data: dataActive,
            dataType: 'json',
            success: function(data) {
                $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
                $("#msg_active").removeAttr('style');
                
                if (data.result == 1) {
                    $('#msg_active').attr('class', 'alert alert-success');
                    $('.msg_active').html(data.msg);
                    $("#msg_active").slideDown('slow');
                    $("#msg_active").alert().delay(6000).slideUp('slow');
                    setTimeout(function () { window.location.href = "<?= base_url('login');?>";}, 2000);
                } else {
                    $('#msg_active').attr('class', 'alert alert-danger');
                    $('.msg_active').html(data.msg);
                    $("#msg_active").slideDown('slow');
                    $("#msg_active").alert().delay(3000).slideUp('slow');
                }
            }
        });
        return false;
    });
</script>