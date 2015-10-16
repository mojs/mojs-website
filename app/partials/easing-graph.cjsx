React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'
Graph         = require 'partials/easing-graph-part'
GraphLabel    = require 'partials/graph-label-part'

require '../css/partials/easing-graph.styl'

module.exports = React.createClass
  getInitialState:-> progressLabel: 0

  getDefaultProps:->
    easing:   (p)-> p
    path:     'M0,100 L100,0'
    duration: 2000
    delay:    1000
    colors:   ['#F64040', '#00F87F', '#FFE952']
    opacity:  [1]
  componentDidMount:->
    progressEl     = @refs['progress-line'] .getDOMNode()
    progressLabel1 = @refs['progressLabel1'].getDOMNode()
    progressLabel2 = @refs['progressLabel2'].getDOMNode()

    @_tween = new mojs.Tween
      duration: @props.duration
      onUpdate: (p)=>
        # mojs.h.style progressEl, 'transform', "translateX(#{ 200*p }px)"

        fixedP = p.toFixed(2)
        # progressLabel1.innerText = fixedP
        # progressLabel2.innerText = fixedP

    @props.timeline?.add(@_tween)
    @props.timeline?.append(new mojs.Tween duration: @props.delay) if @props.delay
    @props.onAdd?()

  # _run:->  @_tween.run()
  # _stop:-> @_tween.stop()

  _makeGraph:(path=@props.path, i=0)->
    # console.log @props.opacity[i]
    <Graph
      colors   = { @props.colors }
      timeline = { @props.timeline }
      delay    = { @props.delay }
      duration = { @props.duration }
      easing   = { @props.easing }
      path     = { path }
      opacity  = { @props.opacity[i] }
      index    = { i } />

  _makeLabel:(label=@props.label, i=0)->
    <GraphLabel label={label} index={i} color = {@props.colors[i]} />

  render:->
    graphs = if !mojs.h.isArray @props.path then @_makeGraph()
    else @_makeGraph(value, i) for value, i in @props.path

    labels = if !mojs.h.isArray @props.label then @_makeLabel()
    else @_makeLabel(label, i) for label, i in @props.label

    <div className="easing-graph #{@props.className or ''}">

      {@props.children}

      <div className="easing-graph__center">

        { graphs }

        <div ref="progress-line" className="easing-graph__line-wrapper">
          <div className="easing-graph-line">
            <div className="easing-graph-line__label easing-graph-line__label--top" ref="progressLabel1"></div>
            <div className="easing-graph-line__label easing-graph-line__label--bottom" ref="progressLabel2"></div>
          </div>
        </div>

        <div className="easing-graph__label easing-graph__label--progress">progress</div>

        <div className="easing-graph__custom-label-wrapper">
          <div className="easing-graph__label easing-graph__label--custom">
            {labels}
          </div>
        </div>

        <div className="easing-graph__small-label easing-graph__small-label--zero">0,0</div>
        <div className="easing-graph__small-label easing-graph__small-label--one">1,1</div>

    </div>
  </div>
  