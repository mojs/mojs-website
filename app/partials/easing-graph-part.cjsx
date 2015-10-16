React         = require 'react'
mojs          = require 'mo-js'

require '../css/partials/easing-graph-part.styl'

module.exports = React.createClass
  getInitialState:-> customLabel: 0
  getDefaultProps:->
    easing:   (p)-> p
    path:     'M0,100 L100,0'
    duration: 2000
    delay:    1000
    colors:   ['#F64040', '#00F87F', '#FFE952']

  componentDidMount:->
    customEl       = @refs['custom-line'].getDOMNode()
    customLabel1El = @refs['customLabel1'].getDOMNode()
    customLabel2El = @refs['customLabel2'].getDOMNode()
    pointEl        = @refs["point"].getDOMNode()
    @_tween = new mojs.Tween
      duration: @props.duration
      onUpdate: (p)=>
        easedP = @props.easing[@props.index](p)
        mojs.h.style customEl,   'transform', "translate3d(100px, #{ -200*easedP }px, 0)"
        mojs.h.style pointEl,    'transform', "translate3d(#{ 200*p }px, #{ -200*easedP }px, 0)"
        # fixedP = easedP.toFixed(2)
        # customLabel1El.innerText = fixedP
        # customLabel2El.innerText = fixedP

    @props.timeline?.add(@_tween)

  render:->
    opacity = if @props.opacity? then @props.opacity else 1
    
    <div className="easing-graph-part" style={ opacity: opacity }>
      <div
        className="easing-graph-part__point"
        ref="point"
        style = { backgroundColor: @props.colors[@props.index] }  />

      <div ref="custom-line" className="easing-graph__line-wrapper">
        <div className="easing-graph-line easing-graph-line--horizontal">
          <div className="easing-graph-line__label easing-graph-line__label--top" ref="customLabel1"></div>
          <div className="easing-graph-line__label easing-graph-line__label--bottom" ref="customLabel2"></div>
        </div>
      </div>

      <div className="easing-graph-part__graph">
        <svg viewBox="0 0 100 100">
          <path d="#{ @props.path }"></path>
        </svg>
      </div>

    </div>