React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Header          = require './partials/header'
TransitionGroup = require  './partials/transition-group'
Tappable = require 'react-tappable'
require './css/main.styl'
# mojs   = require('mo-js')

window.onbeforeunload = ->
  sessionStorage.setItem('beforeUnloadURL', window.location.href)

module.exports = React.createClass
  contextTypes: router: React.PropTypes.func
  render:->
    name = @context.router.getCurrentPath()
    name = '/tutorials' if name.match /tutorials/
    <div onTap=@_onTap className="app">
      <Header />
      <TransitionGroup className="pages-wrapper" component="div">
        <RouteHandler key={name} />
      </TransitionGroup>
    </div>