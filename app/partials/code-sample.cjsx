React         = require 'react'
{PrismCode}   = require 'react-prism'
Tappable      = require 'react-tappable'
mojs          = require 'mo-js'
HeftyContent  = require './hefty-content'

require '../css/partials/code-sample.styl'

module.exports = React.createClass
  _loadPen:->
    if !(document.querySelector '#js-codepen-script')?
      pen = document.createElement('script'); pen.type = 'text/javascript'; pen.async = true
      pen.src = '//assets.codepen.io/assets/embed/ei.js'; pen.id  = 'js-codepen-script'
      (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild(pen)
    else CodePenEmbed?._showCodePenEmbeds?()

  _showjs:->  @state.show isnt 'js'  and @setState show: 'js'
  _showes6:-> @state.show isnt 'es6' and @setState show: 'es6'
  _showcs:->  @state.show isnt 'cs'  and @setState show: 'cs'

  getInitialState:-> { show: 'js', isInit: false }
  _initPen:-> @setState 'isInit': true
    
  shouldComponentUpdate:(nextProps, nextState)-> @state.show isnt nextState.show or @state.isInit isnt nextState.isInit
  componentDidUpdate:->
    node = @getDOMNode()
    activeEl = node.querySelector '.line-numbers.is-show'
    syntax   = node.querySelector '#js-syntax'
    syntax.style.height = "#{activeEl.offsetHeight + 2}px"
    tween    = new mojs.Tween
      onUpdate:(p)-> activeEl.style.opacity = p
      onComplete:-> activeEl.style.opacity = 1
    tween.run()
    @_loadPen()

  render:->
    items = []; itemButtons = []

    childs = if @props.children instanceof Array then @props.children
    else [@props.children]

    for item, i in childs
      keys = Object.keys(item); key = keys[0]; value = item[key]
      lang = if key is 'cs' then 'coffeescript' else 'javascript'
      id   = "js-#{@props.pen}-#{key}"
      showClass = if @state.show is key then 'is-show' else ''
      items.push  <pre className="line-numbers #{showClass}" id="#{id}" style={opacity:0} key={i}>
                    <PrismCode className="language-#{lang} code-sample__code">
                      { value }
                    </PrismCode>
                  </pre>
      itemButtons.push <Tappable className="code-sample__button #{showClass}" onTap=@["_show#{key}"] key={i}>{key}</Tappable>


    penEl = if !@state.isInit then null
    else <p data-height="345" data-theme-id="15571" data-slug-hash="#{@props.pen}" data-default-tab="result" data-user="sol0mka" className='codepen'>See the Pen <a href='http://codepen.io/sol0mka/pen/8312611e3618e83d4103390afc2c8bef/'>8312611e3618e83d4103390afc2c8bef</a> by LegoMushroom (<a href='http://codepen.io/sol0mka'>@sol0mka</a>) on <a href='http://codepen.io'>CodePen</a>.</p>

    className = if !@props.pen? then 'is-alone' else ''
    <div className="code-sample #{className}">
      <div className="code-sample__syntax" id="js-syntax">
        <div className="code-sample__buttons">{itemButtons}</div>
        <div className="code-sample__codes">{items}</div>
      </div>
      <div className="code-sample__pen">
        <HeftyContent isVisibilityToggle={true} onShow = @_initPen >
          { penEl }
        </HeftyContent>
      </div>
    </div>
