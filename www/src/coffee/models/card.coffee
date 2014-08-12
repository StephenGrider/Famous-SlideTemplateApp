class Slidey.Models.Card extends Backbone.Model
  initialize: ->
    @.set('content', Math.random())

  urlRoot: '/api/cards'


class Slidey.Collections.Cards extends Backbone.Collection
  model: Slidey.Models.Card
