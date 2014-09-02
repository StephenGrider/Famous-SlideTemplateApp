Surface = require('famous/core/surface')

class MenuInterior extends require('famous/core/view')
  
  constructor: (options) ->
    super
    @collection = options.collection
    
    @createMenuSettings()
    
    
  createMenuSettings: ->
    # view = new Surface
    #   align: [.5, 1]
    #   size: [undefined, 400]
    #   classes: ['test']
    #   content: @filterList.render().el
    # 
    # view.pipe(@._eventOutput)
    # @add(view)
    

module.exports = MenuInterior