class Slidey.Views.CardStackView
  constructor: ->
    @view = new Famous.View()

    for i in [0..3]
      card = new Slidey.Views.CardView
      @view.add(card.view)
