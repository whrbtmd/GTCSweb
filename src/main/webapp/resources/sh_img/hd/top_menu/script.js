// top_menu
$(document).ready(function() {	
	$('#top_menu li').hover(function() {
		$('ul', this).slideDown(0);
		$(this).children('a:first').addClass("hov");
		// $('li ul#old_id').slideUp(100);
		// $('li ul#old_id').children('a:first').removeClass("hov");
		$(".top_nav_bg").slideDown(0);
	}, function() {
		$('ul', this).slideUp(0);
		$(this).children('a:first').removeClass("hov");	
		// $('li ul#old_id').slideDown(300);
		// $('li ul#old_id').children('a:first').addClass("hov");	
	  	
		$(".top_nav_bg").slideUp(0);
	});
});



// ie6
$(function(){
	$('.product_list li:first-child').css("border-top","0");  
	$('.tbl_ir.black tr td').css("border-right","0");  
});