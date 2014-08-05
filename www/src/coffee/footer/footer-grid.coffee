class FooterGrid
  constructor: ->
    @surfaces = []

    @layout = new Famous.Views.GridLayout
      dimensions: [3,1]
    @layout.sequenceFrom(@surfaces)

    @buildSequence()

  buildSequence: ->
    surface = new Famous.Surface
      content: 'sup'
      size: [undefined, undefined]
      textAlign: 'center'

    @surfaces.push(surface)
