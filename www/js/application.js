var MainView;

MainView = (function() {
  function MainView() {
    this.layout = new Famous.Views.HeaderFooterLayout({
      headerSize: 100,
      footerSize: 50
    });
    this.createContent();
    this.createFooter();
  }

  MainView.prototype.createHeader = function() {};

  MainView.prototype.createContent = function() {
    var content;
    content = new Famous.Surface({
      content: 'yeaaa'
    });
    return this.layout.content.add(content);
  };

  MainView.prototype.createFooter = function() {
    var footer;
    footer = new FooterGrid();
    return this.layout.footer.add(footer.layout);
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
  window.Famous.Views.GridLayout = require("famous/views/GridLayout");
  context = Famous.Engine.createContext();
  return context.add(new MainView().layout);
});

var FooterGrid;

FooterGrid = (function() {
  function FooterGrid() {
    this.surfaces = [];
    this.layout = new Famous.Views.GridLayout({
      dimensions: [3, 1]
    });
    this.layout.sequenceFrom(this.surfaces);
    this.buildSequence();
  }

  FooterGrid.prototype.buildSequence = function() {
    var surface;
    surface = new Famous.Surface({
      content: 'sup',
      size: [void 0, void 0],
      textAlign: 'center'
    });
    return this.surfaces.push(surface);
  };

  return FooterGrid;

})();
