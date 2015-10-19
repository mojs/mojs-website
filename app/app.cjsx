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

window.MojsWebsite = {}

module.exports = React.createClass
  contextTypes: router: React.PropTypes.func
  _loop:->
    window.MojsWebsite.scrollY = if window.pageYOffset? then window.pageYOffset
    else document.scrollTop
    requestAnimationFrame(@_loop)
  componentDidMount:-> @_loop()
  render:->
    name = @context.router.getCurrentPath()
    name = '/tutorials' if name.match /tutorials/
    <div onTap=@_onTap className="app">
      <Header />
      <TransitionGroup className="pages-wrapper" component="div">
        <RouteHandler key={name} />
      </TransitionGroup>
    </div>