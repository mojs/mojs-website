React         = require 'react'
UniteLink     = require 'partials/unite-link'
HeftyContent  = require './hefty-content'

require 'css/partials/vimeo.styl'

module.exports = React.createClass
  
  render:->
    <div className="vimeo">
      <iframe src="https://player.vimeo.com/video/#{@props.id}" width="#{@props.width or '100%'}" height="#{@props.height or 320}" frameBorder="0" webkitAllowFullScreen mozAllowFullScreen allowFullScreen></iframe>
      <div className="vimeo__about">
        <UniteLink link="https://vimeo.com/#{@props.id}">{@props.name or 'Name'}</UniteLink> from <UniteLink link="#{@props.authorLink or 'https://vimeo.com/user13515531'}">{@props.author or 'Oleg Solomka'}</UniteLink> on <UniteLink link="https://vimeo.com">Vimeo</UniteLink>
      </div>
    </div>