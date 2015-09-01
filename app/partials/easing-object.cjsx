React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-object.styl'

module.exports = React.createClass
  getInitialState:-> label: ''
  getDefaultProps:->
    easing:   (p)-> p
    duration: 2000
    delay:    1000

  componentDidMount:->
    objEl   = @getDOMNode().children[0]
    @_tween = new mojs.Tween
      onStart:  @props.onStart
      duration: @props.duration
      delay:    @props.delay
      onUpdate: (p)=>
        return if !@props.onUpdate?
        easedP = @props.easing(p)
        @setState label: @props.onUpdate { objEl, easedP, p }
    @props.timeline?.add @_tween

  _run:->  @_tween.run()
  _stop:-> @_tween.stop()

  render:->
    bg = if @props.background? then @props.background else null
    <div className="easing-object" style={ backgroundColor: bg } >
      { @props.children }
      <div className="easing-object__label">{ @state.label }</div>
    </div>
