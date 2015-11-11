React = require 'react'
Icon  = require './icon'

require '../css/partials/social-networks-about.styl'
SocialNetworks = require './social-networks'

module.exports = React.createClass
  render:->
    <div className="social-networks-about #{@props.className}">
      <div className="social-networks-about__icons">
        <SocialNetworks />
      </div>
      <div className="social-networks-about__text">
        <a className="social-networks-about__link" href="https://twitter.com/legomushroom">@legomushroom</a> 2015 MIT
      </div>
    </div>