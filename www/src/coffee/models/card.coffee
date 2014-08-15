class Slidey.Models.Card extends Backbone.Model
  getImageSrc: ->
    @get('link').replace('.jpg', 'm.jpg').replace('.png', 'm.png')

class Slidey.Collections.Cards extends Backbone.Collection
  model: Slidey.Models.Card
  page: 0
  url: "https://api.imgur.com/3/gallery/random/random/1"

  initialize: ->
    @on('sync', => @prefetchImages())
    @on('remove', @getMore)

  parse: (response) ->
    response.data

  filterModels: (image) ->
    aspectRatio = image.get('width') / image.get('height')
    true if aspectRatio > .5 and aspectRatio < 2

  prefetchImages: =>
    @set(@filter(@filterModels))
    for image,index in @models
      break unless image

      if image.get('is_album')
        @remove(image)
      else
        (new Image).src = image.getImageSrc()

  getMore: =>
    if @length < 10
      @fetch()
