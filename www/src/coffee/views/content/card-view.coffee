class Slidey.Views.CardView extends Famous.View

  #
  # Init

  constructor: (options) ->
    super
    @model = options.model
    @showSurface()


  #
  # Control

  showSurface: ->
    @surface = new Famous.Surface
      content: @model.get('content')
      origin: [.5, .5]
      size: [undefined,200]
      classes: ['card']
      textAlign: 'center'

    draggable = new Famous.Modifiers.Draggable
      xRange: [-200, 200]
      yRange: [-100, 200]

    @surface.pipe(draggable)
    draggable.on('end', => @onDragEnd(draggable))


    @add(draggable).add(@surface)


  #
  # Events

  onDragEnd: (draggable) ->
    trans = {curve : 'easeOutBounce', duration : 3000}

    if draggable.getPosition()[0] > 150
      @_eventOutput.emit('card:exit', this.model)
      draggable.setPosition([600,0,0], trans)
    else if draggable.getPosition()[0] < -150
      @_eventOutput.emit('card:exit', this.model)
      draggable.setPosition([-600,0,0], trans)
    else
      draggable.setPosition([0,0,0], trans)
