class Slidey.Views.CardStackView extends Famous.Views.RenderController

  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection
    @collection.on('add', @addCard)

    @collection.fetch({ headers: {'Authorization' :'Client-ID 890346a61c2ad1d'} })

  #
  # Control

  addCard: =>
    cardView = new Slidey.Views.CardView(model: @collection.last())
    cardView.on('card:exit', @onCardExit)
    @show(cardView)


  #
  # Events

  onCardExit: (cardModel) =>
    cardModel.destroy()
    @addCard()
