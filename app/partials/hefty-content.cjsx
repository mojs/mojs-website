React     = require 'react'
Resizable = require 'react-component-resizable'

module.exports = React.createClass
  
  componentDidMount:-> @_bindWIndowResize(); @_getPosition(); @_loop()
  componentWillUnmount:-> @isStop = true

  getInitialState:-> {}
  _bindWIndowResize:->
    window.addEventListener 'resize', @_getPosition
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

  render:->
    visibility = if !@state.isShow then 'hidden' else 'visible'
    style =
      opacity:    if !@state.isShow then 0 else 1
      visibility: if @props.isVisibilityToggle then visibility else null
    <Resizable  className="#{@props.className or ''}"
                style=style
                onResize=@_getPosition>

        {@props.children}
    </Resizable>

