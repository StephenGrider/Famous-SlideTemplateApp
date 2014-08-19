RenderController = require('famous/views/rendercontroller')
Card = require('./card')

class CardStackView extends RenderController

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
    cardView = new Card(model: @collection.first())
    cardView.on('card:exit', @onCardExit)
    @_eventOutput.emit('card:enter', @collection.first())
    @show(cardView)


  #
  # Events

  onCardExit: (cardModel) =>
    @collection.remove(cardModel)
    @addCard()
    console.log @collection
    @collection.pop()


module.exports = CardStackView
