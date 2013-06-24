class Views.Main extends Backbone.View
	events:
		"click #play": "play"

	render: ->
		@$el.html HoganTemplates['app/templates/main_view'].render()
		@

	play: ->
		@navigationController.pushView new Views.Game

