define( (require, exports, module) ->
  window.Famous ?= {}
  window.Famous.Views = {}
  window.Famous.Engine = require('famous/core/Engine')
  window.Famous.Surface = require('famous/core/Surface')
  window.Famous.Modifier = require('famous/core/Modifier')
  window.Famous.Transform = require('famous/core/Transform')
  window.Famous.ImageSurface = require('famous/surfaces/ImageSurface')
  window.Famous.StateModifier = require('famous/modifiers/StateModifier')
  window.Famous.Easing = require('famous/transitions/Easing')
  window.Famous.Views.HeaderFooterLayout = require("famous/views/HeaderFooterLayout")

  context = Famous.Engine.createContext()
  context.add(new MainView().layout)
)
