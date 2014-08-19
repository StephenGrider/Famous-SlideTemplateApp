ImageSurface = require('famous/surfaces/ImageSurface')
Surface = require('famous/core/surface')
StateModifier = require('famous/modifiers/statemodifier')

class CardInteriorView extends require('famous/core/view')

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
    surface = new ImageSurface
      content: @model.getImageSrc()
      origin: [0, .5]
      size: [undefined, 425]
      classes: ['card']
      textAlign: 'center'

    surface.pipe(@._eventOutput)
    @add(surface)

  showCardAnnotation: ->
    surface = new Surface
      content: @model.get('title')
      size: [undefined, 50]
      classes: ['card-description']

    state = new StateModifier
      align: [.5, .9]
      origin: [.5, .5]

    @add(state).add(surface)


module.exports = CardInteriorView
