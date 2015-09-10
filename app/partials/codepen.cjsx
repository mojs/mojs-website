React         = require 'react'

module.exports = React.createClass
  _loadPen:->
    if !(document.querySelector '#js-codepen-script')?
      pen = document.createElement('script'); pen.type = 'text/javascript'; pen.async = true
      pen.src = '//assets.codepen.io/assets/embed/ei.js'; pen.id  = 'js-codepen-script'
      (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild(pen)
    else CodePenEmbed?._showCodePenEmbeds?()

  render:->
    setTimeout @_loadPen.bind(@), 10
    <p
      data-height="345"
      data-theme-id="15571"
      data-slug-hash="#{@props.pen}"
      data-default-tab="result"
      data-user="sol0mka"
      className='codepen'>
        See the Pen <a href='http://codepen.io/sol0mka/pen/8312611e3618e83d4103390afc2c8bef/'>8312611e3618e83d4103390afc2c8bef</a> by LegoMushroom (<a href='http://codepen.io/sol0mka'>@sol0mka</a>) on <a href='http://codepen.io'>CodePen</a>.
      </p>