class Slidey.Views.CardStackView extends Famous.Views.RenderController

  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection
    @collection.on('add', @onCardAdd)

    @collection.addOne()
    # @showCards()

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
    @show(cardView)

  onCardExit: (cardModel) =>
    @hide()
    @collection.addOne()
