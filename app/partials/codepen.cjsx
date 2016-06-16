React         = require 'react'

module.exports = React.createClass
  _loadPen:->
    if !(document.querySelector '#js-codepen-script')?
      pen = document.createElement('script'); pen.type = 'text/javascript'; pen.async = true
      pen.src = '//assets.codepen.io/assets/embed/ei.js'; pen.id  = 'js-codepen-script'
      (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild(pen)
    else window.__CPEmbed and (new window.__CPEmbed)

  render:->
    setTimeout @_loadPen, 10
    <p
      data-height="#{ @props.height || 345 }"
      data-theme-id="15571"
      data-slug-hash="#{@props.pen}"
      data-default-tab="result"
      data-user="sol0mka"
      className='codepen'>
        See the Pen <a href="http://codepen.io/sol0mka/pen/#{@props.pen}/">{@props.pen}</a> by LegoMushroom (<a href='http://codepen.io/sol0mka'>@sol0mka</a>) on <a href='http://codepen.io'>CodePen</a>.
      </p>