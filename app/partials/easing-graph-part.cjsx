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

  componentDidMount:->
    customEl   = @refs['custom-line'].getDOMNode()
    pointEl    = @refs["point"].getDOMNode()
    @_tween = new mojs.Tween
      duration: @props.duration
      onUpdate: (p)=>
        easedP = @props.easing[@props.index](p)
        mojs.h.style customEl,   'transform', "translate(100px, #{ -200*easedP }px) translateZ(0)"
        mojs.h.style pointEl,    'transform', "translate(#{ 200*p }px, #{ -200*easedP }px) translateZ(0)"
        # mojs.h.style progressEl, 'transform', "translateX(#{ 200*p }px) translateZ(0)"
        @setState customLabel:   easedP.toFixed(2)

    @props.timeline?.add(@_tween)

  render:->
    @_colors = ['#F64040', '#00F87F']
    <div className="easing-graph-part">
      <div
        className="easing-graph-part__point"
        ref="point"
        style = { backgroundColor: @_colors[@props.index] }  />

      <div ref="custom-line" className="easing-graph__line-wrapper">
        <div className="easing-graph-line easing-graph-line--horizontal">
          <div className="easing-graph-line__label easing-graph-line__label--top">{ @state.customLabel }</div>
          <div className="easing-graph-line__label easing-graph-line__label--bottom">{ @state.customLabel }</div>
        </div>
      </div>

      <div className="easing-graph-part__graph">
        <svg viewBox="0 0 100 100">
          <path d="#{ @props.path }"></path>
        </svg>
      </div>

    </div>