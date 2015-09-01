React = require 'react'
Icon  = require './icon'

require '../css/partials/social-networks.styl'


module.exports = React.createClass
  render:->
    <div className="social-networks #{ @props.className }">
      <Icon link="https://twitter.com/legomushroom" className="social-networks__icon social-networks__icon--twitter" path="twitter" />
      <Icon link="http://dribbble.com/sol0mka" className="social-networks__icon social-networks__icon--dribbble" path="dribbble" />
    </div>