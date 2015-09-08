React     = require 'react'
Resizable = require 'react-component-resizable'
Tappable  = require 'react-tappable'
Hammer    = require 'hammerjs'

require 'css/partials/hefty-content'

module.exports = React.createClass
  componentDidMount:->
    if @props.isLaunchOnHover then @setState isShow: true
    else @_bindWIndowResize(); setTimeout((=> @_getPosition();), 1000); @_loop()
    (new Hammer document.body).on 'tap', @_onHide
    
  componentWillUnmount:-> @isStop = true
  getInitialState:-> {}
  _bindWIndowResize:-> window.addEventListener 'resize', @_getPosition
  _getScrollY:->
    if window.pageYOffset? then window.pageYOffset else document.scrollTop
  _getPosition:->
    node = @getDOMNode().childNodes[0]; rect = node.getBoundingClientRect()
    scrollY = @_getScrollY(); @wHeight = window.innerHeight
    @top = scrollY + rect.top; @bottom = scrollY + rect.bottom
  _checkVisibility:->
    scrollY = @_getScrollY()
    isShow = if scrollY + @wHeight > @top - 100 and scrollY < @bottom + 100 then true
    else false
    
    if @state.isShow isnt isShow
      @setState isShow: isShow
      isShow and @props.onShow?()
      isShow or  @props.onHide?()

  _loop:->
    return if @isStop; @_checkVisibility()
    requestAnimationFrame(@_loop)

  _onShow:(e)->
    e.stopPropagation()
    return if @_isShow; @_isShow = true
    if @props.isLaunchOnHover then @_hideCurtain() else @props.onShow?()
  _onHide:(e)->
    e.preventDefault()
    return if !@_isShow; @_isShow = false
    if @props.isLaunchOnHover then @_showCurtain() else @props.onHide?()

  _stopPropagation:(e)-> e.stopPropagation()

  _hideCurtain:(e)->
    @_curtainEl ?= @refs.curtain.getDOMNode()
    @_mainEl    ?= @getDOMNode()
    @_curtainHideTween ?= new mojs.Tween
      duration: 250
      easing:   'cubic.out'
      onUpdate: (p)=> @_curtainEl.style.opacity = 1-p
      onComplete: => @_curtainEl.style.display = 'none'; @props.onShow?()
    @_curtainHideTween.run()

  _showCurtain:(callback = @props.onHide)->
    @_curtainEl ?= @refs.curtain.getDOMNode()
    @_mainEl    ?= @getDOMNode()
    @_curtainShowTween ?= new mojs.Tween
      duration: 250
      easing:   'cubic.in'
      onStart: => @_curtainEl.style.display = 'block'
      onUpdate:(p)=> @_curtainEl.style.opacity = p
      onComplete: @props.onHide
    @_curtainShowTween.run()

  render:->
    visibility = if !@state.isShow then 'hidden' else 'visible'

    style =
      opacity:    if !@state.isShow then 0 else 1
      visibility: if @props.isVisibilityToggle then visibility else null

    curtainStyle = { display: (if @props.isLaunchOnHover then 'block' else 'none') }

    <Tappable  className = "hefty-content #{@props.className or ''}"
                style    = style
                onTap    = @_stopPropagation >
      
      <Tappable
        className = "hefty-content__inner"
        onTap     = { @_onHide }
        style     = { cursor: 'default' } >

        <Tappable className="hefty-content__curtain" ref="curtain" style = { curtainStyle } onTap = @_onShow >
          <div className="hefty-content__curtain-label">
            tap to see
          </div>
        </Tappable>

        <Resizable onResize = @_getPosition>
          {@props.children}
        </Resizable>

      </Tappable>

    </Tappable>
