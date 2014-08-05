var MainView;

MainView = (function() {
  function MainView() {
    this.layout = new Famous.Views.HeaderFooterLayout({
      headerSize: 100,
      footerSize: 50
    });
    this.createContent();
  }

  MainView.prototype.createHeader = function() {};

  MainView.prototype.createContent = function() {
    var content;
    content = new Famous.Surface({
      content: 'yeaaa'
    });
    return this.layout.content.add(content);
  };

  return MainView;

})();

define(function(require, exports, module) {
  var context;
  if (window.Famous == null) {
    window.Famous = {};
  }
  window.Famous.Views = {};
  window.Famous.Engine = require('famous/core/Engine');
  window.Famous.Surface = require('famous/core/Surface');
  window.Famous.Modifier = require('famous/core/Modifier');
  window.Famous.Transform = require('famous/core/Transform');
  window.Famous.ImageSurface = require('famous/surfaces/ImageSurface');
  window.Famous.StateModifier = require('famous/modifiers/StateModifier');
  window.Famous.Easing = require('famous/transitions/Easing');
  window.Famous.Views.HeaderFooterLayout = require("famous/views/HeaderFooterLayout");
  context = Famous.Engine.createContext();
  return context.add(new MainView().layout);
});
