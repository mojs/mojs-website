React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Header          = require './partials/header'
TransitionGroup = require  './partials/transition-group'
Tappable = require 'react-tappable'
require './css/main.styl'
mojs   = require('mo-js')

App = React.createClass
  contextTypes: router: React.PropTypes.func
  # getInitialState:-> {}

  # componentDidMount:->
  #   @_transit = new mojs.Transit
  #     type: 'circle'
  #     isRunLess: true
  #     radius: { 5: 25 }
  #     duration: 300
  #     fill: 'white'
  #     opacity: { .5: 0 }
  #     easing: 'cubic.out'
  #   # @_transit.el.style['z-index'] = -1
  # _onTap:(e)-> @_transit.run x: e.pageX, y: e.pageY
  render:->
    name = @context.router.getCurrentPath()
    name = '/tutorials' if name.match /tutorials/
    <div onTap=@_onTap className="app">
      <Header />
      <TransitionGroup className="pages-wrapper" component="div">
        <RouteHandler key={name} />
      </TransitionGroup>
    </div>

module.exports = App