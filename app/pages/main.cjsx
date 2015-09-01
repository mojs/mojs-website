React       = require 'react'
mojs        = require 'mo-js'
{PrismCode} = require 'react-prism'
UniteLink   = require '../partials/unite-link'
Router      = require 'react-router'
Link        = Router.Link
Icon        = require '../partials/icon'
# MotionDemo  = require '../pages/motion-demo/motion-demo.cjsx'
ApiDemo     = require '../partials/api-demo'
SocialNetworksAbout = require '../partials/social-networks-about'

require '../css/pages/main-page'

Main = React.createClass
  render:->
    <div className="page main-page">
      <div className="main-page__content">
        <div className="motion-lettering"></div>
        
        <div className="main-page__features [ grid grid--gutter-x0 grid--sliced ]">

          <div className="[ main-page__features-row main-page__features-row--1 ] grid-row">
            <div className="grid-bit grid-bit--4-12">
              <div className="feature feature--fast">
                <div className="feature__image"></div>
                <div className="feature__header">Fast</div>
                <div className="feature__text">
                  Silky smooth animations for the staggering user's experience.
                </div>
              </div>
            </div>
            <div className="grid-bit grid-bit--4-12">
              <div className="feature feature--retina">
                <div className="feature__image"></div>
                <div className="feature__header">Retina Ready</div>
                <div className="feature__text">
                  Screen density independent effects as a response to the modern web call.
                </div>
              </div>
            </div>
            <div className="grid-bit grid-bit--4-12">
              <div className="feature feature--simple">
                <div className="feature__image"></div>
                <div className="feature__header">Simple</div>
                <div className="feature__text">
                  Simple declarative APIs to master your motion project with ease.
                </div>
              </div>
            </div>
          </div>

          <div className="[ main-page__features-row main-page__features-row--2 ] grid-row">
            <div className="grid-bit grid-bit--4-12">
              <div className="feature feature--modular">
                <div className="feature__image"></div>
                <div className="feature__header">Modular</div>
                <div className="feature__text">
                  Specific bundle for the current project's needs. Bye bye large file size overheads.
                </div>
              </div>
            </div>
            <div className="grid-bit grid-bit--4-12">
              <div className="feature feature--robust">
                <div className="feature__image"></div>
                <div className="feature__header">Robust</div>
                <div className="feature__text">
                  1000+ unit tests and ci techniques carve & backstrap the reliable tool.
                </div>
              </div>
            </div>
            <div className="grid-bit grid-bit--4-12">
              <div className="feature feature--open-sourced">
                <div className="feature__image"></div>
                <div className="feature__header">Open Sourced</div>
                <div className="feature__text">
                  Great growing community refines the tool fast and ships frequently.
                </div>
              </div>
            </div>
          </div>

        </div>

        <div className="main-page__quick-start code-block">
          <div className="code-block__header">Quick start:</div>
          <div className="code-block__body main-page__quick-start-normal">
            <PrismCode className="language-markup">
              {'<script src="http://cdn.jsdelivr.net/mojs/latest/mo.min.js"></script>'}
            </PrismCode>
          </div>
          <div className="code-block__body main-page__quick-start-mobile">
            <PrismCode className="language-markup">
              {'//cdn.jsdelivr.net/mojs/latest/mo.min.js'}
            </PrismCode>
          </div>
          <div className="code-block__footer">
            Also install thru <a href="https://www.npmjs.com/package/mo-js">npm</a>, <a href="http://bower.io/search/?q=mojs">bower</a> or <a href="http://cdn.jsdelivr.net/mojs/latest/mo.min.js">CDN</a>. <a href="#">Build your own bundle</a>.
          </div>
        </div>

        <ApiDemo />

      { ### <MotionDemo /> ### }
      
      <div className="main-page__buttons [ grid grid--sliced1 grid--gutter-x6 ]">
        <div className="grid-bit grid-bit--4-12">
          <UniteLink
            type="button"
            link="https://github.com/legomushroom/mojs"
            className="button--orange"> Download </UniteLink>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <UniteLink
            type="button"
            link="tutorials"
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

module.exports = Main