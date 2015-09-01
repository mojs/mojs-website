React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
Header          = require './partials/header'
TransitionGroup = require  './partials/transition-group'
require './css/main.styl'

mojs   = require('mo-js')

App = React.createClass
  contextTypes: router: React.PropTypes.func
  getInitialState:-> {}
  render:->
    name = @context.router.getCurrentPath()
    name = '/tutorials' if name.match /tutorials/
    <div>
      <Header />
      <TransitionGroup className="pages-wrapper" component="div">
        <RouteHandler key={name} />
      </TransitionGroup>
    </div>

module.exports = App