React  = require 'react'
Router = require 'react-router'
{ Route, RouteHandler, Link } = Router
UniteLink      = require './unite-link'
SocialNetworks = require './social-networks'
ORXLine        = require './orx-line'

require '../css/partials/tutorials-sidebar'
module.exports = React.createClass
  render: ()->
    <div className="tutorials-sidebar">
      <div className="tutorials-sidebar__content">
        <div className="tutorials-sidebar__section">
          <div className="tutorials-sidebar__header"> Basics </div>
          <UniteLink link="getting-started" isDisabled="true" className="tutorials-sidebar__link"> Getting Started </UniteLink>
          <UniteLink link="motion-path" isDisabled="true" className="tutorials-sidebar__link">     APIs Overview   </UniteLink>
          <UniteLink link="motion-path" isDisabled="true" className="tutorials-sidebar__link">     Change Log      </UniteLink>
          <UniteLink link="motion-path" isDisabled="true" className="tutorials-sidebar__link">     Thank Yous!     </UniteLink>
        </div>

        <div className="tutorials-sidebar__section">
          <div className="tutorials-sidebar__header"> Modules </div>
          <UniteLink link="/tutorials/shape/" className="tutorials-sidebar__link"> Shape & Swirl </UniteLink>
          <UniteLink link="/tutorials/burst/" className="tutorials-sidebar__link"> Burst </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Stagger </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Motion Path      </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Spriter          </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Radial Spring    </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Spring Wave      </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Goo Transforms   </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Broom            </UniteLink>
        </div>

        <div className="tutorials-sidebar__section">
          <div className="tutorials-sidebar__header"> Easing </div>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Intro </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Base Easing Funcions </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Bezier Curves </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Springs </UniteLink>
          <UniteLink link="/tutorials/easing/path-easing/" className="tutorials-sidebar__link"> Path Easing </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Transforms </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Helpers </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Mix </UniteLink>
        </div>

        <div className="tutorials-sidebar__section">
          <div className="tutorials-sidebar__header"> Tweening </div>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Tween    </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> Timeline </UniteLink>
            <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> HTween </UniteLink>
          <UniteLink link="/" isDisabled="true" className="tutorials-sidebar__link"> OTween   </UniteLink>
        </div>

        <ORXLine />

      </div>
      <SocialNetworks className="tutorials-sidebar__social-networks" />
    </div>
