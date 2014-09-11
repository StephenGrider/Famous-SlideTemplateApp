$ = require('jquery')
Backbone = require('backbone')
Backbone.$ = $
CardsCollection = require('./collections/cards')
MainView = require('./views/main-view')


context = require('famous/core/engine').createContext()
collection = new CardsCollection
mainView = new MainView(collection: collection)
context.add(mainView)
