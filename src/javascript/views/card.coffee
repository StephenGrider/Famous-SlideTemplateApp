CardInterior = require('./card-interior')
Draggable = require('famous/modifiers/draggable')
StateModifier = require('famous/modifiers/statemodifier')
Transform = require('famous/core/transform')

class CardView extends require('famous/core/view')

  #
  # Init

  constructor: (options) ->
    super
    @model = options.model
    @showSurface()


  #
  # Control

  showSurface: ->
    cardInterior = new CardInterior
      model: @model
      dimensions: [1,2]

    @draggable = new Draggable
      xRange: [-200, 200]
      yRange: [-500, 500]

    @stateMod = new StateModifier
      transform: Transform.rotateZ(0)
      align: [.5, .05]
      origin: [.5, 0]

    cardInterior.pipe(@draggable)

    @draggable.on('end', @onDragEnd)
    @draggable.on('update', @onDragUpdate)

    @.add(@stateMod).add(@draggable).add(cardInterior)

  resetPosition: ->
    trans = {curve : 'easeOutBounce', duration : 500}
    @draggable.setPosition([0,0,0], trans)
    @stateMod.setTransform(Transform.identity, trans)

  cardExit: (direction) ->
    trans = {curve : 'easeOutBounce', duration : 1500}

    @_eventOutput.emit('card:exit', this.model)
    @draggable.setPosition([-600,0,0], trans) if direction == 'left'
    @draggable.setPosition([600,0,0], trans) if direction == 'right'


  #
  # Events

  onDragUpdate: =>
    @stateMod.setTransform(Transform.rotateZ(@draggable.getPosition()[0]/800))

  onDragEnd: =>
    distance = @draggable.getPosition()[0]

    if distance > 150
      @cardExit('right')
    else if distance < -150
      @cardExit('left')
    else
      @resetPosition()


module.exports = CardView
