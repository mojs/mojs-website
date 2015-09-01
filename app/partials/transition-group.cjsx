React  = require('react/addons')
ReactTransitionGroup = React.addons.TransitionGroup
mojs   = require('mo-js')
 
TransitionGroupChild = React.createClass
  getInitialState:-> { duration: 401 }
  componentWillEnter: (done)->
    node = @getDOMNode()
    node.style.opacity = 0
    setTimeout =>
      tween = new mojs.Tween
        duration: @state.duration
        onStart:->
          node.style['z-index'] = 1
          node.style.opacity    = 1
        onComplete:->
          mojs.h.setPrefixedStyle(node, 'transform', 'none'); done()
        onUpdate:(p)=>
          p = mojs.easing.cubic.inout(p)
          transform = "translateX(#{100*(1-p)}%) translateZ(0)"
          mojs.h.setPrefixedStyle(node, 'transform', transform)
          @props.isFade and (node.style.opacity = mojs.easing.cubic.out(p).toFixed(10))
      tween.run()
    , 1

  componentWillLeave: (done)->
    node = this.getDOMNode()
    width = node.offsetWidth
    node.style['width']    = "#{width}px"
    node.style['left']     = "#{node.offsetLeft}px"
    node.style['top']      = 0
    node.style['z-index']  = 0
    node.style['position'] = 'absolute'
    if @props.isFade
      node.style['opacity']  = 0
      setTimeout =>
        tween = new mojs.Tween
          duration:   @state.duration
          onComplete: done
          onUpdate:(p)->
            p = mojs.easing.cubic.inout(p)
            transform = "translateX(#{100*(p)}%) translateZ(0)"
            mojs.h.setPrefixedStyle(node, 'transform', transform)
            node.style.opacity = mojs.easing.expo.in 1-p
        tween.run()
      , 1
    else setTimeout (done), @state.duration
  render:-> React.Children.only this.props.children
 
TransitionGroup = React.createClass
  _wrapChild:(child)->
    <TransitionGroupChild isFade={@props.isFade}>{child}</TransitionGroupChild>
  render:-> <ReactTransitionGroup {...this.props} childFactory={this._wrapChild} />
 
module.exports = TransitionGroup;