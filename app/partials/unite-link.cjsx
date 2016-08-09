React    = require 'react'
Router   = require 'react-router'
Link     = Router.Link
Button   = require './button'
Tappable = require 'react-tappable'
require '../css/partials/link.styl'
require '../css/partials/button.styl'

module.exports = React.createClass
  render:->
    btnClass = if @props.type is 'button' then 'button' else ''
    classAttr = "link touchable #{@props.className} #{btnClass}"
    classAttr += if @props.isDisabled then ' is-disabled' else ''
    isDownload = if @props.download is true then true else false

    if @props.isDisabled or !@props.link
      <Tappable href="#{@props.link}" className="#{classAttr}" download="#{isDownload}" onTap=@props.onTap>
        { @props.children }
        <span className="link__underline"></span>
      </Tappable>
    else
      if @props.link.match(/https?/) or @props.link.match(/\.[a-zA-Z0-9]{3}$/)
        <a href="#{@props.link}" className="#{classAttr}" download="#{isDownload}">
          { @props.children }
          <span className="link__underline"></span>
        </a>
      else
        <Link to="#{@props.link}" className="#{classAttr}" download="#{isDownload}">
          { @props.children }
          <span className="link__underline"></span>
        </Link>
