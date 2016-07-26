EasingGraph   = require './easing-graph'
EasingObject  = require './easing-object'
HeftyContent  = require './hefty-content'
Hammer        = require 'hammerjs'
HeftyRenderingContent  = require './hefty-rendering-content.es6.js'

React         = require 'react'
Tappable      = require 'react-tappable'
# mojs          = require 'mo-js'

require '../css/partials/easing-object-graph.styl'

module.exports = React.createClass
  getInitialState:-> @_isShow = false; { isSquash: false, pop: 'object' }
  getDefaultProps:->
    path:     'M 0,100 L 100,0'
    duration: 2000
    delay:    350

  _start:->
    @setState {'isShow': true}
    @_initEasings() if !@_easing.length
    @_isTweensAdded and @_timeline.play(); @_isShow = true
  _stop:->   @_timeline.pause(); @_isShow = false
  _onAdd:->  @_isTweensAdded = true; (@_isShow or !@_isShow?) and @_start()
  _onHide:-> @setState {'isShow': false, isSquash: false}

  _initEasings:->
    if mojs.h.isArray @props.path
      @_easing.push @_makePath @props.path[i] for path, i in @props.path
    else @_easing.push @_makePath @props.path

  _showObject:(e)-> @_toggleSquash(e); @setState pop: 'object'
  _showGraph:(e)->  @_toggleSquash(e); @setState pop: 'graph'
  _toggleSquash:(e)->
    e?.stopPropagation();
    return if @props.isGraphLess
    @setState isSquash: !@state.isSquash

  _makeGraph:->
    if !@props.isGraphLess
      <Tappable onTap = @_showGraph >
        <EasingGraph
          easing    = {@_easing}
          timeline  = {@_timeline}
          label     = {@props.label}
          duration  = {@props.duration}
          delay     = {@props.delay}
          path      = {@props.path}
          onAdd     = {@_onAdd}
          opacity   = {@props.opacity} >
        </EasingGraph>
      </Tappable>
    else @_onAdd?()

  _makePath:(path)-> mojs.easing.path path, precompute: 2000, eps: .001

  render:->
    className = if (@state.isSquash) then "is-squash is-pop-#{@state.pop}" else ''
    className = if (@state.isShow) then 'is-shown' else ''
    className += if (@props.isGraphLess) then 'is-graph-less' else ''

    @_timeline ?= new mojs.Timeline repeat: 99999999
    @_easing ?= []

    graphsStyle = { visibility: if @state.isShow then 'visible' else 'hidden' }

    <HeftyContent
      label           = { @props.curtainLabel or "tap to see the graph" }
      className       = "easing-object-graph #{className} is-pop-#{@state.pop}"
      onShow          = { => @_start() } onHide={ => @_stop(); @_onHide() }
      minHeight       = {320}
      minWidth        = {640} >

      <div className="easing-object-graph__inner">
        <span style = {graphsStyle}>
        
          <Tappable onTap = @_showObject >
            <EasingObject
              timeline    = {@_timeline}
              easing      = {@_easing}
              duration    = {@props.duration}
              delay       = {@props.delay}
              onStart     = {@props.onStart}
              onUpdate    = {@props.onUpdate}
              background  = {@props.background}
              isAlone     = {@props.isGraphLess}>
              {@props.children}
            </EasingObject>
          </Tappable>

          { @_makeGraph() }

        </span>

      </div>

    </HeftyContent>
