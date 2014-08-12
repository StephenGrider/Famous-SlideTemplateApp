class Slidey.Views.CardStackView extends Famous.View

  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection
    @collection.on('card:added', @onCardAdd)
    window.b = @collection

    @showCards()

  #
  # Control

  showCards: ->
    for model in @collection.models
      cardView = new Slidey.Views.CardView(model: model)
      cardView.on('card:exit', @onCardExit)
      @add(cardView)


  #
  # Events

  onCardAdd: =>
    cardView = new Slidey.Views.CardView(model: @collection.last())
    cardView.on('card:exit', @onCardExit)
    @add(cardView)

  onCardExit: (cardModel) =>
    cardModel.destroy()
    @collection.addOne()
