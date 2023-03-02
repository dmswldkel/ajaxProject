$(function(){
	$('ul>li:eq(2)')
		//.click(function(){return false;})
		.mouseenter(function(){
		   $(this).find('ol').show(200);
		})
		.mouseleave(function(){
		   $(this).find('ol').hide();
		});
});