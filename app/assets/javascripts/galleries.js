$(document).ready(function(){

	var preview = $('.g1 img');
	
	$('.gal1').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});

	var preview2 = $('.g2 img');
	
	$('.gal2').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview2.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});

	var preview3 = $('.g3 img');
	
	$('.gal3').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview3.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});

	var preview4= $('.g4 img');
	
	$('.gal4').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview4.attr('src',image_base64);
		}
		reader.readAsDataURL(file);

	});

	var preview5 = $('.g5 img');
	
	$('.gal5').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview5.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});

	var preview6 = $('.g6 img');
	
	$('.gal6').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview6.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});


});