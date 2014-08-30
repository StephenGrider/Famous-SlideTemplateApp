Card = require('../models/card')
Backbone = require('Backbone')
API_KEY = require('../API_KEY')

class Cards extends Backbone.Collection
  model: Card
  url: "https://api.imgur.com/3/gallery/r/funny/time/day/"
  page: 1

  initialize: ->
    @on('sync', => @prefetchImages())
    @on('remove', @getNextPage)

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
    
  getNextPage: (options) =>
    if @length < 15 && !@fetching
      @fetching = true
      
      @page++
      
      options = 
         headers: {Authorization :"Client-ID #{API_KEY}"} 
         url: @url + @page
      
      @fetch(options)
        .always( => @fetching = false)


module.exports = Cards
