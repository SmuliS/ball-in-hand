window.Views = ->
	mainView = new Views.Main
	$('.container').append mainView.render().$el

class Views.Main extends Backbone.View

	render: ->
		debugger
		@$el = HoganTemplates['app/templates/main'].render name: "World"
		@

Views()
