Backbone = require('Backbone')

class Filter extends Backbone.View
  template: require('../../templates/menu') 
  
  events:
    'change select' : 'onChangeSelect'
  
  render: ->
    @$el.html(@template())
    this
    
    
  onChangeSelect: ->
    @collection.category = this.$el.find('option:selected').attr('value')
    @collection.trigger('change:category')
    
module.exports = Filter