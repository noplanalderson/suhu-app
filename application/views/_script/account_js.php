<script>
	$(document).ready(function(e){
	    $("#accountForm").on('submit', function(e) {
	    	e.preventDefault();

	        var formAction = $("#accountForm").attr('action');

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
	                $("#account_msg").removeAttr('style');
	                if (data.result == 1) {
	                    $('#account_msg').attr('class', 'alert alert-success');
	                    $('.account_msg').html(data.msg);
	                    $("#account_msg").slideDown('slow');
	                    $("#account_msg").alert().delay(6000).slideUp('slow');
	                    setTimeout(location.reload.bind(location), 1000);
	                } else {
	                    $('#account_msg').attr('class', 'alert alert-danger');
	                    $('.account_msg').html(data.msg);
	                    $("#account_msg").slideDown('slow');
	                    $("#account_msg").alert().delay(3000).slideUp('slow');
	                }
	            }
	        });
	        return false;
	    });
	});

	$("#user_picture").change(function() {
	    var file = this.files[0];
	    var fileType = file.type;
	    var match = ['image/jpeg', 'image/png', 'image/jpg', 'image/webp'];
	    if(!((fileType == match[0]) || (fileType == match[1]) || (fileType == match[2]) || (fileType == match[3]))){
	    	$("#account_msg").removeAttr('style');
            $('#account_msg').attr('class', 'alert alert-danger');
            $('.account_msg').html('Sorry, allowed extension only JPG, JPEG, WEBP, & PNG.');
            $("#account_msg").slideDown('slow');
            $("#account_msg").alert().delay(3000).slideUp('slow');
	        $("#user_picture").val('');
	        return false;
	    }
	});
</script>