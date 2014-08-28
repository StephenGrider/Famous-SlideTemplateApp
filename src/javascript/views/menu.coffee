Surface = require('famous/core/surface')
MenuInterior = require('./menu-interior')
Pulldown = require('./components/pulldown')


class Menu extends require('famous/core/view')
  template: require('../templates/template')
    
  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection
    
    @createPulldown()
    
    

  #
  # Control  
  
  createPulldown: ->
    pulldown = new Pulldown
    
    @add(pulldown)
    
    surface = new Surface
      size: [undefined,30]
      content: 'hi there'
      classes: ['test']
    
    surface.pipe(pulldown._eventInput)
    pulldown.add(surface)
    
module.exports = Menu