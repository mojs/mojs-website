React = require 'react'

Icon = React.createClass
  render:->
    useTag = "<use xlink:href='##{@props.path or ''}-shape' />"
    if !@props.link?
      <div className="icon #{@props.className or ''}" id="#{@props.id or ''}">
        <svg viewBox="0 0 32 32" className="icon__svg" dangerouslySetInnerHTML={{__html: useTag }}></svg>
      </div>
    else
      <a href="#{@props.link}" className="icon #{@props.className or ''}" id="#{@props.id or ''}">
        <svg viewBox="0 0 32 32" className="icon__svg" dangerouslySetInnerHTML={{__html: useTag }}></svg>
      </a>


module.exports = Icon