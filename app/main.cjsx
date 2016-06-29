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
# PathEasing     = require './pages/tutorials/easing/path-easing/path-easing.cjsx'
# Shape          = require('./pages/tutorials/shape').default;
Burst          = require('./pages/tutorials/burst').default;

  # <Route     name="app" path="/"    handler={App}>

routes = (
  <Route     name="app" path="/"    handler={App}>
    <Route   name="main"            handler={Main}/>
    <Route   name="tutorials"       handler={Tutorials}>
      <Route name="/tutorials/burst/" handler={Burst} />
      { ### <Route name="/tutorials/shape/"   handler={Shape} /> ### }
      <Route name="easing">
        {
          ### <Route name="/tutorials/easing/path-easing/" handler={PathEasing} /> ###
        }
      </Route>
    </Route>
    <DefaultRoute handler={Main}/>
  </Route>
)

Router.run routes, Router.HistoryLocation, (Handler)->
  # router = Router.run routes, (Handler)->
  React.render(<Handler/>, document.getElementById('js-content'))
