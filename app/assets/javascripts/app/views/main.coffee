class Views.Main extends Backbone.View
	# Backbone
	events:
		'click #play': 'play'

	render: ->
		@$el.html HoganTemplates['app/templates/main'].render name: "World"
		@

	# Actions
	hide: ->
		@$('.content').hide()

	show: ->
		@$('.content').show()

	play: ->
		gameView = new Views.Game
		@subView gameView.render()
		@hide()

	subView: (view) ->
		@$('#main-view').append view.$el
