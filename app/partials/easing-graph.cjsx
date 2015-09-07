React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'
Graph         = require 'partials/easing-graph-part'

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

    @_tween = new mojs.Tween
      duration: @props.duration
      onUpdate: (p)=>
        mojs.h.style progressEl, 'transform', "translateX(#{ 200*p }px) translateZ(0)"
        
        @setState progressLabel: p.toFixed(2)

    @props.timeline?.add(@_tween)
    @props.timeline?.append(new mojs.Tween duration: @props.delay) if @props.delay
    @props.onAdd?()

  # _run:->  @_tween.run()
  # _stop:-> @_tween.stop()

  _makeGraph:(path, i)->
    <Graph
      timeline = { @props.timeline }
      delay    = { @props.delay }
      duration = { @props.duration }
      easing   = {@props.easing}
      path     = {path}
      index    = {i}
      isIt     = {@props.isIt} />

  render:->

    graphs = if mojs.h.isArray @props.path
      @_makeGraph(value, i) for value, i in @props.path
    else @_makeGraph(@props.path, 0)

    <div className="easing-graph">
      <div className="easing-graph__center">

        { graphs }

        <div ref="progress-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line">
            <div className="easing-graph-line__label easing-graph-line__label--top">{ @state.progressLabel }</div>
            <div className="easing-graph-line__label easing-graph-line__label--bottom">{ @state.progressLabel }</div>
          </div>
        </div>

        <div className="easing-graph__label easing-graph__label--progress">progress</div>

        <div className="easing-graph__custom-label-wrapper">
          <div className="easing-graph__label easing-graph__label--custom">{@props.label}</div>
        </div>

        <div className="easing-graph__small-label easing-graph__small-label--zero">0,0</div>
        <div className="easing-graph__small-label easing-graph__small-label--one">1,1</div>

    </div>
  </div>
  