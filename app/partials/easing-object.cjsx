React         = require 'react'
# Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-object.styl'

module.exports = React.createClass
  getInitialState:-> label: ''
  getDefaultProps:->
    easing:   (p)-> p
    duration: 2000
    delay:    1000

  componentDidMount:->
    objEl    = @getDOMNode().children[0]
    @labelEl = @refs.label.getDOMNode()
    @_tween  = new mojs.Tween
      onStart:  @props.onStart
      duration: @props.duration
      onUpdate: (p)=>
        return if !@props.onUpdate?
        
        easedP = if mojs.h.isArray @props.easing
          easing(p) for easing, i in @props.easing
        else @props.easing(p)
        
        @labelEl.innerText = @props.onUpdate({ objEl, easedP, p }) or ''

    @props.timeline?.add @_tween
    @props.timeline?.append(new mojs.Tween duration: @props.delay) if @props.delay

  # _run:->  @_tween.run()
  # _stop:-> @_tween.stop()

  render:->
    bg = if @props.background? then @props.background else null
    <div className="easing-object" style={ backgroundColor: bg } >
      { @props.children }
      <div className="easing-object__label" ref="label"></div>
    </div>
