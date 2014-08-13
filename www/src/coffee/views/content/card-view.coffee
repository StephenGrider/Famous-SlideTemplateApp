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
      origin: [.5, 0]

    surface.pipe(@draggable)

    @draggable.on('end', => @onDragEnd(@draggable))
    @draggable.on('update', @onDragUpdate)

    @.add(@stateMod).add(@draggable).add(surface)

  resetPosition: ->
    trans = {curve : 'easeOutBounce', duration : 500}
    @draggable.setPosition([0,0,0], trans)
    @stateMod.setTransform(Famous.Transform.identity, trans)

  cardExit: (direction) ->
    trans = {curve : 'easeOutBounce', duration : 3000}

    @_eventOutput.emit('card:exit', this.model)
    @draggable.setPosition([-600,0,0], trans) if direction == 'left'
    @draggable.setPosition([600,0,0], trans) if direction == 'right'


  #
  # Events

  onDragUpdate: =>
    @stateMod.setTransform(Famous.Transform.rotateZ(@draggable.getPosition()[0]/800))

  onDragEnd: (@draggable) ->
    distance = @draggable.getPosition()[0]

    if distance > 150
      @cardExit('right')
    else if distance < -150
      @cardExit('left')
    else
      @resetPosition()
