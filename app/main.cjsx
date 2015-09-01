React  = require 'react'
Router = require 'react-router'
DefaultRoute      = Router.DefaultRoute
Route             = Router.Route
React.initializeTouchEvents(true)

App       = require './app'
Main      = require './pages/main'
Tutorials = require './pages/tutorials'
GettingStarted = require './pages/tutorials/getting-started'
MotionPath     = require './pages/tutorials/motion-path'
PathEasing     = require './pages/tutorials/path-easing/path-easing.cjsx'

routes = (
  <Route     name="app" path="/"    handler={App}>
    <Route   name="main"            handler={Main}/>
    <Route   name="tutorials"       handler={Tutorials}>
      <Route name="path-easing"     handler={PathEasing} />
      {#<Route name="getting-started" handler={GettingStarted} />}
      {#<Route name="motion-path"     handler={MotionPath} />}
    </Route>
    <DefaultRoute                   handler={Main}/>
  </Route>
)

# Router.run routes, Router.HistoryLocation, (Handler)->
router = Router.run routes, (Handler)->
  React.render(<Handler/>, document.getElementById('js-content'))
