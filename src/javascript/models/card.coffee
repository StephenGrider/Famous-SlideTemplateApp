Backbone = require 'Backbone'

class Card extends Backbone.Model
  getImageSrc: ->
    @get('link').replace('.jpg', 'l.jpg').replace('.png', 'l.png')


module.exports = Card
