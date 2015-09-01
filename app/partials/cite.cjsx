React  = require 'react'

require '../css/partials/cite.styl'

module.exports = React.createClass
  render:->
    <div className="cite">
      <div className="cite__inner">
        <div className="cite__shapes shapes"></div>
        <div className="cite__text">  { @props.children }  </div>
        <div className="cite__author">{ @props.author }</div>
      </div>
    </div>

