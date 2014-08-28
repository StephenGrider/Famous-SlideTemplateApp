Surface = require('famous/core/surface')
MenuInterior = require('./menu-interior')
Slideout = require('./components/slideout')


class Menu extends require('famous/core/view')
  template: require('../templates/template')
    
  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection
    
    @createSlideout()
    

  #
  # Control  
  
  createSlideout: ->
    slideout = new Slideout
    
    @add(slideout.stateMod).add(slideout)
    
    interior = new MenuInterior
      
    interior._eventOutput.pipe(slideout._eventInput)
    slideout.add(interior)
    
module.exports = Menu