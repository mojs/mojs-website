React     = require 'react'
Resizable = require 'react-component-resizable'
Tappable  = require 'react-tappable'
Hammer    = require 'hammerjs'

require 'css/partials/hefty-content'

module.exports = React.createClass
  componentDidMount:->
    if @props.isLaunchOnHover then @setState isShow: true
    @_bindWindowResize(); setTimeout((=> @_getPosition();), 15000); @_loop()
    (new Hammer document.body).on 'tap', (e)=>
      has = e.srcEvent.target.classList.contains.bind e.srcEvent.target.classList
      return if has('hefty-content__curtain') or has('hefty-content__curtain-label')
      @_onHide(e)
    
  componentWillUnmount:-> @isStop = true
  getInitialState:-> {}
  _bindWindowResize:->
    window.addEventListener 'resize', setTimeout @_getPosition.bind(@), 500
  _getScrollY:-> if window.pageYOffset? then window.pageYOffset else document.scrollTop
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

  _checkHide:->
    scrollY = @_getScrollY()
    isShow = scrollY + @wHeight > @top - 100 and scrollY < @bottom + 100
    @_onHide() if isShow is false and @_isShow

  _loop:->
    return @_onHide() if @isStop
    if @props.isLaunchOnHover then @_checkHide() else @_checkVisibility()
    requestAnimationFrame(@_loop)

  _onShow:(e)->
    e?.stopPropagation?(); e?.preventDefault?();
    return if @_isShow; @_isShow = true
    @_getPosition()
    if @props.isLaunchOnHover then @_hideCurtain() else @props.onShow?()
  _onHide:(e)->
    e?.preventDefault?(); e?.stopPropagation?()
    return if !@_isShow; @_isShow = false
    if @props.isLaunchOnHover then @_showCurtain() else @props.onHide?()

  _hideCurtain:()->
    @_curtainEl ?= @refs.curtain.getDOMNode()
    @_mainEl    ?= @getDOMNode()
    @_curtainHideTween ?= new mojs.Tween
      duration: 250
      easing:   'cubic.out'
      onUpdate: (p)=> @_curtainEl.style.opacity = 1-p
      onComplete: => @_curtainEl.style.display = 'none'; @props.onShow?()
    @_curtainShowTween?.stop()
    @_curtainHideTween.run()

  _showCurtain:()->
    @_curtainEl ?= @refs.curtain.getDOMNode()
    @_mainEl    ?= @getDOMNode()
    @_curtainShowTween ?= new mojs.Tween
      duration: 250
      easing:   'cubic.in'
      onStart: => @_curtainEl.style.display = 'block'
      onUpdate:(p)=> @_curtainEl.style.opacity = p
      onComplete: => @_curtainEl.style.opacity = 1; @props.onHide?()
    @_curtainHideTween?.stop()
    @_curtainShowTween.run()

  render:->
    visibility = if !@state.isShow then 'hidden' else 'visible'

    style =
      opacity:    if !@state.isShow then 0 else 1
      visibility: if @props.isVisibilityToggle then visibility else null
      cursor: 'default'

    curtainStyle = { display: (if @props.isLaunchOnHover then 'block' else 'none') }

    <div  className = "hefty-content #{@props.className or ''}"
                style    = style
                onTap    = { @_onHide } >
      
      <div
        className = "hefty-content__inner"
        onTap     = { @_onHide }
        style     = { cursor: 'default' } >

        <Tappable className="hefty-content__curtain" ref="curtain" style = { curtainStyle } onTap = {@_onShow} stopPropagation = {true}>
          <div className="hefty-content__curtain-label">
            tap to see
          </div>
        </Tappable>

        <Resizable onResize = @_getPosition>
          {@props.children}
        </Resizable>

      </div>

    </div>
