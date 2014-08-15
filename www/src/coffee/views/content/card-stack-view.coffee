class Slidey.Views.CardStackView extends Famous.Views.RenderController

  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection

    @loadData()

  #
  # Control

  loadData: ->
    @collection.fetch({ headers: {'Authorization' :'Client-ID 890346a61c2ad1d'} })
      .done(@addCard)
      .fail(-> console.log 'card fetch fail')

  addCard: =>
    cardView = new Slidey.Views.CardView(model: @collection.first())
    cardView.on('card:exit', @onCardExit)
    @_eventOutput.emit('card:enter', @collection.first())
    @show(cardView)

    console.log(@collection)


  #
  # Events

  onCardExit: (cardModel) =>
    @collection.remove(cardModel)
    @addCard()
