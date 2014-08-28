Draggable = require('famous/modifiers/draggable')
StateModifier = require('famous/modifiers/statemodifier')
Transform = require('famous/core/transform')

class Slideout extends require('famous/core/view')
  
  #
  # Properties
  
  open: false
  
  defaults: 
    content: 'pull down for settings'
    classes: ['menu-bar']
    size: [undefined, 400]
  
  #
  # Init
  
  constructor: ->
    super(@defaults)

    @stateMod = new StateModifier
      align: [.5, .05]
      origin: [.5, 0]
    
    this._eventInput.on('click', @onClick)
    
  closeMenu: ->
    @open = false
    trans = curve: 'easeOutBounce', duration: 250
    @stateMod.setTransform(Transform.identity, trans)

  openMenu: ->
    @open = true
    trans = curve: 'easeOutBounce', duration: 250
    @stateMod.setTransform(Transform.translate(0, 400, 10), trans)

  #
  # Events
  
  onClick: =>
    if @open then @closeMenu() else @openMenu()


module.exports = Slideout