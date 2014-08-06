class Slidey.Views.FooterGridView
  constructor: ->
    @view = new Famous.View()
    @surfaces = []

    @gridLayout = new Famous.Views.GridLayout
      dimensions: [3,1]
    @gridLayout.sequenceFrom(@surfaces)

    @view.add(@gridLayout)

    @buildSequence()

  buildSequence: ->
    surface1 = new Famous.Surface
      content: 'sup'
      origin: [.5, .5]
      size: [undefined, undefined]
      textAlign: 'center'

    surface2 = new Famous.Surface
      content: 'yo'
      origin: [.5, .5]
      size: [undefined, undefined]
      textAlign: 'center'

    surface3 = new Famous.Surface
      content: 'blah'
      origin: [.5, .5]
      size: [undefined, undefined]
      textAlign: 'center'

    @surfaces.push(surface1)
    @surfaces.push(surface2)
    @surfaces.push(surface3)
