React     = require 'react'
Resizable = require 'react-component-resizable'
Tappable  = require 'react-tappable'
Hammer    = require 'hammerjs'

require 'css/partials/hefty-content'

module.exports = React.createClass
  componentDidMount:->
    (new Hammer document.body).on 'tap', (e)=>
      has = e.srcEvent.
      target.classList.contains.bind e.srcEvent.target.classList
      return if has('hefty-content__curtain') or has('hefty-content__curtain-label')
      @_onHide(e)
      true
  
  getInitialState:-> {isShow: true}

  _onShow:(e)->
    e?.stopPropagation?(); e?.preventDefault?();
    return if @_isShow; @_isShow = true
    @_hideCurtain()
    # @props.onShow?()

  _onHide:(e)->
    e?.preventDefault?(); e?.stopPropagation?()
    return if !@_isShow; @_isShow = false
    @_showCurtain()
    # @props.onHide?()

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

    <div  className = "hefty-content #{@props.className or ''}"
                style    = style
                onTap    = { @_onHide } >
      
      <div
        className = "hefty-content__inner"
        onTap     = { @_onHide }
        style     = { cursor: 'default' } >

        <Tappable className="hefty-content__curtain" ref="curtain" style = { display: 'block' } onTap = {@_onShow} stopPropagation = {true}>
          <div className="hefty-content__curtain-label">
            {@props.label || 'tap to see'}
          </div>
        </Tappable>

        {@props.children}

      </div>

    </div>
