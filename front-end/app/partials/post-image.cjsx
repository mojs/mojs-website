React  = require 'react'

require '../css/partials/post-image.styl'

module.exports = React.createClass
  render:->
    <div className="post-image #{@props.className or ''}">
      <img  className="post-image__image"
            src="#{@props.src}" title="#{@props.title or 'image'}" />
      <div className="post-image__description">{ @props.description }</div>
    </div>

