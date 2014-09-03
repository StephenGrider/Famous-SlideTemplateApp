Surface = require('famous/core/surface')
GridLayout = require('famous/views/gridlayout')
StateModifier = require('famous/modifiers/statemodifier')

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
    stateMod = new StateModifier
      size: [undefined, 300]
    
    grid = new GridLayout
      dimensions: [2,2]

    surfaces = []
    grid.sequenceFrom(surfaces)
    
    for filter in @filters
      surface = new Surface
        content: filter.name
        classes: ['test']
      
      surface.filter = filter
      surfaces.push surface
      
      surface.pipe(@_eventOutput)
    
    @add(stateMod).add(grid)

module.exports = MenuInterior