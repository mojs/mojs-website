React     = require 'react'
Router    = require 'react-router'
Link      = Router.Link
Icon      = require './icon'
Button    = require './button'
UniteLink = require './unite-link'
Headroom  = require 'react-headroom'
Tapable   = require 'react-tappable'
Router    = require 'react-router'
require '../css/partials/header.styl'

# <Link to="app" className="header__link">main</Link>
Header = React.createClass
  getInitialState:->
    Router.HistoryLocation.addChangeListener (route)=> @setState 'page': route.path
    {}
  _toggleMobileMenu:-> @setState isShowMenu: !@state.isShowMenu
  _onTap:(e)->
    isLink = e.target.classList.contains('link')
    isLinkParent = e.target.parentNode.classList.contains('link')
    setTimeout =>
      @_toggleMobileMenu() if isLink or isLinkParent
    , 100
    e

  render:->
    headerClass = if @state.isShowMenu then 'is-show-menu' else ''
    btnClass    = if @state.isShowMenu then 'is-open'      else ''

    <Tapable className="header #{headerClass}" onTap=@_onTap>  
      <Headroom>
        <Link to="app" className="header__logo-link">
          <Icon className="header__logo" path="mojs-loop" />
        </Link>
        <div className="header__links">
          <div className="header__links-inner">
            <UniteLink link="tutorials" className="header__link"> Tutorials </UniteLink>
          </div>
          <div className="header__links-inner">
            <UniteLink isDisabled="true" link="/" className="header__link"> APIs </UniteLink>
          </div>
          <div className="header__links-inner">
            <UniteLink
              link="https://github.com/legomushroom/mojs"
              className="header__link"> Demos </UniteLink>
          </div>
          <div className="header__links-inner">
            <UniteLink
              link="https://github.com/legomushroom/mojs"
              className="header__link"> Contribute </UniteLink>
          </div>
          <div className="header__links-inner">
            <UniteLink
              type="button"
              link="https://github.com/legomushroom/mojs"
              className="header__link button--orange"> Download </UniteLink>
          </div>
        </div>
        <Tapable className="sandwich-menu header__sandwich-menu #{btnClass}" onTap=@_toggleMobileMenu>
          <div className="sandwich-menu__bg"></div>
          <div className="sandwich-menu__line sandwich-menu__line--top"></div>
          <div className="sandwich-menu__line sandwich-menu__line--bottom"></div>
        </Tapable>
      </Headroom>
    </Tapable>

module.exports = Header