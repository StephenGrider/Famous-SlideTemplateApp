class Slidey.Views.CardStackView extends Famous.View
  constructor: (options) ->
    super
    @collection = options.collection

    @showCards()


  showCards: ->
    for model in @collection.models
      card = new Slidey.Views.CardView(model: model)
      @add(card)
