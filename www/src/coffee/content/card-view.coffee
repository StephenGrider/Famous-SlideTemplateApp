class Slidey.Views.CardView
  constructor: ->
    @addView()
    @showSurface()

  addView: ->
    @view = new Famous.View()

  showSurface: ->
    surface = new Famous.Surface
      content: 'im a card'
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

    surface.on('end', ->
      console.log('done')
      draggable.setPosition([0,0,0], trans)
    )

    @view.add(mod).add(draggable).add(surface)

    surface.on('click', ->
      console.log('hi')
    )
