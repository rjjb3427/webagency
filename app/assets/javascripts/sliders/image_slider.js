$(document).ready(function() {
	$('#c3-slider').cycle({
		fx:'scrollRight',
		easing:'easeOutQuad',
		before:		onBefore,
		after:		onAfter,
		speed:		500,
		timeout:		5000,
		sync:		0,
		randomizeEffects:	0,
		prev:		'#slider-prev',
		next:		'#slider-next',
		pager:		'#c3-nav'
	});
	
	$("a[data-rel^='prettyPhoto']").prettyPhoto({
		theme: 'dark_square'
	});
	
	function onBefore(curr, next, opts, fwd) {
		$(next).find('.sliding-image').css({'display':'none', 'left':'-1000px'});
	  $(next).find('.sliding-text').css({'display':'none', 'left':'1000px'});
	  $(next).find('.sliding-image2').css({'display':'none', 'right':'-1000px'});            	           
	  $(next).find('.sliding-text2').css({'display':'none', 'left':'-1000px'});	            
	}
	
	function onAfter(curr, next, opts, fwd) {
		$(this).find('.sliding-image').css({'display':'block'}).delay(50).animate({'left':'10px','opacity':1}, 250, 'easeOutQuad');       
		$(this).find('.sliding-text').css({'display':'block'}).delay(350).animate({'left':'10px','opacity':1}, 350, 'easeOutQuad');
		
		$(this).find('.sliding-image2').css({'display':'block'}).delay(150).animate({'right':'40px','opacity':1}, 250, 'easeOutQuad');
		$(this).find('.sliding-text2').css({'display':'block'}).delay(250).animate({'left':'355px','opacity':1}, 350, 'easeOutQuad');	            
	}
	
	$('#c3-pauseButton').click(function() {
		$('#c3-slider').cycle('pause');
		return false;
	});

	$('#c3-resumeButton').click(function() {
		$('#c3-slider').cycle('resume', true);
		return false;
	});
});