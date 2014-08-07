class Slidey.Views.CardStackView
  constructor: ->
    @view = new Famous.View()

    @showCards()


  showCards: ->
    for i in [0..3]
      card = new Slidey.Views.CardView
      card.view.on('card:exit', @onCardExit)
      @view.add(card.view)


  #
  # Events

  onCardExit: ->
    console.log('recorded exit!')
