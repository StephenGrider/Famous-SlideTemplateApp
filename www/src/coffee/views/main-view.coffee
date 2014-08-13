class Slidey.Views.MainView
  constructor: (options) ->
    @collection = options.collection
    @layout = new Famous.Views.HeaderFooterLayout
      headerSize: 50
      footerSize: 50


    # @createHeader()
    @createContent()
    @createFooter()

  createHeader: ->
    # surface = new Famous.Surface()
    #
    # @layout.add(new Famous.Surface())

  createContent: ->
    content = new Slidey.Views.CardStackView(collection: @collection)

    @layout.content.add(content)

  createFooter: ->
    footer = new Slidey.Views.FooterGridView()
    @layout.footer.add(footer.view)
