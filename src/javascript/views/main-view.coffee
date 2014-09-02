CardStack = require('./cards/card-stack')
ImageSurface = require('famous/surfaces/imagesurface')
Modifier = require('famous/modifiers/statemodifier')
MenuInterior = require('./menu/menu-interior')
Slideout = require('./components/slideout')

class MainView extends require('famous/core/view')

  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection

    @createSlideout()
    @createContent()
    @createBackground()


  #
  # Control

  createContent: ->
    content = new CardStack(collection: @collection)

    content.on('card:enter', @onCardEnter)

    @add(content)
    
  createSlideout: ->
    slideout = new Slideout
    @add(slideout.stateMod).add(slideout)
    
    interior = new MenuInterior(collection: @collection)
    interior._eventOutput.pipe(slideout._eventInput)
    slideout.add(interior)

  createBackground: (model) ->
    @background = new ImageSurface
      origin: [0, .5]
      size: [undefined, undefined]
      classes: ['background-image']
      textAlign: 'center'

    mod = new Modifier
      opacity: .9

    @add(mod).add(@background)

  setBackground: (model) ->
    @background.setContent(model.getImageSrc())


  #
  # Events

  onCardEnter: (model) =>
    @setBackground(model)


module.exports = MainView
