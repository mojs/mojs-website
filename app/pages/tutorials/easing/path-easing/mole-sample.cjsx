React       = require 'react'


module.exports = React.createClass
  render:->
    <div className="mole-skew-sample #{@props.className}" id="#{@props.id or ''}">
      <div className="mole-scene" id="js-mole-scene">

        <div id="js-cube-scene" className="cube-wrapper">
          <div className="cube-shadow-wrapper" id="js-shadow-wrapper">
            <div className="cube-shadow" id="js-shadow"></div>
          </div>
        </div>

        <div className="mole mole-scene__mole" id="js-mole">
          <div className="mole__inner" id="js-mole-inner">

            <div id="js-mole-hat" className="mole__hat">
              <div className="mole__hat-base">
                <div className="mole__hat-shadow" id="js-mole-hat-shadow"></div>
              </div>
              <div className="mole__hat-cone-wrapper">
                <div className="mole__hat-cone-rotator" id="js-mole-hat-cone">
                  <div className="mole__hat-cone"></div>
                </div>
              </div>
            </div>

            <div className="mole__head">
              <div className="mole-mouth">
                <div className="mole-mouth__inner" id="js-mole-tongue">
                  <svg viewBox="0 0 60 60" style= { maxWidth: '20px' }>
                    <path id="js-mole-tongue-path" d="M0 30 Q 20 10, 30 25 T 50 30" stroke="#C95549" fill="none" strokeWidth="18" strokeLinecap="round" />
                  </svg>
                </div>
              </div>
              <div className="mole__mouth-wrapper" id="js-mole-mouth">
                <div className="mole__mouth" id="js-mole-mouth-outer">
                  <div className="mole__mouth-inner" id="js-mole-mouth-inner"></div>
                </div>
              </div>
            </div>
            <div className="mole__eye" id="js-mole-eye">
              <svg width="13px" height="6px" viewBox="0 0 13 6">
                <g id="Page-1" stroke="none" strokeWidth="1" fill="none" fill-rule="evenodd">
                    <path d="M0,0 Q 6.5 10, 13 0" id="js-mole-eye-lash" stroke="#4C4040" strokeWidth="2"></path>
                </g>
              </svg>
            </div>
            <div className="mole__glasses" id="js-mole-glasses"></div>
            <div className="mole__glasses-left" id="js-mole-glasses-left"></div>
            <div className="mole__body" id="js-mole-body"></div>
            <div className="mole__hand" id="js-mole-hand">
              <div className="mole__hand-circle" id="js-mole-hand-circle"></div>
            </div>
            <div className="mole__hand-left" id="js-mole-hand-left"></div>  
          </div>
        </div>

        <div className="mole-scene__door">
          <div className="door-shadow">
            <div className="door-shadow__el" id="js-door-shadow"></div>
          </div>
          <div className="mole-scene__door-rotation" id="js-door">
            <div className="shape cuboid-1 cub-1 door">
              <div className="face ft"></div>
              <div className="face bk"></div>
              <div className="face rt"></div>
              <div className="face lt"></div>
              <div className="face bm"></div>
              <div className="face tp">
                <div className="door-handle">
                  <div className="door-handle__shadow">
                    <div className="door-handle__shadow-inner" id="js-door-handle-shadow"></div>
                  </div>
                  <div className="door-handle__part door-handle__part--bottom"></div>
                  <div className="door-handle__part door-handle__part--top"></div>
                </div>
              </div>
              <div className="cr cr-0">
                <div className="face side s0"></div>
                <div className="face side s1"></div>
                <div className="face side s2"></div>
              </div>
              <div className="cr cr-1">
                <div className="face side s0"></div>
                <div className="face side s1"></div>
                <div className="face side s2"></div>
              </div>
              <div className="cr cr-3">
                <div className="face side s0"></div>
                <div className="face side s1"></div>
                <div className="face side s2"></div>
              </div>

            </div>
          </div>
        </div>
        <div className="mole-scene__ground"></div>
        <div className="mole-scene__door-wave-wrapper">
          <div className="mole-scene__door-wave" id="js-door-wave"></div>
        </div>
        <div className="mole-scene__mask"></div>
      </div>
    </div>