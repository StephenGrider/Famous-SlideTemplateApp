setTimeout(function() {
  var card1, card2, collection, context, mainView;
  context = Famous.Engine.createContext();
  card1 = new Slidey.Models.Card();
  card2 = new Slidey.Models.Card();
  collection = new Slidey.Collections.Cards([card1]);
  mainView = new Slidey.Views.MainView({
    collection: collection
  });
  return context.add(mainView.layout);
}, 100);

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Slidey.Models.Card = (function(_super) {
  __extends(Card, _super);

  function Card() {
    return Card.__super__.constructor.apply(this, arguments);
  }

  Card.prototype.initialize = function() {
    return this.set('content', Math.random());
  };

  Card.prototype.urlRoot = '/api/cards';

  return Card;

})(Backbone.Model);

Slidey.Collections.Cards = (function(_super) {
  __extends(Cards, _super);

  function Cards() {
    return Cards.__super__.constructor.apply(this, arguments);
  }

  Cards.prototype.model = Slidey.Models.Card;

  return Cards;

})(Backbone.Collection);

Slidey.Views.MainView = (function() {
  function MainView(options) {
    this.collection = options.collection;
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
    content = new Slidey.Views.CardStackView({
      collection: this.collection
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



var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Slidey.Views.CardStackView = (function(_super) {
  __extends(CardStackView, _super);

  function CardStackView(options) {
    this.onCardExit = __bind(this.onCardExit, this);
    CardStackView.__super__.constructor.apply(this, arguments);
    this.collection = options.collection;
    this.showCards();
  }

  CardStackView.prototype.showCards = function() {
    var card, model, _i, _len, _ref, _results;
    _ref = this.collection.models;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      model = _ref[_i];
      card = new Slidey.Views.CardView({
        model: model
      });
      card.on('card:exit', this.onCardExit);
      _results.push(this.add(card));
    }
    return _results;
  };

  CardStackView.prototype.onCardExit = function(cardModel) {
    return console.log('cya', cardModel);
  };

  return CardStackView;

})(Famous.View);

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Slidey.Views.CardView = (function(_super) {
  __extends(CardView, _super);

  function CardView(options) {
    CardView.__super__.constructor.apply(this, arguments);
    this.model = options.model;
    this.showSurface();
  }

  CardView.prototype.showSurface = function() {
    var draggable;
    this.surface = new Famous.Surface({
      content: this.model.get('content'),
      origin: [.5, .5],
      size: [void 0, 200],
      classes: ['card'],
      textAlign: 'center'
    });
    draggable = new Famous.Modifiers.Draggable({
      xRange: [-200, 200],
      yRange: [-100, 200]
    });
    this.surface.pipe(draggable);
    draggable.on('end', (function(_this) {
      return function() {
        return _this.onDragEnd(draggable);
      };
    })(this));
    return this.add(draggable).add(this.surface);
  };

  CardView.prototype.onDragEnd = function(draggable) {
    var trans;
    trans = {
      curve: 'easeOutBounce',
      duration: 3000
    };
    if (draggable.getPosition()[0] > 150) {
      this._eventOutput.emit('card:exit', this.model);
      return draggable.setPosition([600, 0, 0], trans);
    } else if (draggable.getPosition()[0] < -150) {
      this._eventOutput.emit('card:exit', this.model);
      return draggable.setPosition([-600, 0, 0], trans);
    } else {
      return draggable.setPosition([0, 0, 0], trans);
    }
  };

  return CardView;

})(Famous.View);
