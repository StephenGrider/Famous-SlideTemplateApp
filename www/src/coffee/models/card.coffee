class Slidey.Models.Card extends Backbone.Model
  getImageSrc: ->
    @get('link').replace('.jpg', 'm.jpg')

class Slidey.Collections.Cards extends Backbone.Collection
  model: Slidey.Models.Card
  url: "https://api.imgur.com/3/gallery/random/random/#{@page}"
  page: 0

  initialize: ->
    @on('sync', => @prefetchImages(0))
    @on('sync', @updatePage)

  parse: (response) ->
    response.data

  updatePage: =>
    @page++

  prefetchImages: (index) =>
    for image,index in @models
      setTimeout((-> (new Image).src = image.getImageSrc()), index * 300)
