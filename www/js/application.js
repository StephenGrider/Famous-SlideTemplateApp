setTimeout(function() {
  var card1, card2, collection, context, mainView;
  context = Famous.Engine.createContext();
  card1 = new Slidey.Models.Card();
  card2 = new Slidey.Models.Card();
  collection = new Slidey.Collections.Cards();
  mainView = new Slidey.Views.MainView({
    collection: collection
  });
  return context.add(mainView.layout);
}, 100);

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Slidey.Models.Card = (function(_super) {
  __extends(Card, _super);

  function Card() {
    return Card.__super__.constructor.apply(this, arguments);
  }

  Card.prototype.getImageSrc = function() {
    return this.get('link').replace('.jpg', 'm.jpg').replace('.png', 'm.png');
  };

  return Card;

})(Backbone.Model);

Slidey.Collections.Cards = (function(_super) {
  __extends(Cards, _super);

  function Cards() {
    this.getMore = __bind(this.getMore, this);
    this.prefetchImages = __bind(this.prefetchImages, this);
    return Cards.__super__.constructor.apply(this, arguments);
  }

  Cards.prototype.model = Slidey.Models.Card;

  Cards.prototype.page = 0;

  Cards.prototype.url = "https://api.imgur.com/3/gallery/random/random/1";

  Cards.prototype.initialize = function() {
    this.on('sync', (function(_this) {
      return function() {
        return _this.prefetchImages();
      };
    })(this));
    return this.on('remove', this.getMore);
  };

  Cards.prototype.parse = function(response) {
    return response.data;
  };

  Cards.prototype.filterModels = function(image) {
    var aspectRatio;
    aspectRatio = image.get('width') / image.get('height');
    if (aspectRatio > .5 && aspectRatio < 2) {
      return true;
    }
  };

  Cards.prototype.prefetchImages = function() {
    var image, index, _i, _len, _ref, _results;
    this.set(this.filter(this.filterModels));
    _ref = this.models;
    _results = [];
    for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
      image = _ref[index];
      if (!image) {
        break;
      }
      if (image.get('is_album')) {
        _results.push(this.remove(image));
      } else {
        _results.push((new Image).src = image.getImageSrc());
      }
    }
    return _results;
  };

  Cards.prototype.getMore = function() {
    if (this.length < 10) {
      return this.fetch();
    }
  };

  return Cards;

})(Backbone.Collection);

var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Slidey.Views.MainView = (function() {
  function MainView(options) {
    this.onCardEnter = __bind(this.onCardEnter, this);
    this.collection = options.collection;
    this.layout = new Famous.Views.HeaderFooterLayout({
      headerSize: 50,
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
    content.on('card:enter', this.onCardEnter);
    return this.layout.content.add(content);
  };

  MainView.prototype.createFooter = function() {
    var footer;
    footer = new Slidey.Views.FooterGridView();
    return this.layout.footer.add(footer.view);
  };

  MainView.prototype.createBackground = function() {
    var surface;
    return surface = new Famous.ImageSurface({
      content: this.model.getImageSrc(),
      origin: [0, .5],
      size: [void 0, 350],
      classes: ['card'],
      textAlign: 'center'
    });
  };

  MainView.prototype.setBackground = function() {};

  MainView.prototype.onCardEnter = function(model) {
    return this.layout.content.add();
  };

  return MainView;

})();

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Slidey.Views.Spinner = (function(_super) {
  __extends(Spinner, _super);

  function Spinner() {
    Spinner.__super__.constructor.call(this, {
      content: 'asdf'
    });
  }

  return Spinner;

})(Famous.Surface);

var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Slidey.Views.CardInteriorView = (function(_super) {
  __extends(CardInteriorView, _super);

  function CardInteriorView(options) {
    CardInteriorView.__super__.constructor.apply(this, arguments);
    this.model = options.model;
    this.showCardImage();
    this.showCardAnnotation();
  }

  CardInteriorView.prototype.showCardImage = function() {
    var surface;
    surface = new Famous.ImageSurface({
      content: this.model.getImageSrc(),
      origin: [0, .5],
      size: [void 0, 350],
      classes: ['card'],
      textAlign: 'center'
    });
    surface.pipe(this._eventOutput);
    return this.add(surface);
  };

  CardInteriorView.prototype.showCardAnnotation = function() {
    var state, surface;
    surface = new Famous.Surface({
      content: this.model.get('title'),
      size: [void 0, 50],
      classes: ['card-description']
    });
    state = new Famous.StateModifier({
      align: [.5, .8],
      origin: [.5, .5]
    });
    return this.add(state).add(surface);
  };

  return CardInteriorView;

})(Famous.View);

var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Slidey.Views.CardStackView = (function(_super) {
  __extends(CardStackView, _super);

  function CardStackView(options) {
    this.onCardExit = __bind(this.onCardExit, this);
    this.addCard = __bind(this.addCard, this);
    CardStackView.__super__.constructor.apply(this, arguments);
    this.collection = options.collection;
    this.loadData();
  }

  CardStackView.prototype.loadData = function() {
    return this.collection.fetch({
      headers: {
        'Authorization': 'Client-ID 890346a61c2ad1d'
      }
    }).done(this.addCard).fail(function() {
      return console.log('card fetch fail');
    });
  };

  CardStackView.prototype.addCard = function() {
    var cardView;
    cardView = new Slidey.Views.CardView({
      model: this.collection.first()
    });
    cardView.on('card:exit', this.onCardExit);
    this._eventOutput.emit('card:enter', this.collection.first());
    this.show(cardView);
    return console.log(this.collection);
  };

  CardStackView.prototype.onCardExit = function(cardModel) {
    this.collection.remove(cardModel);
    return this.addCard();
  };

  return CardStackView;

})(Famous.Views.RenderController);

var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Slidey.Views.CardView = (function(_super) {
  __extends(CardView, _super);

  function CardView(options) {
    this.onDragUpdate = __bind(this.onDragUpdate, this);
    CardView.__super__.constructor.apply(this, arguments);
    this.model = options.model;
    this.showSurface();
  }

  CardView.prototype.showSurface = function() {
    var cardInterior;
    cardInterior = new Slidey.Views.CardInteriorView({
      model: this.model,
      dimensions: [1, 2]
    });
    this.draggable = new Famous.Modifiers.Draggable({
      xRange: [-200, 200],
      yRange: [-100, 200]
    });
    this.stateMod = new Famous.StateModifier({
      transform: Famous.Transform.rotateZ(0),
      origin: [.5, 0]
    });
    cardInterior.pipe(this.draggable);
    this.draggable.on('end', (function(_this) {
      return function() {
        return _this.onDragEnd(_this.draggable);
      };
    })(this));
    this.draggable.on('update', this.onDragUpdate);
    return this.add(this.stateMod).add(this.draggable).add(cardInterior);
  };

  CardView.prototype.resetPosition = function() {
    var trans;
    trans = {
      curve: 'easeOutBounce',
      duration: 500
    };
    this.draggable.setPosition([0, 0, 0], trans);
    return this.stateMod.setTransform(Famous.Transform.identity, trans);
  };

  CardView.prototype.cardExit = function(direction) {
    var trans;
    trans = {
      curve: 'easeOutBounce',
      duration: 3000
    };
    this._eventOutput.emit('card:exit', this.model);
    if (direction === 'left') {
      this.draggable.setPosition([-600, 0, 0], trans);
    }
    if (direction === 'right') {
      return this.draggable.setPosition([600, 0, 0], trans);
    }
  };

  CardView.prototype.onDragUpdate = function() {
    return this.stateMod.setTransform(Famous.Transform.rotateZ(this.draggable.getPosition()[0] / 800));
  };

  CardView.prototype.onDragEnd = function(draggable) {
    var distance;
    this.draggable = draggable;
    distance = this.draggable.getPosition()[0];
    if (distance > 150) {
      return this.cardExit('right');
    } else if (distance < -150) {
      return this.cardExit('left');
    } else {
      return this.resetPosition();
    }
  };

  return CardView;

})(Famous.View);

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


