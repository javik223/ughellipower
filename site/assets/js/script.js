$(document).ready(function(){
	$("#slide").cycle({
		fx:     'fade', 
		speed: 	'3000',
    	delay:   6000 
	});

	$(".fancybox-thumb").fancybox({
		helpers	: {
			title	: {
				type: 'outside'
			},
			thumbs	: {
				width	: 50,
				height	: 50
			}
		}
	});

$contact_form = $("#form_contact");
  $form_name = $("#form_name");
  $form_email = $("#form_email");
  $form_subject = $("#form_subject");
  $form_message = $("#form_message");
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  
  $contact_form.submit(function(e){
    error = 0;
    if($form_name.val().length <= 3) {
      $form_name.parent().find('.form_error').html("Please input a valid name").fadeIn();
      error += 1;
    }
    if(!regex.test($form_email.val())) {
      $form_email.parent().find('.form_error').html("Please input a valid email address").fadeIn();
      error += 1;
    }
    if($form_message.val().length <= 3) {
      $form_message.parent().find('.form_error').html("Please input a message").fadeIn();
      error += 1;
    }
    if (error == 0) {
      return true;
    }
    e.preventDefault();
  });
  
   formInputs = [$form_name, $form_email, $form_subject, $form_message];
  
  $.each(formInputs, function(Index, Value){
    Value.on("blur", function() {
       $(this).parent().find(".form_error").fadeOut();
    });
  });
});