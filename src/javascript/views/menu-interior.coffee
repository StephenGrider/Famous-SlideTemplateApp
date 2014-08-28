Surface = require('famous/core/surface')

class MenuInterior extends require('famous/core/view')
  
  constructor: ->
    super
    @createInput()
    
  createInput: ->
    view = new Surface
      content: 'hithere'
      classes: ['test']
    
    view.pipe(@._eventOutput)
    @add(view)
  
  
module.exports = MenuInterior