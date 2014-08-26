Surface = require('famous/core/surface')
InputSurface = require('famous/surfaces/inputsurface')

class MenuInterior extends require('famous/core/view')
  
  constructor: ->
    super
    @createInput()
    
  createInput: ->
    view = new InputSurface
      type: 'text'
      
    @add(view)
  
  
module.exports = MenuInterior