_ = require('underscore')

class MenuButton extends require('famous/core/surface')
  constructor: (options) ->
    super
    @value = options.value
    @on('click', @onClick)
  
  spin: =>
  
  onClick: =>
    @emit('button:clicked', @value, this)
    

module.exports = MenuButton
    