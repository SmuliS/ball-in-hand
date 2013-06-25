class Views.NavigationController extends Backbone.View
	# Backbone
	# events:

	constructor: ->
		super()
		@navigationStack = []

	render: ->
		@$el.html HoganTemplates['app/templates/navigation_controller'].render()
		@

	# Actions
	renderTop: ->
		if @navigationStack.length
			topView = @navigationStack[@navigationStack.length-1]
			@$el.append topView.render().$el
		@

	pushView: (view) ->
		@navigationStack[@navigationStack.length-1].$el.detach() if @navigationStack.length
		view.navigationController = @
		@navigationStack.push view
		@$('.content').append view.render().$el

	popView: ->
		@navigationStack.pop().$el.detach()
		@renderTop()


