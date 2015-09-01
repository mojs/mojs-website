React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Sidebar         = require '../partials/tutorials-sidebar'
TransitionGroup = require '../partials/transition-group'
require '../css/pages/tutorials-page'
Sticky          = require '../vendor/react-sticky'
Physics         = require('impulse')
# Sticky          = require 'react-sticky'
Tappable        = require 'react-tappable'
mojs            = require 'mo-js'
Hammer          = require 'react-hammerjs'
Cookies         = require 'cookies-js'

# transition = null
module.exports = React.createClass
  contextTypes: router: React.PropTypes.func
  getInitialState:-> { isSidebarOpen: window.innerWidth > 1120 }
  componentDidMount:->
    @_redirect(); @_showBurst(); @_addImpulse()
    window.addEventListener 'resize', @_checkSidebarStatus
  componentWillUnmount:-> @_unbindResize()
  componentDidUpdate:->
    if @state.isSidebarOpen then @_showSidebar() else @_hideSidebar()
  _checkSidebarStatus:->
    return @_unbindResize() if @isSidebarChanged
    isOpen = window.innerWidth > 1120
    @setState isSidebarOpen: isOpen if isOpen isnt @state.isSidebarOpen
    
  _unbindResize:->
    window.removeEventListener 'resize', @_checkSidebarStatus
  _toggleSidebar:->
    @isSidebarChanged = true
    @setState isSidebarOpen: !@state.isSidebarOpen

  _addImpulse:->
    node       = @getDOMNode()
    sidebarBtn = node.querySelector '#js-expand-btn'
    sidebar    = node.querySelector '#js-sidebar'
    @sidebarWidth = sidebar.offsetWidth
    @impulseMenu = new Physics(sidebar)
      .style 'translateX', (x, y)-> return "#{x}px"
    !@state.isSidebarOpen and @impulseMenu.position(-@sidebarWidth)

  _showSidebar:->
    @impulseMenu.spring(tension: 1000, damping: 100).to(0, 0).start()
  _hideSidebar:->
    @impulseMenu.spring(tension: 1000, damping: 100).to(-@sidebarWidth, 0).start()
  _onSidebarPan:(e)->
    if !e.isFinal
      @impulseMenu.position mojs.h.clamp e.deltaX, -@sidebarWidth, 0
    else @setState isSidebarOpen: !(e.deltaX < -(@sidebarWidth/5))

  _showBurst:->
    return if Cookies('mojs-tutorials-burst')
    Cookies('mojs-tutorials-burst', true)

    node = @getDOMNode().querySelector '#js-expand-btn'
    @burst = new mojs.Burst
      parent:     node
      x: '15%',   y: '50%'
      radius:     30: 70
      degree:     160
      angle:      10
      delay:      1000
      count:      4
      stroke:     'white'
      strokeWidth: 4: 0
      type:       'line'
      duration:   400
      childOptions: radius: 4:0

  _redirect:->
    if @context.router.getCurrentPath() is '/tutorials'
      setTimeout =>
        @context.router.transitionTo('/tutorials/path-easing')
      , 150

  render:()->
    sidebarClass = if @state.isSidebarOpen then 'is-sidebar-open' else ''
    name = @context.router.getCurrentPath()
    <div className="page tutorials-page #{sidebarClass}">
      <Sticky className="tutorials-page__sticky-sidebar">
        <Hammer className="tutorials-page__sidebar" id="js-sidebar" onPan=@_onSidebarPan>
          <Hammer className="tutorials-page__expand-btn" id="js-expand-btn" onTap=@_toggleSidebar >
            <svg  width="20px" height="40px" viewBox="0 0 20 40" className="tutorials-page__expand-btn-svg"
                  className="tutorials-page__svg-arrow"
                  dangerouslySetInnerHTML={{__html: '<path d="M7,14 L13,20 L7,26" stroke="#ffffff" stroke-width="2" stroke-linecap="round" stroke-miterlimit="200" stroke-linejoin="round" fill="none"></path>'}}>
            </svg>
          </Hammer>
          <div className="tutorials-page__sidebar-scroll">
            <Sidebar />
          </div>
        </Hammer>
      </Sticky>
      <div className="tutorials-page__content">
        <TransitionGroup isFade={true}>
          <RouteHandler  key={name} />
        </TransitionGroup>
      </div>
    </div>
