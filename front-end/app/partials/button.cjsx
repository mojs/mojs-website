React  = require 'react'
Router = require 'react-router'
Link   = Router.Link

require '../css/partials/button.styl'

Button = React.createClass
  render:->
    if @props.to?
      <Link to="#{@props.to or 'app'}" href="#{@props.link or '#'}" className="button #{@props.className or ''}" id="#{@props.id or ''}">
        {@props.children}
      </Link>
    else
      <a href="#{@props.link or '#'}" className="button #{@props.className or ''}" id="#{@props.id or ''}">
        {@props.children}
      </a>

module.exports = Button