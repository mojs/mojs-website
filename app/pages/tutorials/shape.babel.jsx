import React        from 'react';
import Resizable    from 'react-component-resizable';
import ORXLine      from 'partials/orx-line';
import UniteLink    from 'partials/unite-link';
import Cite         from 'partials/cite';
import CodeSample   from 'partials/code-sample';


const ShapePage = new React.createClass({
  getInitialState () { return { isShow: false }; },
  _onResize () { window.dispatchEvent(new Event('resize')) },
  componentWillUnmout () { clearTimeout(this._tm); },
  componentDidMount () {
    this._checkHeight();
    this._tm = setTimeout( () => {
      this.setState({ isShow: true }); this._setRealHeight();
    }, 500) ;
  },
  _checkHeight () {
    const url = sessionStorage.getItem('beforeUnloadURL');
    const height = sessionStorage.getItem('beforeUnloadPostHeight');
    if (url === window.location.href) {
      const el = this.getDOMNode();
      el.style['min-height'] = "#{height}px"
    }
  },
  _setRealHeight () { this.getDOMNode().style['min-height'] = "auto"; },

  render() {
    let content = null;
    if (this.state.isShow) {
      content = <div>
          <div className="post__header">Shape & ShapeSwirl</div>
          <div className="post__description"> This post is Shape and ShapeSwirl. Modules that help you to bootsrap motion effects with declarative calls.</div>
          <ORXLine className="post__orx-line" />
          
          <h2> Shape </h2>
          <p>
            <span className="highlight">Shape</span> is a special <span className="highlight">mojs</span> module that bootstraps visual effects.  The idea behind <span className="highlight">Shapes</span> is simple and neat - you can have animatable shape in any part of the screen or <span className="highlight">HTML</span> element with one declarative call. So it's like saying:
          </p>
          <Cite>
            Hey Computer! I want a pink outlined polygon right in the middle of the screen!
          </Cite>
          
          <p> or like something this: </p>

          <Cite>
            Hey Machine! I want a dust trail after this element when it moves!
          </Cite>
          <p>
            And appropriate effects should appear. Most importantly, <span className="highlight">Shape</span> is a tiny bit that can compose more mature modules like <span className="highlight"><UniteLink link="/tutorials/burst/">Burst</UniteLink></span> or <span className="highlight">Stagger</span>  which we will discuss shortly in the upcoming tutorials, right now I should make sure you are comfortable with <span className="highlight"><UniteLink link="https://github.com">Shape APIs</UniteLink></span> and use cases.
          </p>

          <p>
            So in the simplest way - <span className="highlight">Shape</span> is just a declarative shape transition in any desired place of the screen and moment of the time. The concept can be confusing at first, so I will try to give you as much code samples as possible, there is a code sample:
          </p>

          <CodeSample pen="f2227be6d2ac4ea73dc43fbe78046ec9">
            {
              { js: `var shape = new mojs.Shape({
      shape:        'circle',
      isShowStart:  true
    });`
              }
            }
          </CodeSample>

          <p>
            Nothing interesting yet. Just hotpink circle right in the center of the screen. You can set presentation properties:
          </p>

          <CodeSample pen="d929be6cdb64bb0a2979f35669284197">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',
  radius:       25,
  fill:         'none',
  stroke:       '#F64040',
  strokeWidth:  5,
  isShowStart:  true,
});
`
              }
            }
          </CodeSample>

          <p>
            Colors could be expressed in different forms - <UniteLink link="https://www.w3.org/TR/css3-color/">color keywords</UniteLink>, <span className="highlight">rgb</span>, <span className="highlight">rgba</span> and <span className="highlight">hex</span>.
          </p>

          <p>
            Every shape has <span className="highlight">radius</span> property that controls it's size. Also <span className="highlight">radiusx</span>/<span className="highlight">radiusY</span> that by default fallback to the <span className="highlight">radius</span> value.
          </p>

          <CodeSample pen="617994a375f9373488b3821707d593c2">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',
  radius:       25,
  radiusX:      35, // explicit radiusX
  fill:         'transparent',
  stroke:       '#F64040',
  strokeWidth:  7,
  isShowStart:  true,
});
`
              }
            }
          </CodeSample>

          <br />
          <p>
            Every property could be unit based (like <span className="highlight">top</span>/<span className="highlight">left</span> below) or even can be expressed with <span className="highlight">rand</span> strings (like <span className="highlight">x</span> below):
          </p>

          <CodeSample pen="d7b4e84ddcd72664709f2394ce9f7968">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',
  isShowStart:  true,
  left: '10%',  top: '60%',
  x:            'rand(0, 200)'
});
`
              }
            }
          </CodeSample>

          <p>
            We've set random value for the <span className="highlight">x</span> property in interval from <span className="highlight">0</span> to <span className="highlight">200</span>.
          </p>

        <h2>Delta (∆)</h2>

        <p>
          Now let's animate the shape. To keep the <span className="highlight">APIs</span> declarative, <span className="highlight">mojs</span> uses <span className="highlight">delta</span> objects to describe transitions of shape properties:
        </p>


        </div>
    }

    const className = (this.state.isShow) ? 'is-show' : '';
    const classNameLoading = (this.state.isShow) ? 'is-hide' : '';
    return  <Resizable className="post" onResize={this._onResize} id="post">
              <div className={`post__loading ${classNameLoading}`}> Loading The Post.. </div>
              <div className={`post__content ${className}`}>{content}</div>
            </Resizable>;
  }
});

export default ShapePage;