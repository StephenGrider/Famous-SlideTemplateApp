Draggable = require('famous/modifiers/draggable')
StateModifier = require('famous/modifiers/statemodifier')
Transform = require('famous/core/transform')

class Pulldown extends require('famous/core/view')
  
  #
  # Properties
  
  defaults: 
    content: 'pull down for settings'
    classes: ['menu-bar']
    size: [undefined, 400]
  
  #
  # Init
  
  constructor: ->
    super(@defaults)
    
    @draggable = new Draggable
      xRange: [0, 0]
      yRange: [-300, 300]

    @stateMod = new StateModifier
      align: [.5, .05]
      origin: [.5, 0]
    
    this._eventInput.pipe(this.draggable)
    
    this._eventInput.on('click', -> console.log(123))
    this.draggable.on('click', -> console.log(456))
    window.a = this.draggable
    
    @draggable.on('end', @onDragEnd)
    @draggable.on('update', @onDragUpdate)
    
  resetPosition: ->
    trans = {curve : 'easeOutBounce', duration : 250}
    @draggable.setPosition([0,0,0], trans)
    @stateMod.setTransform(Transform.identity, trans)


  #
  # Events
  
  onDragUpdate: =>
  
  onDragEnd: =>
    distance = @draggable.getPosition()[1]

    if distance > 300
       @draggable.setOptions(yRange: [])
    else 
      @resetPosition()

module.exports = Pulldown