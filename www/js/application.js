Slidey.Views.MainView = (function() {
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
    footer = new Slidey.Views.FooterGridView();
    return this.layout.footer.add(footer.view);
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
  window.Famous.View = require('famous/core/View');
  context = Famous.Engine.createContext();
  return context.add(new Slidey.Views.MainView().layout);
});

Slidey.Views.FooterGridView = (function() {
  function FooterGridView() {
    this.view = new Famous.View();
    this.surfaces = [];
    this.gridLayout = new Famous.Views.GridLayout({
      dimensions: [3, 1]
    });
    this.gridLayout.sequenceFrom(this.surfaces);
    this.view.add(this.gridLayout);
    this.buildSequence();
  }

  FooterGridView.prototype.buildSequence = function() {
    var surface1, surface2, surface3;
    surface1 = new Famous.Surface({
      content: 'sup',
      origin: [.5, .5],
      size: [void 0, void 0],
      textAlign: 'center'
    });
    surface2 = new Famous.Surface({
      content: 'yo',
      origin: [.5, .5],
      size: [void 0, void 0],
      textAlign: 'center'
    });
    surface3 = new Famous.Surface({
      content: 'blah',
      origin: [.5, .5],
      size: [void 0, void 0],
      textAlign: 'center'
    });
    this.surfaces.push(surface1);
    this.surfaces.push(surface2);
    return this.surfaces.push(surface3);
  };

  return FooterGridView;

})();


