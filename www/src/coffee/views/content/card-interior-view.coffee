class Slidey.Views.CardInteriorView extends Famous.View
  constructor: (options) ->
    super
    @model = options.model
    @showCardInterior()


  showCardInterior: ->
    surface = new Famous.ImageSurface
      content: @model.getImageSrc()
      origin: [.5, .5]
      size: [undefined, 350]
      classes: ['card']
      textAlign: 'center'

    surface.pipe(@._eventOutput)

    @add(surface)
