class Slidey.Models.Card extends Backbone.Model
  initialize: ->
    @.set('content', Math.random())


class Slidey.Collections.Cards extends Backbone.Collection
  model: Slidey.Models.Card
