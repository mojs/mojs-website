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

  _addBrowserClasses:->
    is_chrome = navigator.userAgent.indexOf('Chrome') > -1
    is_explorer = navigator.userAgent.indexOf('MSIE') > -1
    is_firefox = navigator.userAgent.indexOf('Firefox') > -1
    is_safari = navigator.userAgent.indexOf("Safari") > -1
    is_opera = navigator.userAgent.toLowerCase().indexOf("op") > -1
    if ( is_chrome and is_safari) then is_safari = false
    if ( is_chrome and is_opera) then is_chrome = false
    is_safari and document.body.classList.add('is-safari')

  componentDidMount:-> @_addBrowserClasses(); @_loop()
  render:->
    name = @context.router.getCurrentPath()
    # name = '/tutorials' if name.match /tutorials/
    <div onTap=@_onTap className="app">
      <Header />
      <TransitionGroup className="pages-wrapper" component="div">
        <RouteHandler key={name} />
      </TransitionGroup>
    </div>