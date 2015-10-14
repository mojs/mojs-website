EasingGraph   = require './easing-graph'
EasingObject  = require './easing-object'
HeftyContent  = require './hefty-content'
Hammer        = require 'hammerjs'
HeftyRenderingContent  = require './hefty-rendering-content.es6.js'

React         = require 'react'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'

require '../css/partials/easing-object-graph.styl'

module.exports = React.createClass
  getInitialState:-> @_isShow = false; { isSquash: false, pop: 'object' }
  componentWillUnmount:-> @isStop = true
  getDefaultProps:->
    path:     'M 0,100 L 100,0'
    duration: 2000
    delay:    1000

  _start:-> @_isTweensAdded and @_timeline.start(); @_isShow = true
  _stop:->  @_timeline.pause(); @_isShow = false
  _onAdd:-> @_isTweensAdded = true; (@_isShow or !@_isShow?) and @_start()

  _onHide:-> @setState isSquash: false

  _bindScroll:-> document.addEventListener 'scroll', @_startLoop
  _bindWindowResize:-> window.addEventListener 'resize', @_deferredGetPosition

  _startLoop:->
    !@_isGotPosition and (@_getPosition(); @_isGotPosition = true)
    !@_isLooping and @_loop()

  _getScrollY:-> if window.pageYOffset? then window.pageYOffset else document.scrollTop
  _getPosition:->
    node = @getDOMNode(); rect = node.getBoundingClientRect()
    scrollY = @_getScrollY(); @wHeight = window.innerHeight
    @top = scrollY + rect.top; @bottom = scrollY + rect.bottom

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

  _loop:->
    if @isStop or (@stopCnt++ > 3) then @_isLooping = false; return @stopCnt = 0
    @_isLooping = true
    @_checkVisibility()
    requestAnimationFrame(@_loop)

  _checkVisibility:->
    scrollY = @_getScrollY()
    isShow = if scrollY + @wHeight > @top - 100 and scrollY < @bottom + 100 then true
    else false

    @setState isShow: isShow if @state.isShow isnt isShow
  
  componetWillUnmount:-> clearTimeout @_tm
  componentDidMount:->
    @stopCnt = 0
    @_bindScroll(); @_bindWindowResize(); @_getPosition()
    # @_tm = setTimeout (=> @setState 'isCouldBeRendered': true), 1000

  _makePath:(path)-> mojs.easing.path path, precompute: 2000, eps: .001

  render:->
    if !@state.isShow then return <div/>
    else
      @_timeline ?= new mojs.Timeline repeat: 99999999

      @_easing ?= if mojs.h.isArray @props.path
        @_makePath @props.path[i] for path, i in @props.path
      else [ @_makePath @props.path ]

      className = if (@state.isSquash) then "is-squash is-pop-#{@state.pop}" else ''
      <HeftyContent
        className       = "easing-object-graph #{className} is-pop-#{@state.pop}"
        onShow          = { => @_start() } onHide={ => @_stop(); @_onHide() }
        isLaunchOnHover = { true }
        isRenderOnScroll = { true } >

        <div className="easing-object-graph__inner">
          
          <Tappable onTap = @_showObject >
            <EasingObject
              timeline    = {@_timeline}
              easing      = {@_easing}
              duration    = {@props.duration}
              delay       = {@props.delay}
              onStart     = {@props.onStart}
              onUpdate    = {@props.onUpdate}
              background  = {@props.background}
              isAlone     = { @props.isGraphLess }>
              {@props.children}
            </EasingObject>
          </Tappable>

          { @_makeGraph() }

        </div>
      </HeftyContent>
