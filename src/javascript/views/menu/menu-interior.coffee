Surface = require('famous/core/surface')
GridLayout = require('famous/views/gridlayout')

class MenuInterior extends require('famous/core/view')
  
  #
  # Properties
  
  filters:
    [
      {
        name: 'Everything'
        value: 'pics'
      },
      {
        name: 'Funny'
        value: 'funny'
      },
      {
        name: 'Mildly Interesting'
        value: 'mildlyinteresting'
      },
      {
        name: 'Gifs'
        value: 'gifs'
      }
    ]
  
  #
  # Init
  
  constructor: (options) ->
    super
    @collection = options.collection
    
    @createMenu()


  #
  # Control  
  
  createMenu: ->
    grid = new GridLayout
      dimensions: [2,2]
      
    surfaces = []
    grid.sequenceFrom(surfaces)
    
    for filter in @filters
      surface = new Surface
        size: [200, 200]
        content: filter.name
      
      surface.filter = filter
      surfaces.push surface
      
      surface.pipe(@_eventOutput)
    
    @add(grid)

module.exports = MenuInterior