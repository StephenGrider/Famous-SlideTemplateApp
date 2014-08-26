Surface = require('famous/core/surface')
MenuInterior = require('./menu-interior')
Draggable = require('famous/modifiers/draggable')
StateModifier = require('famous/modifiers/statemodifier')
Transform = require('famous/core/transform')

class Menu extends require('famous/core/view')
  template: require('../templates/template')
    
  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection
    
    @createMenuInterior()
    
  #
  # Control
  
  createMenuInterior: ->
    view = new Surface
      collection: @collection
      content: 'pull down for settings'
      classes: ['menu-bar']
      size: [undefined, 40]
    
    @draggable = new Draggable
      xRange: [0, 0]
      yRange: [0, 500]

    @stateMod = new StateModifier
      transform: Transform.rotateZ(0)
      align: [.5, .05]
      origin: [.5, 0]
    
    view.pipe(@draggable)
    @draggable.on('end', @onDragEnd)
    
    @add(@stateMod).add(@draggable).add(view)


  #
  # Events
  
  onDragEnd: =>
    console.log('drag end')

    
module.exports = Menu