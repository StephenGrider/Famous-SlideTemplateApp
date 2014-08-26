CardStack = require('./card-stack')
ImageSurface = require('famous/surfaces/imagesurface')
Modifier = require('famous/modifiers/statemodifier')
Menu = require('./menu')

class MainView extends require('famous/views/headerfooterlayout')

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
      
    @header.add menu

  createContent: ->
    content = new CardStack(collection: @collection)

    content.on('card:enter', @onCardEnter)

    @content.add(content)

  createBackground: (model) ->
    @background = new ImageSurface
      origin: [0, .5]
      size: [undefined, undefined]
      classes: ['background-image']
      textAlign: 'center'

    mod = new Modifier
      opacity: .9

    @content.add(mod).add(@background)

  setBackground: (model) ->
    @background.setContent(model.getImageSrc())


  #
  # Events

  onCardEnter: (model) =>
    @setBackground(model)


module.exports = MainView
