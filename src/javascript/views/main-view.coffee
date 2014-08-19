CardStack = require('./card-stack')
ImageSurface = require('famous/surfaces/imagesurface')
Modifier = require('famous/modifiers/statemodifier')

class MainView extends require('famous/core/view')

  #
  # Init

  constructor: (options) ->
    super
    @collection = options.collection
    # @layout = new Famous.Views.HeaderFooterLayout
    #   headerSize: 50
    #   footerSize: 50


    # @createHeader()
    @createContent()
    @createBackground()
    # @createFooter()


  #
  # Control

  createHeader: ->
    # surface = new Famous.Surface()
    #
    # @layout.add(new Famous.Surface())

  createContent: ->
    content = new CardStack(collection: @collection)

    content.on('card:enter', @onCardEnter)

    @add(content)

  # createFooter: ->
  #   footer = new Slidey.Views.FooterGridView()
  #   @layout.footer.add(footer.view)

  createBackground: (model) ->
    @background = new ImageSurface
      origin: [0, .5]
      size: [undefined, undefined]
      classes: ['background-image']
      textAlign: 'center'

    mod = new Modifier
      opacity: .4


    @add(mod).add(@background)

  setBackground: (model) ->
    @background.setContent(model.getImageSrc())


  #
  # Events

  onCardEnter: (model) =>
    @setBackground(model)


module.exports = MainView
