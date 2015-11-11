React = require 'react'

require 'css/partials/graph-label-part.styl'

module.exports = React.createClass
  render:->
    circleStyle = { backgroundColor: @props.color }
    <div className="easing-graph-label-part">
      <div className="easing-graph-label-part__circle" style={circleStyle}></div>
      <div className="easing-graph-label-part__label">{@props.label}</div>
    </div>