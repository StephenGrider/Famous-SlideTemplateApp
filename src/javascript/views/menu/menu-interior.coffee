_ = require('underscore')
Surface = require('famous/core/surface')
GridLayout = require('famous/views/gridlayout')
StateModifier = require('famous/modifiers/statemodifier')
MenuButton = require('./menu-button')
Transform = require('famous/core/transform')

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
    @createClose()


  #
  # Control  
  
  createMenu: ->
    stateMod = new StateModifier
      size: [undefined, 300]
    
    grid = new GridLayout
      dimensions: [2,2]

    @surfaces = []
    grid.sequenceFrom(@surfaces)
    
    for filter in @filters
      surface = new MenuButton
        value: filter.value
        content: filter.name
        classes: ['menu-button']

      
      surface.on('button:clicked', @onCategoryClick)
      surface.filter = filter
      @surfaces.push surface
    
    _.findWhere(@surfaces, content: 'Everything').addClass('selected')
    
    @add(stateMod).add(grid)
    
  createClose: ->
    stateMod = new StateModifier
      transform: Transform.translate(0, 300, 0)
    
    surface = new Surface
      size: [undefined, 200]
      content: 'Settings'
      classes: ['settings']
      
    surface.on('click', @onCloseClick)
      
    @add(stateMod).add(surface)

    
  #
  # Events
  
  onCloseClick: =>
    @_eventOutput.trigger('click')
  
  onCategoryClick: (category) =>
    _.each(@surfaces, (surface) -> surface.removeClass('selected'))
    _.findWhere(@surfaces, value: category).addClass('selected')
     
    @collection.category = category
    @collection.resetPageIndex()
    @collection.getNextPage()

module.exports = MenuInterior