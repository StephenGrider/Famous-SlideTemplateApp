Card = require('../models/card')
Backbone = require('Backbone')
API_KEY = require('../API_KEY')
_ = require('underscore')

class Cards extends Backbone.Collection
  model: Card
  urlRoot: "https://api.imgur.com/3/gallery/r/"
  url: "https://api.imgur.com/3/gallery/r/funny/time/day/"
  category: 'funny'
  page: 1

  initialize: ->
    @on('sync', @prefetchImages)
    @on('remove', @shouldGetNextPage)
    @on('change:category', @onCategoryChange)

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
    
  shouldGetNextPage: (options) =>
    if @length < 15 && !@fetching
      @getNextPage()
      
  onCategoryChange: =>
    @page = 1
    @getNextPage(reset: true)
      
  getNextPage: (options = {}) =>
    @fetching = true
    
    @page++
    
    fetchOptions = 
       headers: {Authorization :"Client-ID #{API_KEY}"} 
       url: "#{@urlRoot}#{@category}/time/day/#{@page}"
       
    options = _.extend(options, fetchOptions)

    @fetch(options)
      .always( => @fetching = false)


module.exports = Cards
