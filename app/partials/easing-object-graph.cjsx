EasingGraph   = require './easing-graph'
EasingObject  = require './easing-object'
HeftyContent  = require './hefty-content'

React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-object-graph.styl'

module.exports = React.createClass
  getDefaultProps:->
    path:     'M 0,100 L 100,0'
    duration: 2000
    delay:    1000

  _start:-> @_isTweensAdded and @_timeline.start(); @_isShow = true
  _stop:-> @_timeline.stop(); @_isShow = false
  _onAdd:-> @_isTweensAdded = true; (@_isShow or !@_isShow?) and @_start()

  render:->
    @_timeline ?= new mojs.Timeline repeat: 9999999999
    @_easing   ?= mojs.easing.path @props.path, precompute: 2000, eps: .001

    <HeftyContent
      className="easing-object-graph"
      onShow={ => @_start() } onHide={ => @_stop() }>

      <div className="easing-object-graph__inner">
        <EasingObject
          timeline    = {@_timeline}
          easing      = {@_easing}
          duration    = {@props.duration}
          delay       = {@props.delay}
          onStart     = {@props.onStart}
          onUpdate    = {@props.onUpdate}
          background  = {@props.background}>
          {@props.children}
        </EasingObject>

        <EasingGraph
          easing    = {@_easing}
          timeline  = {@_timeline}
          label     = {@props.label}
          duration  = {@props.duration}
          delay     = {@props.delay}
          path      = {@props.path}
          onAdd     = {@_onAdd} >
        </EasingGraph>

      </div>
    </HeftyContent>
