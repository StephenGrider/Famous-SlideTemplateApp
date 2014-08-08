class Slidey.Views.CardView extends Famous.View
  constructor: (options) ->
    @model = options.model
    @addView()
    @showSurface()

  addView: ->
    @view = new Famous.View()

  showSurface: ->
    surface = new Famous.Surface
      content: @model.get('content')
      origin: [.5, .5]
      size: [150,150]
      classes: ['card']
      textAlign: 'center'

    draggable = new Famous.Modifiers.Draggable
      xRange: [-100, 200]
      yRange: [-100, 200]

    surface.pipe(draggable)

    mod = new Famous.Modifiers.StateModifier

    trans = {
      method: 'snap',
      period: 300,
      dampingRatio: 0.3,
      velocity: 0
    }

    @view.add(mod).add(draggable).add(surface)

    surface.on('click', =>
      @view.trigger('card:exit')
    )
