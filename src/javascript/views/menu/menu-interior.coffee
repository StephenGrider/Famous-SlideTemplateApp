Surface = require('famous/core/surface')

class MenuInterior extends require('famous/core/view')
  template: require('../../templates/menu') 
  
  constructor: ->
    super
    @createMenuSettings()
    
  createMenuSettings: ->
    view = new Surface
      align: [.5, 1]
      size: [undefined, 400]
      classes: ['test']
      content: @template()
    
    view.pipe(@._eventOutput)
    @add(view)
    
    debugger
    
  
  
  
module.exports = MenuInterior