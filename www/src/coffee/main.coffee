define( (require, exports, module) ->
  window.Famous ?= {}
  window.Famous.Engine = require('famous/core/Engine')
  window.Famous.Surface = require('famous/core/Surface')
  window.Famous.Modifier = require('famous/core/Modifier')
  window.Famous.Transform = require('famous/core/Transform')
  window.Famous.ImageSurface = require('famous/surfaces/ImageSurface')

  new Card()
)
