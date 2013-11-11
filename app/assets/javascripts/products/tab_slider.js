

$(document).ready(function() {
	$("#products_tab_menu li a").click(function() {				
		$("#products_tab_menu li").removeClass("active"); //Remove any "active" class
		$(this).parent().addClass("active"); //Add "active" class to selected tab
		var tIndex=$("#products_tab_slider ul li a").index($(this));		
		$("#products_tab_slider .tab_content").css('top','300px'); //Hide all tab content
		$("#products_tab_slider .tab_content:eq("+tIndex+")").animate({'top':'10px'}, 350, 'easeOutQuad',function(){ noMore=false;});   //Fade in the active content
		return false;
	});
});