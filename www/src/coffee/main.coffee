define((require, exports, module) ->
  window.Famous ?= {
    Modifiers: {}
  }

  window.Backbone = require('backbone')

  window.Famous.Views = {}
  window.Famous.Engine = require('famous/core/Engine')
  window.Famous.Surface = require('famous/core/Surface')
  window.Famous.Modifier = require('famous/core/Modifier')
  window.Famous.Modifiers.Draggable = require("famous/modifiers/Draggable")
  window.Famous.Modifiers.StateModifier = require("famous/modifiers/StateModifier")

  window.Famous.Transform = require('famous/core/Transform')
  window.Famous.ImageSurface = require('famous/surfaces/ImageSurface')
  window.Famous.StateModifier = require('famous/modifiers/StateModifier')
  window.Famous.Easing = require('famous/transitions/Easing')
  window.Famous.Views.HeaderFooterLayout = require("famous/views/HeaderFooterLayout")
  window.Famous.Views.GridLayout = require("famous/views/GridLayout")
  window.Famous.View = require('famous/core/View')

  context = Famous.Engine.createContext()
  context.add(new Slidey.Views.MainView().layout)
)
