class Slidey.Views.CardInteriorView extends Famous.View

  #
  # Init

  constructor: (options) ->
    super
    @model = options.model

    @showCardImage()
    @showCardAnnotation()
    # @sequenceFrom([@showCardImage(), @showCardAnnotation()])


  #
  # Control

  showCardImage: ->
    surface = new Famous.ImageSurface
      content: @model.getImageSrc()
      origin: [0, .5]
      size: [undefined, 350]
      classes: ['card']
      textAlign: 'center'
      
    surface.pipe(@._eventOutput)
    @add(surface)

  showCardAnnotation: ->
    surface = new Famous.Surface
      content: @model.get('title')
      size: [undefined, 50]
      classes: ['card-description']

    state = new Famous.StateModifier
      align: [.5, .8]
      origin: [.5, .5]

    @add(state).add(surface)
