var Card;

Card = (function() {
  function Card() {
    var centerSpin, initialTime, logo, mainContext;
    mainContext = Famous.Engine.createContext();
    logo = new Famous.ImageSurface({
      size: [200, 200],
      content: 'http://code.famo.us/assets/famous_logo.svg',
      classes: ['double-sided']
    });
    initialTime = Date.now();
    centerSpin = new Famous.Modifier({
      origin: [0.5, .5],
      transform: function() {
        return Famous.Transform.rotateY(.002 * (Date.now() - initialTime));
      }
    });
    mainContext.add(centerSpin).add(logo);
  }

  return Card;

})();

define(function(require, exports, module) {
  if (window.Famous == null) {
    window.Famous = {};
  }
  window.Famous.Engine = require('famous/core/Engine');
  window.Famous.Surface = require('famous/core/Surface');
  window.Famous.Modifier = require('famous/core/Modifier');
  window.Famous.Transform = require('famous/core/Transform');
  window.Famous.ImageSurface = require('famous/surfaces/ImageSurface');
  return new Card();
});
