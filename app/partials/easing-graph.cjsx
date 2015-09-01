React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-graph.styl'

module.exports = React.createClass
  getInitialState:-> progressLabel: 0

  getDefaultProps:->
    easing:   (p)-> p
    path:     'M0,100 L100,0'
    duration: 2000
    delay:    1000
  componentDidMount:->
    progressEl = @refs['progress-line'].getDOMNode()
    customEl   = @refs['custom-line'].getDOMNode()
    pointEl    = @refs['point'].getDOMNode()

    @_tween = new mojs.Tween
      duration: @props.duration
      delay:    @props.delay
      onUpdate: (p)=>
        easedP = @props.easing(p)

        mojs.h.style progressEl, 'transform', "translateX(#{ 200*p }px) translateZ(0)"
        mojs.h.style customEl,   'transform', "translate(100px, #{ -200 - 200*easedP }px) translateZ(0)"
        mojs.h.style pointEl,    'transform', "translate(#{ 200*p }px, #{ -200*easedP }px) translateZ(0)"
        
        @setState
          progressLabel: p.toFixed(2)
          customLabel:   easedP.toFixed(2)

    @props.timeline?.add(@_tween); @props.onAdd?()

  _run:->  @_tween.run()
  _stop:-> @_tween.stop()

  render:->
    <div className="easing-graph">
      <div className="easing-graph__center">

        <div className="easing-graph__point" ref="point"></div>

        <div ref="progress-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line">
            <div className="easing-graph-line__label easing-graph-line__label--top">{ @state.progressLabel }</div>
            <div className="easing-graph-line__label easing-graph-line__label--bottom">{ @state.progressLabel }</div>
          </div>
        </div>

        <div ref="custom-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line easing-graph-line--horizontal">
            <div className="easing-graph-line__label easing-graph-line__label--top">{ @state.customLabel }</div>
            <div className="easing-graph-line__label easing-graph-line__label--bottom">{ @state.customLabel }</div>
          </div>
        </div>

        <div className="easing-graph__small-label easing-graph__small-label--zero">0,0</div>
        <div className="easing-graph__small-label easing-graph__small-label--one">1,1</div>

        <div className="easing-graph__label easing-graph__label--progress">progress</div>
        <div className="easing-graph__custom-label-wrapper">
          <div className="easing-graph__label easing-graph__label--custom">{@props.label}</div>
        </div>

        <div className="easing-graph__graph">
          <svg viewBox="0 0 100 100">
            <path d="#{ @props.path }"></path>
          </svg>
        </div>

      </div>
    </div>
