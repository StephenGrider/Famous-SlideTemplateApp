class Slidey.Views.MainView extends Famous.View

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
    content = new Slidey.Views.CardStackView(collection: @collection)

    content.on('card:enter', @onCardEnter)

    @add(content)

  createFooter: ->
    footer = new Slidey.Views.FooterGridView()
    @layout.footer.add(footer.view)

  createBackground: (model) ->
    @background = new Famous.ImageSurface
      origin: [0, .5]
      size: [undefined, undefined]
      classes: ['background-image']
      textAlign: 'center'

    mod = new Famous.StateModifier
      opacity: .4


    @add(mod).add(@background)

  setBackground: (model) ->
    @background.setContent(model.getImageSrc())



  #
  # Events

  onCardEnter: (model) =>
    @setBackground(model)
