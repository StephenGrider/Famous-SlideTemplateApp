Backbone = require 'Backbone'

class Card extends Backbone.Model
  getImageSrc: ->
    @get('link').replace('.jpg', 'm.jpg').replace('.png', 'm.png')


module.exports = Card
