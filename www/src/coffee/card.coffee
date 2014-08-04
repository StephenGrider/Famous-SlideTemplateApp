class Card 
  constructor: ->
    mainContext = Famous.Engine.createContext()

    logo = new Famous.ImageSurface
      size: [200, 200]
      content: 'http://code.famo.us/assets/famous_logo.svg'
      classes: ['double-sided']

    initialTime = Date.now()
    centerSpin = new Famous.Modifier
      origin: [0.5, .5]
      transform: ->
        Famous.Transform.rotateY(.002 * (Date.now() - initialTime))

    mainContext.add(centerSpin).add(logo)
