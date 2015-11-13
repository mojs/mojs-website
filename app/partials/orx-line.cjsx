React  = require 'react'


require '../css/partials/orx-line.styl'

module.exports = React.createClass
  render:->
    <div className="orx-line orx-line--#{@props.type} #{@props.className}">
      <div className="orx-line__shapes shapes"></div>
    </div>

