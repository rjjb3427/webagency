//= require application
//= require jquery_ujs

$('a[rel="overlay"]').overlay
  mask: "#333"
  onBeforeLoad: ->
    wrap = @getOverlay()
    wrap.load @getTrigger().attr("href")
    oinst = this