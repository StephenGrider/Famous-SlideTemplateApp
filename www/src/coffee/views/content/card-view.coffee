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
    cardInterior = new Slidey.Views.CardInteriorView
      model: @model
      dimensions: [1,2]

    @draggable = new Famous.Modifiers.Draggable
      xRange: [-200, 200]
      yRange: [-100, 200]

    @stateMod = new Famous.StateModifier
      transform: Famous.Transform.rotateZ(0)
      origin: [.5, 0]

    cardInterior.pipe(@draggable)

    @draggable.on('end', => @onDragEnd(@draggable))
    @draggable.on('update', @onDragUpdate)

    @.add(@stateMod).add(@draggable).add(cardInterior)

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
