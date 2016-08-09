React       = require 'react'
# mojs        = require 'mo-js'
{PrismCode} = require 'react-prism'
UniteLink   = require '../partials/unite-link'
Router      = require 'react-router'
Link        = Router.Link
Icon        = require '../partials/icon'
Pen         = require '../partials/codepen'
MotionDemo  = require '../pages/motion-demo/motion-demo.cjsx'
ApiDemo     = require '../partials/api-demo'
SocialNetworksAbout = require '../partials/social-networks-about'

# console.log(mojs);

require '../css/pages/download-page'

Download = React.createClass
  getInitialState: -> { isShow: false }
  componentDidMount:-> @_tm = setTimeout (=> @setState({ isShow: true });), 100
  componentWillUnmount:-> clearTimeout @_tm
  render:->
    className = if @state.isShow then 'is-shown' else ''
    <div className="page download-page #{className}">
      <div className="download-page__content">
        
        <h2>Download mo · js</h2>

        <div className="download-page__options code-block">
            <UniteLink
              type="button"
              link="http://cdn.jsdelivr.net/mojs/latest/mo.min.js"
              download
              className="button--blue"> Download latest </UniteLink>
        </div>

        <div className="download-page__options code-block">
          <div className="code-block__header">CDN:</div>
          <div className="code-block__body download-page__quick-start-normal">
            <PrismCode className="language-markup">
              {'<script src="http://cdn.jsdelivr.net/mojs/latest/mo.min.js"></script>'}
            </PrismCode>
          </div>
          <div className="code-block__body download-page__quick-start-mobile">
            <PrismCode className="language-markup">
              {'//cdn.jsdelivr.net/mojs/latest/mo.min.js'}
            </PrismCode>
          </div>
        </div>

        <div className="download-page__options code-block">
          <div className="code-block__header">NPM:</div>
          <div className="code-block__body">
            <PrismCode className="language-markup">
              {'npm install mo-js'}
            </PrismCode>
          </div>
        </div>

        <div className="download-page__options code-block">
          <div className="code-block__header">Bower:</div>
          <div className="code-block__body">
            <PrismCode className="language-markup">
              {'bower install mojs'}
            </PrismCode>
          </div>
        </div>

        

      
      <div className="download-page__buttons [ grid grid--sliced1 grid--gutter-x6 ]">
        <div className="grid-bit grid-bit--4-12">
          <UniteLink
            type="button"
            link="https://github.com/legomushroom/mojs"
            className="button--orange"> Download </UniteLink>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <UniteLink
            type="button"
            link="/tutorials/shape/"
            className="button--green"> Learn </UniteLink>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <UniteLink
            type="button"
            link="https://github.com/legomushroom/mojs"
            className="button--blue"> Contribute </UniteLink>
        </div>
      </div>

      <SocialNetworksAbout />

      </div> {# content end }
    </div>

# <pre className="code-block__body">
#   {'<script src="http://cdn.jsdelivr.net/mojs/0.119.0/mo.min.js"></script>'}
# </pre>

module.exports = Download