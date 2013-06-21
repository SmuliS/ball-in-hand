class Views.Game extends Backbone.View
	# Backbone
	events:
		'click #back': 'back'

	render: ->
		@$el.html HoganTemplates['app/templates/game'].render()
		@

	# Actions
	back: ->
		@.remove()
		mainView.show()

