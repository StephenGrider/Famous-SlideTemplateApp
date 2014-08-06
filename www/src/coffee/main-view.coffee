class Slidey.Views.MainView
  constructor: ->
    @layout = new Famous.Views.HeaderFooterLayout
      headerSize: 100
      footerSize: 50

    # @createHeader()
    @createContent()
    @createFooter()

  createHeader: ->
    # surface = new Famous.Surface()
    #
    # @layout.add(new Famous.Surface())

  createContent: ->
    content = new Famous.Surface
      content: 'yeaaa'

    @layout.content.add(content)

  createFooter: ->
    footer = new Slidey.Views.FooterGridView()

    @layout.footer.add(footer.view)
