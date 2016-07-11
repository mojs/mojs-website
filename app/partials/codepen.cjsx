React         = require 'react'
HeftyContent  = require 'partials/hefty-content'

module.exports = React.createClass
  getInitialState:-> { isInit: false, isHidden: false }
  _initPen:-> @setState('isInit': true, 'isHidden': false)
  _hidePen:-> @setState 'isHidden': true
  _loadPen:->
    if !(document.querySelector '#js-codepen-script')?
      pen = document.createElement('script'); pen.type = 'text/javascript'; pen.async = true
      pen.src = '//assets.codepen.io/assets/embed/ei.js'; pen.id  = 'js-codepen-script'
      (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild(pen)
    else window.__CPEmbed and (new window.__CPEmbed)

  render:->
    setTimeout @_loadPen, 10

    p = @props
    height = if p.height? then p.height else 345
    # minWidth = if p.minWidth? then "#{p.minWidth}px" else 'none'

    pen = if !@state.isInit or @state.isHidden then null else <p
        data-height="#{ height }"
        data-theme-id="15571"
        data-slug-hash="#{@props.pen}"
        data-default-tab="result"
        data-user="sol0mka"
        className='codepen'>
          See the Pen <a href="http://codepen.io/sol0mka/pen/#{@props.pen}/">{@props.pen}</a> by LegoMushroom (<a href='http://codepen.io/sol0mka'>@sol0mka</a>) on <a href='http://codepen.io'>CodePen</a>.
      </p>

    # { if !@state.isInit or @state.isHidden then null else <Pen pen={@props.pen} /> }

    <HeftyContent
      className="is-full-width"
      label = { 'tap to see the result' }
      onShow = {@_initPen}
      onHide = {@_hidePen}
      minHeight = { height } >
      {pen}
    </HeftyContent>



