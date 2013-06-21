window.Views = ->
	window.mainView = new Views.Main
	$('.container').append mainView.render().$el


$(document).ready ->
	Views()
