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
        
        <div className="post__header">Download mo · js</div>

        <div className="download-page__options code-block">
            <div className="code-block__header">LATEST VERSION:</div>
            <UniteLink
              type="button"
              link="http://cdn.jsdelivr.net/mojs/latest/mo.min.js"
              download
              className="button--blue"> Download </UniteLink>
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

      </div> {# content end }        
      

      <form className="download-page__list">
          
        
        <div className="post__header">Custom download</div>
        <p className="post__description">Choose the components you needs</p>
        
        <div className="listitems__wrap">
          <div className="listitems">

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="h" id="h"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              h
              <div className="listitem__description">
                <div className="listitem__description__header">h:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Shape" id="Shape"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Shape
              <div className="listitem__description">
                <div className="listitem__description__header">Shape:</div>
                <p>Create predefined and custom shapes.</p>
                <p><a href="https://github.com/legomushroom/mojs/blob/master/api/shape.md">API</a></p>
                <p><a href="/tutorials/shape/">Shape Tutorial</a></p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="ShapeSwirl" id="ShapeSwirl"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              ShapeSwirl
              <div className="listitem__description">
                <div className="listitem__description__header">ShapeSwirl:</div>
                <p>Lorem ipsum dolem es simet</p>
                <p><a href="https://github.com/legomushroom/mojs/blob/master/api/shape-swirl.md">API</a></p>
                <p><a href="/tutorials/shape/">ShapeSwirl Tutorial</a></p>

              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Burst" id="Burst"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Burst
              <div className="listitem__description">
                <div className="listitem__description__header">Burst:</div>
                <p>Lorem ipsum dolem es simet</p>
                <p><a href="https://github.com/legomushroom/mojs/blob/master/api/burst.md">API</a></p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Html" id="Html"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Html
              <div className="listitem__description">
                <div className="listitem__description__header">Html:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="stagger" id="stagger"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              stagger
              <div className="listitem__description">
                <div className="listitem__description__header">stagger:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Spriter" id="Spriter"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Spriter
              <div className="listitem__description">
                <div className="listitem__description__header">Spriter:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="MotionPath" id="MotionPath"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              MotionPath
              <div className="listitem__description">
                <div className="listitem__description__header">MotionPath:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Tween" id="Tween"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Tween
              <div className="listitem__description">
                <div className="listitem__description__header">Tween:</div>
                <p>Lorem ipsum dolem es simet</p>
                <p><a href="https://github.com/legomushroom/mojs/blob/master/api/tweens/tween.md">API</a></p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Timeline" id="Timeline"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Timeline
              <div className="listitem__description">
                <div className="listitem__description__header">Timeline:</div>
                <p>Lorem ipsum dolem es simet</p>
                <p><a href="https://github.com/legomushroom/mojs/blob/master/api/tweens/timeline.md">API</a></p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Tweenable" id="Tweenable"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Tweenable
              <div className="listitem__description">
                <div className="listitem__description__header">Tweenable:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Thenable" id="Thenable"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Thenable
              <div className="listitem__description">
                <div className="listitem__description__header">Thenable:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Tunable" id="Tunable"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Tunable
              <div className="listitem__description">
                <div className="listitem__description__header">Tunable:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="Module" id="Module"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              Module
              <div className="listitem__description">
                <div className="listitem__description__header">Module:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="tweener" id="tweener"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              tweener
              <div className="listitem__description">
                <div className="listitem__description__header">tweener:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="easing" id="easing"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              easing
              <div className="listitem__description">
                <div className="listitem__description__header">easing:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <label className="listitem">
              <input type="checkbox" className="listitem__checkbox" value="shapesMap" id="shapesMap"></input>
              <div className="listitem__wrap">
                <span className="listitem__indicator"></span>
              </div>
              shapesMap
              <div className="listitem__description">
                <div className="listitem__description__header">shapesMap:</div>
                <p>Lorem ipsum dolem es simet</p>
              </div>
            </label>

            <div className="row">
              <UniteLink
                type="button"
                className="button--blue button--customdownload"> Build </UniteLink>
            </div>
          </div>


        </div>

      </form>

      <SocialNetworksAbout />

    </div>

# <pre className="code-block__body">
#   {'<script src="http://cdn.jsdelivr.net/mojs/0.119.0/mo.min.js"></script>'}
# </pre>

module.exports = Download