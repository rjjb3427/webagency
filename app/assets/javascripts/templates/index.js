//=require application

var oinst;

$(document).ready(function() {
	$('a[rel]').overlay({
		fixed:false,
		mask:'#000',
		onBeforeLoad: function(){
			var wrap = this.getOverlay();
			wrap.load(this.getTrigger().attr("href")+'?layout=false');
			oinst= this;
		}
	});
});

