CardStack = require('./cards/card-stack')
ImageSurface = require('famous/surfaces/imagesurface')
Modifier = require('famous/modifiers/statemodifier')
Menu = require('./menu/menu')

class MainView extends require('famous/core/view')

  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection

    @createMenu()
    @createContent()
    @createBackground()


  #
  # Control

  createMenu: ->
    menu = new Menu(collection: @collection)
      
    @add menu

  createContent: ->
    content = new CardStack(collection: @collection)

    content.on('card:enter', @onCardEnter)

    @add(content)

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
