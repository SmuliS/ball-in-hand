window.Views = ->
	navigationController = new Views.NavigationController
	$('.container').append navigationController.render().$el
	navigationController.pushView new Views.MainView


$(document).ready ->
	Views()
