class Views.Game extends Backbone.View
  GAME_TYPES = [
    {name: "8-Ball", type: "EightBall"}
  ]
  # Backbone
  events:
    'click #back': 'back'

  render: ->
    @$el.html HoganTemplates['app/templates/game'].render(
      gameTypes: GAME_TYPES
    )
    @

  # Actions
  back: ->
    @navigationController.popView()

