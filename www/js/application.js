Slidey.Views.MainView = (function() {
  function MainView() {
    this.layout = new Famous.Views.HeaderFooterLayout({
      headerSize: 100,
      footerSize: 50
    });
    this.createContent();
    this.createFooter();
    window.a = this;
  }

  MainView.prototype.createHeader = function() {};

  MainView.prototype.createContent = function() {
    var content;
    content = new Slidey.Views.CardStackView;
    return this.layout.content.add(content.view);
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
    window.Famous = {
      Modifiers: {}
    };
  }
  window.Famous.Views = {};
  window.Famous.Engine = require('famous/core/Engine');
  window.Famous.Surface = require('famous/core/Surface');
  window.Famous.Modifier = require('famous/core/Modifier');
  window.Famous.Modifiers.Draggable = require("famous/modifiers/Draggable");
  window.Famous.Modifiers.StateModifier = require("famous/modifiers/StateModifier");
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

Slidey.Views.CardStackView = (function() {
  function CardStackView() {
    this.view = new Famous.View();
    this.showCards();
  }

  CardStackView.prototype.showCards = function() {
    var card, i, _i, _results;
    _results = [];
    for (i = _i = 0; _i <= 3; i = ++_i) {
      card = new Slidey.Views.CardView;
      card.view.on('card:exit', this.onCardExit);
      _results.push(this.view.add(card.view));
    }
    return _results;
  };

  CardStackView.prototype.onCardExit = function() {
    return console.log('recorded exit!');
  };

  return CardStackView;

})();

Slidey.Views.CardView = (function() {
  function CardView() {
    this.addView();
    this.showSurface();
  }

  CardView.prototype.addView = function() {
    return this.view = new Famous.View();
  };

  CardView.prototype.showSurface = function() {
    var draggable, mod, surface, trans;
    surface = new Famous.Surface({
      content: 'im a card',
      origin: [.5, .5],
      size: [150, 150],
      classes: ['card'],
      textAlign: 'center'
    });
    draggable = new Famous.Modifiers.Draggable({
      xRange: [-100, 200],
      yRange: [-100, 200]
    });
    surface.pipe(draggable);
    mod = new Famous.Modifiers.StateModifier;
    trans = {
      method: 'snap',
      period: 300,
      dampingRatio: 0.3,
      velocity: 0
    };
    this.view.add(mod).add(draggable).add(surface);
    return surface.on('click', (function(_this) {
      return function() {
        return _this.view.trigger('card:exit');
      };
    })(this));
  };

  return CardView;

})();

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


