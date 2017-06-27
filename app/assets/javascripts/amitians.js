$(document).ready(function(){

	var preview = $('.demo_dp');

	preview.css({'display':'none'})
	
	$('.demo_dp_file').on('click',function(){

		preview.slideDown('show');

	});

	$('.demo_dp_file').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});

	var preview2 = $('.demo_cover');

	preview2.css({'display':'none'})
	
	$('.demo_cover_file').on('click',function(){

		preview2.slideDown('show');

	});

	$('.demo_cover_file').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview2.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});

	
});