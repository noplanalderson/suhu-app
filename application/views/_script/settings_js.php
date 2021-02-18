<script>
	$(document).ready(function(e){
	    $("#appForm").on('submit', function(e) {
	    	e.preventDefault();

	        var formAction = $("#appForm").attr('action');

	        $.ajax({
	            type: "POST",
	            data: new FormData(this),
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 800000,
	            url: formAction,
	            dataType: 'json',
	            success: function(data) {
	                $('input[name="<?= $this->security->get_csrf_token_name();?>"]').val(data.token);
	                $("#setting_msg").removeAttr('style');
	                if (data.result == 1) {
	                    $('#setting_msg').attr('class', 'alert alert-success');
	                    $('.setting_msg').html(data.msg);
	                    $("#setting_msg").slideDown('slow');
	                    $("#setting_msg").alert().delay(6000).slideUp('slow');
	                    setTimeout(location.reload.bind(location), 1000);
	                } else {
	                    $('#setting_msg').attr('class', 'alert alert-danger');
	                    $('.setting_msg').html(data.msg);
	                    $("#setting_msg").slideDown('slow');
	                    $("#setting_msg").alert().delay(3000).slideUp('slow');
	                }
	            }
	        });
	        return false;
	    });
	});

	$("#app_icon").change(function() {
	    var icon = this.files[0];
	    var fileType = icon.type;
	    var match = ['image/jpeg', 'image/png', 'image/jpg', 'image/webp'];
	    if(!((fileType == match[0]) || (fileType == match[1]) || (fileType == match[2]) || (fileType == match[3]))){
	    	$("#icon_msg").removeAttr('style');
            $('#icon_msg').attr('class', 'alert alert-danger');
            $('.icon_msg').html('Sorry, allowed extension only JPG, JPEG, WEBP, & PNG.');
            $("#icon_msg").slideDown('slow');
            $("#icon_msg").alert().delay(3000).slideUp('slow');
	        $("#app_icon").val('');
	        return false;
	    }
	});

	$("#app_logo_dark").change(function() {
	    var logoDark = this.files[0];
	    var fileType = logoDark.type;
	    var match = ['image/jpeg', 'image/png', 'image/jpg', 'image/webp'];
	    if(!((fileType == match[0]) || (fileType == match[1]) || (fileType == match[2]) || (fileType == match[3]))){
	    	$("#logo_dark_msg").removeAttr('style');
            $('#logo_dark_msg').attr('class', 'alert alert-danger');
            $('.logo_dark_msg').html('Sorry, allowed extension only JPG, JPEG, WEBP, & PNG.');
            $("#logo_dark_msg").slideDown('slow');
            $("#logo_dark_msg").alert().delay(3000).slideUp('slow');
	        $("#app_logo_dark").val('');
	        return false;
	    }
	});

	$("#app_logo_light").change(function() {
	    var logoLight = this.files[0];
	    var fileType = logoLight.type;
	    var match = ['image/jpeg', 'image/png', 'image/jpg', 'image/webp'];
	    if(!((fileType == match[0]) || (fileType == match[1]) || (fileType == match[2]) || (fileType == match[3]))){
	    	$("#logo_light_msg").removeAttr('style');
            $('#logo_light_msg').attr('class', 'alert alert-danger');
            $('.logo_light_msg').html('Sorry, allowed extension only JPG, JPEG, WEBP, & PNG.');
            $("#logo_light_msg").slideDown('slow');
            $("#logo_light_msg").alert().delay(3000).slideUp('slow');
	        $("#app_logo_light").val('');
	        return false;
	    }
	});
</script>