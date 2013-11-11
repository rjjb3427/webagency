//= require jquery.tools.min.js
//= require jquery_ujs
//= require bootstrap
//= require plugin/jquery.supersized.min.js

$(document).ready(function() {
	$.supersized({	
		slideshow               :   0,		//Slideshow on/off
		autoplay				:	1,		//Slideshow starts playing automatically
		start_slide             :   1,		//Start slide (0 is random)
		random					: 	0,		//Randomize slide order (Ignores start slide)
		slide_interval          :   3000,	//Length between transitions
		transition              :   1, 		//0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
		transition_speed		:	500,	//Speed of transition
		new_window				:	1,		//Image links open in new window/tab
		pause_hover             :   0,		//Pause slideshow on hover
		keyboard_nav            :   1,		//Keyboard navigation on/off
		performance				:	1,		//0-Normal, 1-Hybrid speed/quality, 2-Optimizes image quality, 3-Optimizes transition speed // (Only works for Firefox/IE, not Webkit)
		image_protect			:	1,		//Disables image dragging and right click with Javascript
		stop_loop				:	0,		//Pauses slideshow upon reaching the last slide.
		
		//Size & Position
		min_width		        :   0,		//Min width allowed (in pixels)
		min_height		        :   0,		//Min height allowed (in pixels)
		vertical_center         :   1,		//Vertically center background
		horizontal_center       :   1,		//Horizontally center background
		fit_portrait         	:   1,		//Portrait images will not exceed browser height
		fit_landscape			:   0,		//Landscape images will not exceed browser width
		fit_always				:	0,		//Prevents the image from ever being cropped. Ignores minimum width and height.

		//Components
		navigation              :  0,		//Slideshow controls on/off
		thumbnail_navigation    :   1,		//Thumbnail navigation
		slide_counter           :   1,		//Display slide numbers
		slide_captions          :   1,		//Slide caption (Pull from "title" in slides array)
		thumb_links				:	1,		//Generates a list of thumb links that jump to the corresponding slide. If the 'thumb' field for the slide is empty, it will simply scale down the full size image, which can slow performance.
		thumbnail_navigation	:	0,		//Toggles forward/backward thumbnail navigation. When on, thumbnails from the next/previous posts are generated and can be clicked to navigate. If the 'thumb' field for the slide is empty, it will simply scale down the full size image
				
		slides 		:  [{image : "/assets/wrapper-bg.jpg" }],
		// Theme Options			   
		progress_bar			:	0,			// Timer for each slide							
		mouse_scrub				:	0
	});
	
	
	$('.template_img').mouseover(template_mouseover).mouseout(template_mouseout).mousemove(template_mousemove);
});

function template_mouseover() {
	var tcId=$(this).find('input').val();
	var previewSrc=$(this).find('input:first').val();	
	if(tcId==10 || tcId==12)
		return false;
	
	$('#template_preview').css('width','430px');
	$('#loading').css('left','180px');	
	
	var tId=$(this).find('a').attr('href').split('/templates/')[1];
	$('#template_preview h1 span').text(tId);		
	$("#template_preview p").html('<img src="'+previewSrc+'" />');		
	$('#template_preview,#loading').show();				
	setTimeout('$("#loading").fadeOut()',1000);
}

function template_mouseout() {
	$('#template_preview').hide();
}

function template_mousemove(e) {
	var tcId=$(this).find('input:first').val();				
	if($(this).parent().hasClass('nm')) {
		if(tcId==8) {
			$('#template_preview').css({'top':e.pageY-200,'left':e.pageX-250});
		} else {
			$('#template_preview').css({'top':e.pageY-200,'left':e.pageX-470});
		}
	} else {
		$('#template_preview').css({'top':e.pageY-200,'left':e.pageX+20});
	}
}
