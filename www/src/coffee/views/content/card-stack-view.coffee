class Slidey.Views.CardStackView
  constructor: (options) ->
    @collection = options.collection
    @view = new Famous.View()

    @showCards()


  showCards: ->
    for model in @collection.models
      card = new Slidey.Views.CardView(model: model)
      @view.add(card.view)
