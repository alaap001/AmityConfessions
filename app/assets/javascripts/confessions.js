$(document).ready(function(){

	var preview = $('.confession_img_preview img');
	
	preview.css({'display':'none'});

	$('.confession_file_image').on('click',function(){

		preview.slideDown('show');

	});

	$('.confession_file_image').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});


	var preview2 = $('.edit_confession_image img');

	$('.edit_confession_image_file').change(function(event){
		var input = $(event.currentTarget);
		var file = input[0].files[0];
		var reader = new FileReader();
		reader.onload = function(e){
			image_base64 = e.target.result;
			preview2.attr('src',image_base64);
		};
		reader.readAsDataURL(file);

	});
/*
$("#contentbox").keyup(function()
{
var content=$(this).val();
var urlRegex = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
// Filtering URL from the content using regular expressions
var url= content.match(urlRegex);

if(url.length>0)
{

$("#linkbox").slideDown('show');
$("#linkbox").html("<img src='link_loader.gif'>");
// Getting cross domain data 
$.get("urlget.php?url="+url,function(response)
{
// Loading <title></title>data
var title=(/<title>(.*?)<\/title>/m).exec(response)[1];
// Loading first .png image src='' data 
var logo=(/src='(.*?).png'/m).exec(response)[1];
$("#linkbox").html("<img src='"+logo+".png' class='img'/><div><b>"+title+"</b><br/>"+url)
});

}
return false;
});

*/	
});