React = require 'react'
require './css/main.styl'
Tapable = require 'react-tappable'

MotionDemoComponent = React.createClass
  getInitialState:-> @state = {}
  render:->
    playClass = if @state.isDemoLaunched then 'is-play' else ''
    <div className="motion-demo #{playClass}">
      <div className="motion-demo__header">Quick demo:</div>
      <div className="motion-demo__ghost"></div>
      <Tapable className="motion-demo__play" onTap=@launchDemo></Tapable>
      <div  className="motion"
            dangerouslySetInnerHTML={{__html: @state.html }}>
      </div>
    </div>

  componentDidMount:->
    it = @
    require [ './motion-demo.html', './js/main'],
      (MotionDemoHtml, MotionDemo)->
        it.setState html: MotionDemoHtml
        setTimeout ->
          it.demo = new MotionDemo
          it.demo.init()
        , 1000

  launchDemo:-> @demo.run(); @setState isDemoLaunched: true


module.exports = MotionDemoComponent