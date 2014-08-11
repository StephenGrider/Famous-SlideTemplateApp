class Slidey.Views.CardView extends Famous.View

  #
  # Init

  constructor: (options) ->
    super
    @model = options.model
    @showSurface()


  #
  # Control

  showSurface: ->
    surface = new Famous.Surface
      content: @model.get('content')
      origin: [.5, .5]
      size: [undefined,200]
      classes: ['card']
      textAlign: 'center'

    draggable = new Famous.Modifiers.Draggable
      xRange: [-200, 200]
      yRange: [-100, 200]

    surface.pipe(draggable)
    draggable.on('end', => @onDragEnd(draggable))

    @add(draggable).add(surface)


  #
  # Events

  onDragEnd: (draggable) ->
    if Math.abs(draggable.getPosition()[0]) > 150
      console.log('card exit')
    else
      draggable.setPosition([0,0,0],  {curve : 'easeOutBounce', duration : 300})
