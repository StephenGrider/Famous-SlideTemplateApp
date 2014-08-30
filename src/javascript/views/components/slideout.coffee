Draggable = require('famous/modifiers/draggable')
StateModifier = require('famous/modifiers/statemodifier')
Transform = require('famous/core/transform')

class Slideout extends require('famous/core/view')
  
  #
  # Properties
  
  open: false
  
  #
  # Init
  
  constructor: ->
    super()

    @stateMod = new StateModifier
      align: [.5, .05]
      origin: [.5, 1.0]
    
    this._eventInput.on('click', @onClick)
    
  closeSlideout: ->
    @open = false
    trans = curve: 'easeOutBounce', duration: 250
    @stateMod.setTransform(Transform.identity, trans)

  openSlideout: ->
    @open = true
    trans = curve: 'easeOutBounce', duration: 250
    @stateMod.setTransform(Transform.translate(0, 400, 10), trans)

  #
  # Events
  
  onClick: =>
    if @open then @closeSlideout() else @openSlideout()


module.exports = Slideout