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

    @draggable = new Famous.Modifiers.Draggable
      xRange: [-200, 200]
      yRange: [-100, 200]

    @stateMod = new Famous.StateModifier
      transform: Famous.Transform.rotateZ(0)

    surface.pipe(@draggable)
    @draggable.on('end', => @onDragEnd(@draggable))
    @draggable.on('update', =>
      @stateMod.setTransform(Famous.Transform.rotateZ(@draggable._positionState.state[0]/500))
    )

    @.add(@stateMod).add(@draggable).add(surface)

  resetPosition: ->
    trans = {curve : 'easeOutBounce', duration : 1500}
    @draggable.setPosition([0,0,0], trans)
    @stateMod.setTransform(Famous.Transform.identity, trans)

  #
  # Events

  onDragEnd: (@draggable) ->
    trans = {curve : 'easeOutBounce', duration : 3000}

    if @draggable.getPosition()[0] > 150
      @_eventOutput.emit('card:exit', this.model)
      @draggable.setPosition([600,0,0], trans)
    else if @draggable.getPosition()[0] < -150
      @_eventOutput.emit('card:exit', this.model)
      @draggable.setPosition([-600,0,0], trans)
    else
      @resetPosition()
