React     = require 'react'
Resizable = require 'react-component-resizable'
Tappable  = require 'react-tappable'


require 'css/partials/hefty-content'

module.exports = React.createClass
  componentDidMount:->
    if @props.isLaunchOnHover then @setState isShow: true
    else @_bindWIndowResize(); setTimeout((=> @_getPosition();), 1000); @_loop()
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
    if @props.isIt
      # console.clear()
      console.log @top - 100, scrollY + @wHeight, @bottom + 100, @state.isShow
    isShow = if scrollY + @wHeight > @top - 100 and scrollY < @bottom + 100 then true
    else false
    
    if @state.isShow isnt isShow
      @setState isShow: isShow
      isShow and @props.onShow?()
      isShow or  @props.onHide?()

  _loop:->
    return if @isStop; @_checkVisibility()
    requestAnimationFrame(@_loop)

  _onShow:->
    if @props.isLaunchOnHover then @_hideCurtain(=> @props.onShow?()) else @props.onShow?()
  _onHide:->
    if @props.isLaunchOnHover then @_showCurtain(=> @props.onHide?()) else @props.onHide?()

  _hideCurtain:(callback)->
    @_curtainEl ?= @refs.curtain.getDOMNode()
    @_curtainHideTween ?= new mojs.Tween
      duration: 250
      easing:   'cubic.out'
      onUpdate: (p)=> @_curtainEl.style.opacity = 1-p
      onComplete: => @_curtainEl.style.display = 'none'; callback()
    @_curtainHideTween.run()

  _showCurtain:(callback)->
    @_curtainEl ?= @refs.curtain.getDOMNode()
    @_curtainShowTween ?= new mojs.Tween
      duration: 250
      easing:   'cubic.in'
      onStart: => @_curtainEl.style.display = 'block'
      onUpdate:(p)=> @_curtainEl.style.opacity = p
      onComplete: callback
    @_curtainShowTween.run()

  _toggleRun:-> if (@_isRun = !@_isRun) then @_onShow() else @_onHide()

  render:->
    visibility = if !@state.isShow then 'hidden' else 'visible'

    isMobile = ("ontouchstart" in window || window.DocumentTouch && document instanceof DocumentTouch)
    onTap = if isMobile then @_toggleRun else null

    urgeLabel = if isMobile then 'Tap' else 'Hover'

    style =
      opacity:    if !@state.isShow then 0 else 1
      visibility: if @props.isVisibilityToggle then visibility else null
      cursor:     'default'

    curtainStyle = { display: if @props.isLaunchOnHover then 'block' else 'none' }

    <Tappable  className    = "hefty-content #{@props.className or ''}"
                style        = style >

      <div
        className    = "hefty-content__inner"
        onMouseEnter = @_onShow
        onMouseLeave = @_onHide
        onTap        = { onTap } >

        <div className="hefty-content__curtain" ref="curtain" style = { curtainStyle }>
          <div className="hefty-content__curtain-label">
            <span>{ urgeLabel }</span> to see
          </div>
        </div>

        <Resizable onResize = @_getPosition>
          {@props.children}
        </Resizable>
      </div>

    </Tappable>
    

