class Slidey.Models.Card extends Backbone.Model
  getImageSrc: ->
    @get('link').replace('.jpg', 'm.jpg').replace('.png', 'm.png')

class Slidey.Collections.Cards extends Backbone.Collection
  model: Slidey.Models.Card
  page: 0 
  url: "https://api.imgur.com/3/gallery/random/random/#{@page}"

  initialize: ->
    @on('sync', => @prefetchImages())
    @on('sync', @updatePage)

  parse: (response) ->
    response.data

  updatePage: =>
    @page++

  prefetchImages: =>
    for image,index in @models
      break unless image

      if image.get('is_album')
        image.destroy()
      else
        (new Image).src = image.getImageSrc()
