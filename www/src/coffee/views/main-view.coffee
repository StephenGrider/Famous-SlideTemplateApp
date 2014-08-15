class Slidey.Views.MainView

  #
  # Init

  constructor: (options) ->
    @collection = options.collection
    @layout = new Famous.Views.HeaderFooterLayout
      headerSize: 50
      footerSize: 50


    # @createHeader()
    @createContent()
    @createFooter()


  #
  # Control

  createHeader: ->
    # surface = new Famous.Surface()
    #
    # @layout.add(new Famous.Surface())

  createContent: ->
    content = new Slidey.Views.CardStackView(collection: @collection)

    content.on('card:enter', @onCardEnter)

    @layout.content.add(content)

  createFooter: ->
    footer = new Slidey.Views.FooterGridView()
    @layout.footer.add(footer.view)

  createBackground: ->
    surface = new Famous.ImageSurface
      content: @model.getImageSrc()
      origin: [0, .5]
      size: [undefined, 350]
      classes: ['card']
      textAlign: 'center'

  setBackground: ->
    


  #
  # Events

  onCardEnter: (model) =>


    @layout.content.add()
