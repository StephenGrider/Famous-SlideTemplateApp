setTimeout( ->
  context = Famous.Engine.createContext()

  #temp bootstrap data
  card1 = new Slidey.Models.Card()
  card2 = new Slidey.Models.Card() 

  collection = new Backbone.Collection([card1, card2])
  mainView = new Slidey.Views.MainView(collection: collection)
  context.add(mainView.layout)
, 100)
