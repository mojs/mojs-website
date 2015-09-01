React    = require 'react'
Router   = require 'react-router'
Link     = Router.Link
Button   = require './button'
require '../css/partials/link.styl'
require '../css/partials/button.styl'

module.exports = React.createClass
  render:->
    btnClass = if @props.type is 'button' then 'button' else ''
    classAttr = "link touchable #{@props.className} #{btnClass}"
    classAttr += if @props.isDisabled then ' is-disabled' else ''

    if @props.isDisabled
      <span href="#{@props.link}" className="#{classAttr}">
        { @props.children }
        <span className="link__underline"></span>
      </span>
    else
      if @props.link.match /https?/
        <a href="#{@props.link}" className="#{classAttr}">
          { @props.children }
          <span className="link__underline"></span>
        </a>
      else
        <Link to="#{@props.link}" className="#{classAttr}">
          { @props.children }
          <span className="link__underline"></span>
        </Link>
