import React        from 'react';
import Resizable    from 'react-component-resizable';
import ORXLine      from 'partials/orx-line';
import UniteLink    from 'partials/unite-link';
import Cite         from 'partials/cite';
import CodeSample   from 'partials/code-sample';
import Pen          from 'partials/codepen';
import HeftyContent from 'partials/hefty-content';
import More         from 'partials/more.babel.jsx';
import PostImage    from 'partials/post-image';
import Gif          from 'partials/gif.babel.jsx';
import SocialNetworksAbout from 'social-networks-about';
import DisqusComments from 'disqus-comments';
// const More = require('partials/more');

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
          <div className="post__description"> This post is about Shape and ShapeSwirl - modules that help you to bootsrap motion effects.</div>
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
            And appropriate effects should appear. Most importantly, <span className="highlight">Shape</span> is a tiny bit that can be composed into more mature modules like <span className="highlight"><UniteLink link="/tutorials/burst/">Burst</UniteLink></span> or <span className="highlight">Stagger</span>  which we will discuss shortly in the upcoming tutorials, right now I should make sure you are comfortable with <UniteLink link="https://github.com/legomushroom/mojs/api/shape.md">Shape APIs</UniteLink> and use cases.
          </p>

          <p>
            So in the simplest way - <span className="highlight">Shape</span> is just a declarative shape transition in any desired place of the screen in any moment of the time. The concept can be confusing at first, so I will try to give you as much code samples as possible, there is the first one:
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
            Nothing interesting yet. Well maybe there is one thing - the shape magically appears just in the middle of the codepen. <span className="highlight">mojs</span> takes care to create as little container for the shape as possible, bootstraps all the markup and places the result just where you want it. Pretty handy. <span className="highlight">isShowStart</span> property says to the shape to be visible even before animation starts.
          </p>

          <p>
            Obviously, you can style the shape as you want:
          </p>

          <CodeSample pen="d929be6cdb64bb0a2979f35669284197">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',  // shape "circle" is default
  radius:       25,        // shape radius
  fill:         'white',    // same as 'transparent'
  stroke:       '#F64040', // or 'cyan'
  strokeWidth:  5,         // width of the stroke
  isShowStart:  true,      // show before any animation starts
});
`
              }
            }
          </CodeSample>

          <p>
            The entire list of shape properties with comments could be found at <UniteLink link="https://github.com/legomushroom/mojs/api/shape.md">Shape API</UniteLink> section.
          </p>

          <p>
            Colors could be expressed in different forms like <UniteLink link="https://www.w3.org/TR/css3-color/">color keywords</UniteLink>, <span className="highlight">rgb</span>, <span className="highlight">rgba</span> or <span className="highlight">hex</span>. Numeric properties may be unit based (like <span className="highlight">top</span>/<span className="highlight">left</span> below) or can be expressed with <span className="highlight">rand</span> strings (like <span className="highlight">x</span> below):
          </p>

          <CodeSample pen="d7b4e84ddcd72664709f2394ce9f7968">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',
  top:          '50%',
  x:            'rand(-250, 250)',
  isShowStart:  true,
});`
              }
            }
          </CodeSample>

          <p>
            We've set random value for the <span className="highlight">x</span> property in interval from <span className="highlight">-250</span> to <span className="highlight">250</span> so it should show up in random position inside that period every time you will rerun the pen. <span className="highlight">rand</span> string syntax is simple - it takes start and end value to generate the eventual value from those two.
          </p>

          <p>
            The <span className="highlight">radius</span> property sets shape's (no prizes for guessing) radius. Also you can set <span className="highlight">radiusX</span>/<span className="highlight">radiusY</span> values explicitly with appropriate properties which by default fallback to the value of the <span className="highlight">radius</span>.
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

          <p>
            Worth noting that the <span className="highlight">radius</span> property is a property that determines size of any shape, not just <span className="highlight">circle</span> as in example above, so if you have a shape of <span className="highlight">rect</span> or <span className="highlight">polygon</span> or any other, they would have <span className="highlight">radius</span> properties too just like a circle shape:
          </p>

          <CodeSample pen="53893077e0318813dd16cefc7b3e9932">
            {
              { js: `var circle = new mojs.Shape({
  shape:        'circle',
  radius:       10,
  radiusX:      20, // explicit radiusX
  left:         '25%',
  fill:         'deeppink',
  isShowStart:  true,
});

var rect = new mojs.Shape({
  shape:        'rect',
  radius:       10,
  radiusX:      20, // explicit radiusX
  left:         '50%',
  fill:         'cyan',
  isShowStart:  true,
});

var polygon = new mojs.Shape({
  shape:        'polygon',
  radius:       10,
  radiusY:      20, // explicit radiusY
  left:         '75%',
  fill:         'yellow',
  isShowStart:  true,
});
`
              }
            }
          </CodeSample>

          <p>
            Also <span className="highlight">radius</span> properties control form of shape not just size - it gets pretty clear with <span className="highlight">zigzag</span> or <span className="highlight">curve</span> shapes:
          </p>

          <CodeSample pen="fc3ffe076aaafdb173f12d8688cde450">
            {
              { js: `var zigzag = new mojs.Shape({
  shape:        'zigzag',
  points:       11,
  radius:       25,
  radiusY:      50,
  left:         '25%',
  fill:         'none',
  stroke:       'deeppink',
  isShowStart:   true,
});

var curve = new mojs.Shape({
  shape:        'curve',
  points:       11,
  radius:       25,
  radiusY:      50,
  left:         '50%',
  fill:         'none',
  stroke:       'deeppink',
  isShowStart:   true,
});

var cross = new mojs.Shape({
  shape:        'cross',
  points:       11,
  radius:       25,
  radiusX:      50,
  left:         '75%',
  fill:         'none',
  stroke:       'deeppink',
  isShowStart:   true,
  y:            -25,
});`
              }
            }
          </CodeSample>

        <p>
          You can see in example above, the <span className="highlight">radiusY</span> controls size of the spikes for <span className="highlight">zigzag</span> shape in the first case and bend for the <span className="highlight">curve</span> shape in the second one.
        </p>

        <p>
          As for boolean properties of the shape, they start with <span className="highlight">is</span> prefix to separate them from other values.
        </p>
          

        <h2>Delta (∆)</h2>

        <p>
          To keep the <span className="highlight">APIs</span> declarative, <span className="highlight">mojs</span> uses <span className="highlight">delta</span> objects to describe transitions of shape properties:
        </p>

        <CodeSample pen="16c150d81dfddc047a1eda3eb6dffe75">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',
  scale:         { 0 : 1 },
   
  easing:        'cubic.out',
  delay:         1000,
  repeat:        999
}).play();`
              }
            }
          </CodeSample>

          <p>
            We have set transition for the <span className="highlight">scale</span> property of the shape from <span className="highlight">0</span> to <span className="highlight">1</span>. As you can see <span className="highlight">delta</span> in <span className="highlight">mojs</span> is plain javascript object that holds <span className="highlight">start</span> and <span className="highlight">end</span> state of the property, where <span className="highlight">key</span> of the object is the <span className="highlight">start</span> state and <span className="highlight">value</span> of the object is the <span className="highlight">end</span> state respectively. If you still feel confused, just change <span className="highlight">:</span> to <span className="highlight">-></span> in your mind and you will have <span className="highlight">{ '0 -> 1' }</span> outcome which might be more intuitive.
          </p>

          <p>
            Start and end values in the <span className="highlight">delta</span> object can be <span className="highlight">unit</span> based or random (<span className="highlight">rand</span>) ones or whatever you have — just the same as we did it before with static values (all objects in the code sample below are deltas):
          </p>

          <CodeSample pen="bbd4fe6c1ac8519c76bc18828844e2c3">
            {
              { js: `const circle = new mojs.Shape({
  shape:        'circle',
  scale:        { 0 : 1 },
  left:         '25%',
  fill:         { 'cyan': 'yellow' },
  radius:       25,
  
  duration:     2000,
  repeat:       999,
}).play();


const rect = new mojs.Shape({
  shape:        'rect',
  left:         '50%',
  fill:         'none',
  radius:       20,
  stroke:       { 'rgba(0,255,255, 1)' : 'magenta' },
  strokeWidth:  { 10: 0 },
  strokeDasharray: '100%',
  strokeDashoffset: { '-100%' : '100%' },
  angle:        { 0: 180 },
  
  duration:     2000,
  repeat:       999,
}).play();


const polygon = new mojs.Shape({
  shape:        'polygon',
  points:       5,
  left:         '75%',
  fill:         { 'deeppink' : '#00F87F' },
  x:            { 'rand(-100%, -200%)' : 0  },
  angle:        { 0: 'rand(0, 360)' },
  radius:       25,

  duration:     2000,
  repeat:       999,
}).play();`
              }
            }
          </CodeSample>

          <p>
            Here, delta of the <span className="highlight">strokeDashoffset</span> property on the rectangle uses <span className="highlight">unit based</span> values. The delta of the <span className="highlight">x</span> property of the polygon shape uses random unit based values. The delta of the <span className="highlight">fill</span> property for all the shapes uses <span className="highlight">color keywords</span> to describe color transitions.
          </p>

          <p>
            The nice thing about declarative APIs is that you define <span className="highlight">what</span> you want to do by contrast with <span className="highlight">how</span> to do it, so it makes intention of the transition cristal clear with just one short glimpse. Consider this code sample of a triangle:
          </p>

          <CodeSample pen="e046c8eaa32149c47c04e209336e0ff0">
            {
              { js: `const tri = new mojs.Shape({
  shape:      'polygon',
  fill:       'orange',
  radius:     65,
  angle:      { [-120]: -40 },
  x:          { [-200]: 20 },
  y:          { [50]: -20 },
  scaleX:     { 0 : 1.3 },
  
  repeat:     10,
  duration:   800,
  isYoyo:     true,
  backwardEasing: 'sin.in',

  isShowEnd:  false
}).play();`
              }
            }
          </CodeSample>


          <p>
            If you will translate this code sample to proper English, you will have something like this —  we have a <span className="highlight">orange</span> <span className="highlight">polygon</span> of <span className="highlight">65px radius</span> right in the middle of the screen(by default), when animation starts — it rotates from <span className="highlight">-120</span> to <span className="highlight">-40</span> degrees, shifts <span className="highlight">180px</span> to the right starting from <span className="highlight">-200px</span> and <span className="highlight">scale</span>s from <span className="highlight">0</span> to <span className="highlight">1.3</span> concurrently. That happens during <span className="highlight">800ms</span> and repeats <span className="highlight">10</span> times with default <span className="highlight">easing</span> and <span className="highlight">sin.in</span> easing when moving backward in <span className="highlight">yoyo</span> period. When animation ends, the shape <span className="highlight">dissapears</span>.
          </p>

          <p>
            Note that almost every property transition besides <span className="highlight">tween</span> properties (like duration/delay etc) and <span className="highlight">boolean</span> values, can be expressed with <span className="highlight">delta</span> object, please refer to the <UniteLink link="https:/github.com/legomushroom/mojs/api/shape.md">API</UniteLink> on that matter. The <span className="highlight">∆</span> symbol in the comment right above properties defines that the property is <span className="highlight">"deltable" thus supports delta transitions</span>.
          </p>

          <p>
            Delta can also have it's own explicit <span className="highlight">easing</span> field that can hold any <span className="highlight">mojs</span> <UniteLink link="">easing type</UniteLink>, this makes shape transitions more flexible to the real world needs.
          </p>

          <CodeSample pen="942a661cec312c922af18f3446f894a0">
            {
              { js: `const circle = new mojs.Shape({
  shape:        'circle',
  scale:        { 0 : 1, easing: 'cubic.out' },
  fill:         { 'cyan': 'yellow', easing: 'cubic.in' },
  
  duration:     2000,
  repeat:       999,
}).play();`
              }
            }
          </CodeSample>

          <p>
            Here above, we've defined the explicit easing values for <span className="highlight">scale</span> and <span className="highlight">fill</span> properties.
          </p>

          <p>
            The 3rd property that is available on delta objects is <span className="highlight">curve</span> property that overrides <span className="highlight">easing</span> property if both present. The <span className="highlight">curve</span> property is the way to go if you want to declare a <span className="highlight">property curve</span> for a property transition, where start and end values of the <span className="highlight">delta</span> are curve's base that will be multiplied by current curve's value when animation runs:
          </p>

          <CodeSample pen="8a4d6ffc83e6c8633b26f0691055cdad">
            {
              { js: `const shiftCurve = mojs.easing.path( 'M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0' );
const scaleCurveBase = mojs.easing.path( 'M0,100 C21.3776817,95.8051376 50,77.3262711 50,-700 C50,80.1708527 76.6222458,93.9449005 100,100' );
const scaleCurve = (p) => { return 1 + scaleCurveBase(p); };
const nScaleCurve = (p) => { return 1 - scaleCurveBase(p)/10; };

const circle = new mojs.Shape({
  shape:        'rect',
  fill:         '#F64040',
  radius:       10,
  x:            { [-125]  : 125, easing: shiftCurve },
  scaleX:       { 1 : 1, curve: scaleCurve },
  scaleY:       { 1 : 1, curve: nScaleCurve },
  origin:       { '0 50%' : '100% 50%', easing: shiftCurve },
  isForce3d:    true,
  
  isYoyo:         true,
  delay:        500,
  duration:     800,
  repeat:       999,
}).play();`
              }
            }
          </CodeSample>

          <p>
            We won't spend a lot of time with <span className="highlight">property curves</span> in this tutorial, but I highly encorage you to dig into the <UniteLink link="http://mojs.io/tutorials/easing/path-easing/">topic</UniteLink> because it is a very sophisticated and powerful concept to note.
          </p>

          <p>
            So to recap, <span className="highlight">delta</span>'s syntax:
          </p>

          <CodeSample>
            {
              { js: `{
  startState: endState,
  easing:     'cubic.out',     // optional 'easing',
  curve:      'M0,100 L100,0'  // optional  'curve' that supress 'easing' if both present
}`
              }
            }
          </CodeSample>

          <p>At this point we can declare and animate shapes.</p>

          <p>Then what?</p>


          <h2>Then Zen</h2>

          <p>
            You can chain shape states with <span className="highlight">then</span> calls (hit play button to see):
          </p>

          <CodeSample pen="e4a17fe53a61bea14e783cce0df7ddb2">
            {
              { js: `const shape = new mojs.Shape({
  shape:          'rect',
  fill:           'none',
  stroke:         'cyan',
  radius:         10,
  strokeWidth:    20,
  angle:          { [-180] : 0 },
  
  duration:       600
}).then({
  strokeWidth:    0,
  scale:          { to: 2, easing: 'sin.in' },
});`
              }
            }
          </CodeSample>

          <em>
            <i>Note</i>: In the demo above, I've added <span className="highlight">MojsPlayer</span> to control the demo sequnce instead of explicit <span className="highlight">.play</span> call on the shape. <span className="highlight">MojsPlayer</span> is part of <span className="highlight">mojs tools</span> that gives you GUI contols thus helps you to craft your motion sequence. Also it keeps the animation and settings state on page reloads, saving you lots of time and effort. Since our animations can get quite complex, the player could be a good aide.
          </em>

          <p>
            So in the demo above, we have continued the sequence with the next state declaration for the <span className="highlight">strokeWidth</span> and <span className="highlight">scale</span> properties. What's important - <span className="highlight">then</span> doesn't need delta to describe new transition - it creates delta automatically from whatever property value was before to the new one.
          </p>

          <p>
            If you want explicitly specify <span className="highlight">easing</span> for next property state - you can use object instead of primitive value, where <span className="highlight">to</span> key describes the next state ( see <span className="highlight">scale</span> property in <span className="highlight">then</span> call above).
          </p>

          <p>
            Yet you can set entire new <span className="highlight">delta</span> for <span className="highlight">then</span> call (see <span className="highlight">strokeWidth</span> and <span className="highlight">stroke</span> property in <span className="highlight">then</span> call below):
          </p>

          <CodeSample pen="497d6e5cba9c55e573de43eac5644192">
            {
              { js: `const shape = new mojs.Shape({
  shape:          'rect',
  fill:           'none',
  stroke:         'cyan',
  radius:         10,
  strokeWidth:    20,
  angle:          { [-180] : 0 },
  
  duration:       600
}).then({
  strokeWidth:    { 50 : 0 },
  stroke:         { 'magenta' : 'yellow'  }
});`
              }
            }
          </CodeSample>

          <p>
            As you can witness, setting <span className="highlight">delta</span> in <span className="highlight">then</span> call tells <span className="highlight">mojs</span> to ignore everything whatever was before and proceed with completely new delta transition.
          </p>

          <p>
            The last thing to note is that if property is not set in the new <span className="highlight">then</span> call, it inherits from the previous block just as you would expect. This works for all properties excluding tween ones, but not the <span className="highlight">duration</span>. So the <span className="highlight">duration</span> property is the only tween property that gets inherited from previous then call:
          </p>

          <CodeSample pen="98772bc3e5e67ed9dba66b7280dfff6a">
            {
              { js: `const shape = new mojs.Shape({
  shape:          'rect',
  fill:           'none',
  stroke:         'cyan',
  radius:         10,
  strokeWidth:    20,
  angle:          { [-180] : 0 },
  top: '50%', y: -20,
  
  duration:       600,
  delay:          200
}).then({
  
  // duration here will be 600 too because inherited from previous block
  // delay here will have default 0 value
  
  angle:          -360,
  scale:          2,
  strokeWidth:    0,
  stroke:         { 'magenta' : 'yellow'  }
});`
              }
            }
          </CodeSample>

          <p>
            So in the code sample above, the duration inside <span className="highlight">then</span> call has the same value of 600ms inherited inherited from the previous state block, but <span className="highlight">delay</span> has the default value of <span className="highlight">0</span>. All other properties that are not set in the new <span className="highlight">then</span> call inherit the previos values ( for instance <span className="highlight">radius</span> or <span className="highlight">fill</span> ).
          </p>


          <h2>Tweenable interface</h2>

          <p>
            <span className="highlight">Shape</span> obeys <span className="highlight">tweenable</span> interface thus it has the same <span className="highlight">tween properties</span>, <span className="highlight">callbacks</span> and <span className="highlight">public methods</span> as any <UniteLink link="https://github.com/legomushroom/mojs/api/tweens/tween.md">tween</UniteLink> has:
          </p>

          <CodeSample pen="911ca9f311423e52a80f4509574925bc">
            {
              { js: `const shape = new mojs.Shape({
  // shape properties which we have already used
  shape:          'rect',
  stroke:         'cyan',
  angle:          { [-360] : 0 },
  
  // tween properties
  duration:       600,
  delay:          200,
  repeat:         0,
  speed:          1,
  yoyo:           false,
  easing:         'sin.out',
  backwardEasing: 'sin.in',
  yoyo:           true,

  // callbacks
  onStart (isForward, isYoyo) {
    //...
  },
  onRepeatStart (isForward, isYoyo) {
    //...
  },
  onUpdate (ep, p, isForward, isYoyo) {
    //...
  },
  onRepeatComplete (isForward, isYoyo) {
    //...
  },
  onComplete (isForward, isYoyo) {
    //...
  },
  onProgress (p, isForward, isYoyo) {
    //...
  },
  onPlaybackStart () {},
  onPlaybackPause () {},
  onPlaybackStop () {},
  onPlaybackComplete () {},
})
// tween public methods
.play()
.playBackward()
.pause()
.stop()
.replay()
.replayBackward()
.setProgress()
.setSpeed()
.reset()`
              }
            }
          </CodeSample>

          <p>
            Also implementing <span className="highlight">tweenable</span> interface means that any <span className="highlight">Shape</span> can be <span className="highlight">add</span>ed or <span className="highlight">append</span>ed to any <span className="highlight">timeline</span> exact the same way as any simple <span className="highlight">tween</span>:
          </p>

          <CodeSample pen="72e333584c53191806ec7ecb5bce1630">
            {
              { js: `const timeline = new mojs.Timeline;
timeline
   .add( rect, circle, triangle, polygon, triangle2, polygon2, circle2 );`
              }
            }
          </CodeSample>

          <p>
            Here above we have added shapes to timeline just like tween - right with the <span className="highlight">add</span> public method.
          </p>

          <h2> Tune </h2>

          <p>
            After you have created a shape, you can <span className="highlight">tune</span> any of it's properties before playing it. The <span className="highlight">tune</span> method is handy when you want to add some interactivity to your animation or to play the shape regarding user input - the method was exactly designed for this purpose(click somewhere to see):
          </p>

          <CodeSample pen="fcf6121653db713d8567271d3e8eea10">
            {
              { js: `document.addEventListener( 'click', function (e) {
  
   circle1
    .tune({ x: e.pageX, y: e.pageY  })
    .replay();
  
  circle2
    .tune({ x: e.pageX, y: e.pageY  })
    .replay();
  
});`
              }
            }
          </CodeSample>

          <p>
            Here above, we have tuned <span className="highlight">x</span> and <span className="highlight">y</span> properties of the circles before <span className="highlight">replay</span>ing it. Any property besides <span className="highlight">shape</span> one could be tuned at any moment of time.
          </p>

          <p>
            Note that <span className="highlight">tune</span> call transforms entire shape's property query that was set up with <span className="highlight">then</span> calls. It works that way to keep the chain up to date starting from the new tuned value. Thus you tune not only the first shape state but the subsequent ones. For instance if you had chain of fill <span className="highlight"> yellow -> cyan</span> then <span className="highlight">magenta</span>, and tune it to <span className="highlight">deepink</span>, you will eventually have <span className="highlight">deeppink</span> -> <span className="highlight">deepink -> magenta</span> chain. But if you will tune to delta value like <span className="highlight">deeppink -> yellow</span>, you will have the <span className="highlight">deeppink -> yellow -> cyan</span> chain as the result (click somewhere to see):
          </p>

          <CodeSample pen="0d745dac6d142cd4f6dc5b423a8273b4">
            {
              { js: `const circle = new mojs.Shape({
  fill: { 'magenta': 'yellow' },
}).then({
  fill: 'cyan'
});

document.addEventListener( 'click', function (e) {
  
  // no tune
  circle1
    .replay();

  // static value tune, results in 'deeppink' for the first block, 'deeppink' -> 'cyan' for the second one
  circle2
    .tune({ fill: 'deeppink' })
    .replay();
  
  // delta tune, results in 'yellow' -> 'deeppink' for the first block, 'deeppink' : 'cyan' for the second one
  circle3
    .tune({ fill: { 'yellow' : 'deeppink' } })
    .replay();
});`
              }
            }
          </CodeSample>

          <em>
            1st wasn't tuned at all, 2nd ball was tuned to static value, 3rd ball was tuned to new delta value
          </em>

          <p>
            There is the same exact example but for <span className="highlight">y</span> property as it should be a drip easeir to visualize:
          </p>

          <CodeSample pen="e991f4bb942c8aa698fbe4a3dba0ad4b">
            {
              { js: `const circle = new mojs.Shape({
  y: { [-25]: 25 },
}).then({
  y: 50
});

document.addEventListener( 'click', function (e) {
  
  // no tune
  circle1
    .replay();

  // static value tune, results in 'deeppink' for the first block, 'deeppink' -> 'cyan' for the second one
  circle2
    .tune({ y: -100 })
    .replay();
  
  // delta tune, results in 'yellow' -> 'deeppink' for the first block, 'deeppink' : 'cyan' for the second one
  circle3
    .tune({ y: { [-100] : 25 } })
    .replay();
});`
              }
            }
          </CodeSample>

          <em>
            1st wasn't tuned at all, 2nd ball was tuned to static value, 3rd ball was tuned to new delta value
          </em>

          <h2> Generate </h2>

          <p>
            Generate method is very similar to <span className="highlight">tune</span> one but it doesn't recieve any options. The method was designed to regenerate randoms that the shape had on initialization:
          </p>

          <CodeSample pen="7d905a98fd120441f52df0b59421fc80">
            {
              { js: `document.addEventListener( 'click', function (e) {
  
    for ( let i = 0; i < smallCircles.length; i++ ) {
      smallCircles[i]
        .generate()
        .replay(); 
    }
  
});`
              }
            }
          </CodeSample>

          <p>
            Here above, shapes had randoms in <span className="highlight">delay</span>, <span className="highlight">x</span>, <span className="highlight">y</span> and <span className="highlight">radius</span> properties. Then we've add the mouse click handler, and <span className="highlight">generate</span> the shapes inside, as the result we have unique effect pattern every time the click event fires.
          </p>

          <h2>Custom Shapes</h2>

          <p>
            You probably have noticed that <span className="highlight">mojs</span> supports a bunch of built in shapes. Namely they are <span className="highlight">circle</span>, <span className="highlight">rect</span>, <span className="highlight">polygon</span>, <span className="highlight">line</span>, <span className="highlight">cross</span>, <span className="highlight">equal</span>, <span className="highlight">curve</span> and <span className="highlight">zigzag</span>. You can extend this set of shapes by providing <span className="highlight">mojs</span> with a custom one that suits your needs. For that:
          </p>

          <ul>
            <li>
              Draw your shape inscribed in a rectangle of <span className="highlight">100x100</span> in any vector editor and save the shape as <span className="highlight">svg</span>.
            </li>
            <li>
              Extend <span className="highlight">mojs.CustomShape</span> class and override <span className="highlight">getShape</span> method to return the shape tags excluding <span className="highlight">svg</span> tag itself:
            </li>
          </ul>

          <CodeSample>
            {
              { js: `class Bubble extends mojs.CustomShape {
  getShape () { return '<path d="M83.0657721,87.5048737 C74.252469,95.2810178 62.6770192,99.9991713 49.9995857,99.9991713 C22.385577,99.9991713 0,77.6135943 0,49.9995857 C0,22.385577 22.385577,0 49.9995857,0 C77.6135943,0 99.9991713,22.385577 99.9991713,49.9995857 C99.9991713,50.0248803 99.9991526,50.0501705 99.999115,50.0754564 L100,94.5453117 C100,99.9979302 96.8685022,101.290527 93.0045119,97.4313174 L83.0657721,87.5048737 Z"></path>'; }
  getLength () { return 200; } // optional
}`
              }
            }
          </CodeSample>

          <ul>
            <li>
              Now you can register this shape in <span className="highlight">mojs</span> with a <span className="highlight">custom name</span> that will be used further in <span className="highlight">shape</span> property of <span className="highlight">mojs.Shape</span> constructor as you did it before:
            </li>
          </ul>

          <CodeSample>
            {
              { js: `
mojs.addShape( 'bubble', Bubble ); // passing name and Bubble class
// now it is avaliable on mojs.Shape constructor as usual
new mojs.Shape({ shape: 'bubble' });`
              }
            }
          </CodeSample>

          <p>
            All together in one block:
          </p>

          <CodeSample pen="bc80126bb5cef3054ee1d4e02882de97">
            {
              { js: `/* ADD CUSTOM SHAPE SOMEWHERE IN YOUR CODE */
class Heart extends mojs.CustomShape {
  getShape () { return '<path d="M92.5939814,7.35914503 C82.6692916,-2.45304834 66.6322927,-2.45304834 56.7076029,7.35914503 L52.3452392,11.6965095 C51.0327802,12.9714696 48.9328458,12.9839693 47.6203869,11.6715103 L47.6203869,11.6715103 L43.2705228,7.35914503 C33.3833318,-2.45304834 17.3213337,-2.45304834 7.43414268,7.35914503 C-2.47804756,17.1963376 -2.47804756,33.12084 7.43414268,42.9205337 L29.7959439,65.11984 C29.7959439,65.1323396 29.8084435,65.1323396 29.8084435,65.1448392 L43.2580232,78.4819224 C46.9704072,82.1818068 52.9952189,82.1818068 56.7076029,78.4819224 L70.1696822,65.1448392 C70.1696822,65.1448392 70.1696822,65.1323396 70.1821818,65.1323396 L92.5939814,42.9205337 C102.468673,33.12084 102.468673,17.1963376 92.5939814,7.35914503 L92.5939814,7.35914503 Z"></path>'; }
  getLength () { return 200; } // optional
}
mojs.addSHape( 'heart', Heart ); // passing name and Bubble class

/* USE CUSTOM SHAPE */
// now it is avaliable on mojs.Shape constructor as usual
const heart = new mojs.Shape({
  shape:    'heart',
  fill:     'none',
  stroke:   'white',
  scale:    { 0 : 1 },
  strokeWidth: { 50 : 0 },
  y:         -20,
  duration:  1000,
});`
              }
            }
          </CodeSample>

          <p>
            Worth noting that you should remove all presentation attributes from svg tags to give <span className="highlight">mojs</span> the ability to style them, otherwise the values will be static:
          </p>

          <CodeSample pen="d2be0ef912c7e21e0e990536ed6d39fa">
            {
              { js: `/* ADD CUSTOM SHAPE */
class Heart extends mojs.CustomShape {
  getShape () { return '<path d="M79.8226133,31.1716767 C71.2668462,22.7128894 57.4418472,22.7128894 48.8860801,31.1716767 L45.1254217,34.910784 C43.9939916,36.0098876 42.1837033,36.0206631 41.0522732,34.889233 L41.0522732,34.889233 L37.3023903,31.1716767 C28.7789498,22.7128894 14.9323997,22.7128894 6.40895921,31.1716767 C-2.13603238,39.6520152 -2.13603238,53.3800345 6.40895921,61.8280463 L25.686374,80.9653793 C25.686374,80.9761548 25.6971496,80.9761548 25.6971496,80.9869304 L37.2916148,92.4844159 C40.4919458,95.6739714 45.6857491,95.6739714 48.8860801,92.4844159 L60.4913209,80.9869304 C60.4913209,80.9869304 60.4913209,80.9761548 60.5020964,80.9761548 L79.8226133,61.8280463 C88.3352783,53.3800345 88.3352783,39.6520152 79.8226133,31.1716767 L79.8226133,31.1716767 Z"></path><path d="M87.2293862,20.3305554 C81.6681375,14.8323436 72.6818882,14.8323436 67.1206395,20.3305554 L64.6762116,22.7609751 C63.940782,23.4753925 62.7640947,23.4823966 62.0286651,22.746967 L62.0286651,22.746967 L59.5912412,20.3305554 C54.0510049,14.8323436 45.0507473,14.8323436 39.510511,20.3305554 C33.9562665,25.8427754 33.9562665,34.7659879 39.510511,40.2571956 L52.0408306,52.6964621 C52.0408306,52.7034662 52.0478347,52.7034662 52.0478347,52.7104703 L59.5842371,60.1838358 C61.6644523,62.2570469 65.0404244,62.2570469 67.1206395,60.1838358 L74.6640461,52.7104703 C74.6640461,52.7104703 74.6640461,52.7034662 74.6710502,52.7034662 L87.2293862,40.2571956 C92.7626184,34.7659879 92.7626184,25.8427754 87.2293862,20.3305554 L87.2293862,20.3305554 Z" stroke="#50E3C2"></path><path d="M97.1269756,7.85484074 C93.2768804,4.04838642 87.0556308,4.04838642 83.2055356,7.85484074 L81.5132393,9.53743902 C81.0040958,10.0320356 80.1894661,10.0368846 79.6803225,9.52774105 L79.6803225,9.52774105 L77.9928752,7.85484074 C74.157327,4.04838642 67.9263795,4.04838642 64.0908312,7.85484074 C60.245585,11.670993 60.245585,17.8486017 64.0908312,21.6502071 L72.7656679,30.2620069 C72.7656679,30.2668559 72.7705169,30.2668559 72.7705169,30.2717049 L77.9880262,35.4455734 C79.4281752,36.8808733 81.7653866,36.8808733 83.2055356,35.4455734 L88.427894,30.2717049 C88.427894,30.2717049 88.427894,30.2668559 88.4327429,30.2668559 L97.1269756,21.6502071 C100.957675,17.8486017 100.957675,11.670993 97.1269756,7.85484074 L97.1269756,7.85484074 Z"></path>'; }
  getLength () { return 200; } // optional
}
mojs.addShape( 'heart', Heart ); // passing name and Bubble class

/* USE CUSTOM SHAPE */
// now it is avaliable on mojs.Shape constructor as usual
const heart = new mojs.Shape({
  shape:    'heart',
  fill:     'none',
  stroke:   { 'white' : 'deeppink' },
  scale:    { 0 : 1 },
  strokeWidth: { 50 : 0 },
  y:         -20,
  duration:  1000,
});
`
              }
            }
          </CodeSample>

          <p>
            Here above, the middle heart has static <span className="highlight">stroke</span> property on it's tag, so it was left unattended.
          </p>

          <p>
            Regarding the second <span className="highlight">getLength</span> lifecycle method, - it is handy only if you want to use relative percent values for <span className="highlight">strokeDasharray</span>/<span className="highlight">strokeDashoffset</span> properties. Since <span className="highlight">mojs</span> knows very little about the custom shape you have had provided, it is on you to specify what is the perimeter length of the custom shape. In the example below, we return the precise <span className="highlight">292.110107421875</span> length of the heart from the <span className="highlight">getLength</span> method, this allows us to use percent values in <span className="highlight">strokeDash*</span> properties.
          </p>

          <CodeSample pen="75894cd43b0f12ecdb425cad5149ab37">
            {
              { js: `/* ADD CUSTOM SHAPE */
class Heart extends mojs.CustomShape {
  getShape () { return '<path d="M92.5939814,7.35914503 C82.6692916,-2.45304834 66.6322927,-2.45304834 56.7076029,7.35914503 L52.3452392,11.6965095 C51.0327802,12.9714696 48.9328458,12.9839693 47.6203869,11.6715103 L47.6203869,11.6715103 L43.2705228,7.35914503 C33.3833318,-2.45304834 17.3213337,-2.45304834 7.43414268,7.35914503 C-2.47804756,17.1963376 -2.47804756,33.12084 7.43414268,42.9205337 L29.7959439,65.11984 C29.7959439,65.1323396 29.8084435,65.1323396 29.8084435,65.1448392 L43.2580232,78.4819224 C46.9704072,82.1818068 52.9952189,82.1818068 56.7076029,78.4819224 L70.1696822,65.1448392 C70.1696822,65.1448392 70.1696822,65.1323396 70.1821818,65.1323396 L92.5939814,42.9205337 C102.468673,33.12084 102.468673,17.1963376 92.5939814,7.35914503 L92.5939814,7.35914503 Z"></path>'; }
  getLength () { return 292.110107421875; } // optional
}
mojs.addShape( 'heart', Heart ); // passing name and Bubble class

/* USE CUSTOM SHAPE */
// now it is avaliable on mojs.Shape constructor as usual
const heart = new mojs.Shape({
  shape:            'heart',
  fill:             'none',
  stroke:           'white',
  strokeDasharray:  '100%',
  strokeDashoffset: { '-100%' : '100%' },
  y:               -20,
  duration:         1000,
});`
              }
            }
          </CodeSample>

          <p>
            Here above, we have used percent values for <span className="highlight">strokeDashoffset</span> property so we had to provide the custom shape with <span className="highlight">getLength</span> method for precise stroke dash length calculations.
          </p>

          <h2>ShapeSwirl</h2>

          <p>
            <span className="highlight">ShapeSwirl</span> module basically is <span className="highlight">Shape</span> with a little bit more functionality bolted on. ShapeSwirl automatically calculates sinusoidal x/y path for shape making it easy to send the shapes over sine trajectories. To give you control over this behaviour, ShapeSwirl accepts more <span className="highlight">6</span> properties, thus you can define frequency or size of the path and other supporting parameters (click somewhere to see):
          </p>

          <CodeSample pen="c6888ce5c9f81ad825444d969779eadc">
            {
              { js: `const shapeSwirl = new mojs.ShapeSwirl({
  shape:          'circle',
  isSwirl:        true, // sets if the shape should follow sinusoidal path, true by default
  swirlSize:      10, // defines amplitude of the sine
  swirlFrequency: 3, // defines frequency of the sine
  pathScale:      'rand( .1, 1 )', // defines how much the total path length should be scaled
  direction:      1, // direction of the sine could be 1 or -1
  degreeShift:    45, // angle shift for the sinusoidal path
  x:              { 0 : 90 }
});`
              }
            }
          </CodeSample>

          <p>
            The <span className="highlight">isSwirl</span> property (<span className="highlight">true</span> by default) defines if shape should follow sine path, if set to <span className="highlight">false</span> it will act axactly the same as simple <span className="highlight">Shape</span>.
          </p>

          <p>
            The <span className="highlight">swirlSize</span> property (<span className="highlight">10</span> by default) defines the deviation or amplitude of the sine. There is example with <span className="highlight">swirlSize: 10</span>:
          </p>

          <CodeSample pen="0b3e2fe009d06a67a08e8ae04a7f7904">
            {
              { js: `const swirl = new mojs.ShapeSwirl({
  fill:           'cyan',
  y:              { 0: -150 },
  radius:         8,
  swirlSize:      35,
  swirlFrequency: 4, 
  duration:       1000,
});`
              }
            }
          </CodeSample>

          <p>
            The <span className="highlight">direction</span> property (<span className="highlight">1</span> by default) defines direction of the amplitude of the sine - it have value of either <span className="highlight">1</span> or <span className="highlight">1</span>. There is the example for <span className="highlight">-1</span> note how it strats to the left instead of right:
          </p>

          <CodeSample pen="f1fb2e4dc7bb9b11e3b6b96299fa99f9">
            {
              { js: `const swirl = new mojs.ShapeSwirl({
  fill:           'cyan',
  y:              { 0: -150 },
  radius:         8,
  pathScale:      .5,
  duration:       1000,
});`
              }
            }
          </CodeSample>

          <p>
            The <span className="highlight">swirlFrequency</span> property (<span className="highlight">3</span> by default) defines the frequency of the sine, there is the example with <span className="highlight">swirlFrequency: 10</span>:
          </p>

          <CodeSample pen="d63af6450cb170fafc8636f185634830">
            {
              { js: `const swirl = new mojs.ShapeSwirl({
  fill:           'cyan',
  y:              { 0: -150 },
  radius:         8,
  swirlFrequency: 10, 
  duration:       1000,
});`
              }
            }
          </CodeSample>

          <p>
            The <span className="highlight">pathScale</span> property (<span className="highlight">1</span> by default) defines the scale size of the sine path, there is the exaple for <span className="highlight">pathScale: .5</span> - eventual sine has exact half of the radius:
          </p>

          <CodeSample pen="b4c26893f3814227480d7cc5ab5ceded">
            {
              { js: `const swirl = new mojs.ShapeSwirl({
  fill:           'cyan',
  y:              { 0: -150 },
  radius:         8,
  pathScale:      .5,
  duration:       1000,
});`
              }
            }
          </CodeSample>

          <p>
            The <span className="highlight">pathScale</span> property usefull when you have a bunch of <span className="highlight">ShapeSwirls</span> and want to randomize their sines.
          </p>

          <p>
            The <span className="highlight">degreeShift</span> property (<span className="highlight">0</span> by default) defines angle of the swirl. This property gets to be interesting <span className="highlight">shapeSwirl</span> is used inside other modules (like <span className="highlight">Burst</span>). For now it will act just like angle of the sine path, there is the example for <span className="highlight">degreeShift: 90</span>:
          </p>

          <CodeSample pen="6bc8f77ec8528e0c8c394660db150a9e">
            {
              { js: `const swirl = new mojs.ShapeSwirl({
  fill:           'cyan',
  y:              { 0: -150 },
  radius:         8,
  pathScale:      .5,
  duration:       1000,
});`
              }
            }
          </CodeSample>

          <p>
            How ShapeSwirl can be handy will be clear soon, in short the main idea behind swirls is to give you the ability to compose dust/smoke/bubbles effects or basically any effect that needs to move over sine path (click somewhere to see):
          </p>

          <Pen pen="90e2506d73313d14d49486f7d71fb9d0" height="500"></Pen>

          <p>
            In any other aspect the <span className="highlight">ShapeSwirl</span> is the same as a simple <span className="highlight">Shape</span>.
          </p>


          <h2>Recap</h2>

          <p>
            That was very fast intro to the <span className="highlight">Shape</span> module. You can use <UniteLink link="https://github.com/legomushroom/mojs/api/shape.md">Shape APIs</UniteLink> and <UniteLink link="https://github.com/legomushroom/mojs/api/shape-swirl.md">ShapeSwirl API</UniteLink> sections as reference further on. What is important at this point — is that you should understand the ability to create a <span className="highlight">Shape</span> in any part of the screen or HTMLElement. If you want to animate some property — you add a <span className="highlight">delta</span> object that describes the transition of that property. You can chain the shape transitions with <span className="highlight">then</span> calls and <span className="highlight">tune</span> new properties when you want. Tweenable interface allows you to work with <span className="highlight">Shape</span> same as you work with any other <span className="highlight">Tween</span>. Now you probably asking yourself - Why do we need something as simple as an animatable shape? In the next section I will cover few use cases for shapes but most imporantly it will become cristal clear why do we need shapes in the next <UniteLink link="/tutorials/burst/">Burst Tutorial</UniteLink>. Probably, you can treat this tutorial as finished at this point, the further sections are rather optional annd were written just for fun. So you can skip reading them in favor of <UniteLink link="/tutorials/burst/">Burst Tutorial</UniteLink> but I highly engorage you to read them to gain solid understanding of the shapes.
          </p>

          <h2>Use Cases</h2>

          <p>
            Despite the fact that <span className="highlight">Shape</span> and <span className="highlight">ShapeSwirl</span> modules are nothing than tiny bits that compose higher order modules creating some matured effects, they have strong use cases and can be used by their own. There is no thing in the whole world such expressive and appealing as simple geometric shapes so they are ubiquitous in the motion graphics nowadays. You can use shapes in your animations to add special effects and details making your animation more expressive. Also <span className="highlight">Shape</span>s often used to implode them into <span className="highlight">UI</span> thus enhancing it. From the development point of view — <span className="highlight">Shape</span> can be created with just one declarative call allowing you to focus entirely on you motion sequences and don't spend time to bootstrapping things, this fact powers you with a <span className="highlight">"shape framework"</span> to think in, so your motion sequences get more organized and consistent.
          </p>

          <p>
            I hope you don't believe me that <span className="highlight">Shape</span>s are usefull just because I claimed it out of loud, so let me convince you with the next real wold use cases. Note that the code samples are omitted in this section but feel free to check the <span className="highlight">Babel</span> tab of the codepen samples and tweak the part that interests you.
          </p>

          <h3>Motion Graphics Use Cases</h3>

          <p>
            Motion graphics indeed one of the strongest use cases for <span className="highlight">Shape</span>s. If you will ponder a bit, nothing breathes life into static content better than the use of motion graphics. With shapes, the limits are simply the imagination of the designer or the artist, - you can create complex mograph sequnces based entirely on geometric or custom shapes or use them aside as reinforcement support.
          </p>

          <h4>Bubbles</h4>

          <p>
            Lets start with the simple intro sequence, it was composed with custom "speech bubble" shapes and few built in ones.
          </p>

          <Pen pen="2ef10ed42ff535182c31cd1dbb81e453" height="500"></Pen>

          <p>
            Custom shapes allow you to use shapes that suite your current needs. To be clear that's not just images that you can animate inside some wrapper, they are highly stylable shapes thus a way flexible than just an image or HTMLElement with some background.
          </p>

          <h4>Geometric Scenes</h4>

          <p>
            Let's walk thru some short random geometric scenes just to get some intuition about shape usage with mograph. After that we will combine them to get slightly longer intro sequence.
          </p>

          <p>
            We will start with triangles scene, a drip mistical one, at the same time simple and appealing. Just 6 triangles and few then statements:
          </p>

          <Pen pen="4db9ec6079a3537d8c60ec888dd8e532"></Pen>

          <p>
            We will compose the next scene by using another 6 triangles, slightly more elegant, with a little contrast to the first one, but still quite simple:
          </p>

          <Pen pen="c0b7b94e90142f19acba6ed9a4b05a2f"></Pen>

          <p>
            Let's do the next one with contrast to the first two, - simple rectangle with some sparks, this one rather funky:
          </p>

          <Pen pen="c33a3582fc02842b99fa6eb01be6b3ba" height="700"></Pen>

          <p>
            Note that the best suite for white <span className="highlight">sparks</span> effect on the sides of the square is the <span className="highlight">Burst</span> module which we will discuss shortly in the next tutorial, meanwhile in this particular demo, it was made with custom shapes to give you yet another clue how you would use the custom shapes.
          </p>

          <p>
            After that we need a nice transition between screens, just few circles will do the trick:
          </p>

          <Pen pen="95a862f1ad8445134466ad7d64213d46" height="700"></Pen>

          <p>
            The last scene for this seqence would be <span className="highlight">mojs</span> logo reveal - use case for shapes in tandem with <span className="highlight">property curves</span>:
          </p>

          <Pen pen="b37bb9c6dede99d0ac75d60b5fb0d43d" height="700"></Pen>

          <p>
            Now, lets finally compose these short scenes into one:
          </p>

          <Pen pen="39427561a8a0b15d7896480a7d96d3d1" height="700"></Pen>

          <em>
            You can find the entire source code in <UniteLink link="https://github.com/legomushroom/shape-demo1">this repo</UniteLink> since the bundeled codepen code could be unreadable.
          </em>

          <h4>Word reveal</h4>

          <p>
            There is another demo that can set some light on the shape usage in motion graphics, it was made with bunch of shapes and few characters that compose a <span className="highlight">love</span> word together:
          </p>

          <Pen pen="c94452fb65dbf676b0ae8a12d4267473" height="700"></Pen>

          <p>
            That's was the last demo for the mograph use cases, I hope you getting more convinced that shapes could be useful sometimes. Let's move on.
          </p>
          
          <p>
            There are also few gifs for your inspiration. All of them pretty much easy with <span className="highlight">mojs</span> shapes:
            <More label="click here to see the gifs" className=" is-border-bottom">

              <br/>

              <Gif src="/gifs/shape-mograph/blend_square.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/random.gif" />

              <br/>


              <Gif src="/gifs/shape-mograph/omam-logo-imprint.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/number_1_jrcanest.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/lookinside.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/lukas_pink_loading.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-1.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-2.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-3.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-4.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-5.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-6.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-7.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-8.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-11.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-12.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-10.gif" />

              <br/>

              <Gif src="/gifs/shape-mograph/shapes-9.gif" />

              <br/>

            </More>
          </p>

          <h2>
            Animation Use Cases
          </h2>

          <p>
            Animation is another field for Shapes application. You can compose some visual effects to support your main sequence, crafting more details and depth.
          </p>

          <p>
            I've made a little animation demo as a starting point to which we will apply some effects - 4 physicly balls in harsh living situation:
          </p>

          <Pen pen="3fe5eabaf7cfb83142bbd1be3f2f2850" height="500" />

          <em>
            You can find the entire source code in <UniteLink link="https://github.com/legomushroom/shape-demo2">this repo</UniteLink> since the bundeled codepen code could be unreadable.
          </em>

          <p>
            The demo itself is a good illustration on how you can use shapes as "main actors" in your scenes becuase it was made entirely with shapes. But there is few cases that should be discussed besides that.
          </p>

          <p>
            For instance, you can add the effect of collision between balls with ease:
          </p>

          <Pen pen="7315f4364360ec87a6655d33782702fe" height="500" />

          <p>
            As you would expect, the effect itself was composed with bunch of shapes and swirls:
          </p>

          <Pen pen="c29f0b2ce24147e4886691b61b31b3fb" height="500"></Pen>

          <p>
            The next effect, you can add to the scene is the "motion trails" effect:
          </p>

          <Pen pen="92f9a7b05498b8a0be3734737a9cfc70" height="500"></Pen>

          <p>
            Motion trail effect is ususally used to exaggerate velocity of the object that moves and the enviroment it moves in. Just a nice subtle detail. The effect was composed with 2 shapes, namely curves. There is another simple example with lines instead of curves:
          </p>

          <Pen pen="fff0bcc079e0448bd0a72ee311ebadfa" height="500"></Pen>

          <p>
            The another effect that can fit this scene is the "dust trail" effect:
          </p>

          <Pen pen="6f7b05a45679964ccdf9212fa68075c8" height="500"></Pen>

          <p>
            It was composed with bunch of swirls, lets spend some time and see how exactly you can build something like that. First you want to make the swirls move downward, - somewhere into the ground:
          </p>

          <Pen pen="80d765ff22ae515cb28a78c0ec5686c9" height="500"></Pen>

          <p>
            Then put these swirls inside <span className="highlight">overflow: hidden</span> container to constrain the visible area:
          </p>

          <Pen pen="eb05789c56571993be7fb966b8b9207f" height="500"></Pen>

          <p>
            As the last touch, you need to add 2 swirls that will fade upward at the end:
          </p>

          <Pen pen="73dcc20f9e36c64e8d3b55d0188f016a" height="500"></Pen>

          <p>
            To recap, there is the same exact effect with simple object:
          </p>

          <Pen pen="633e6aa52d40691cca2f2cda91650bae" height="500"></Pen>

          <em>
            Note: Again, this dust effect could be done with just one declarative call with <span className="highlight">Burst</span> or <span className="highlight">Stagger</span> modules that we will discuss shortly, but for now let's keep it <span className="highlight">Swirl</span>.
          </em>

          <p>
            That's would be basically it for animation use cases. My effort in this section was focused to convey the idea of how you can use the shapes to enhance and support your main animation scenes, applying little effects and details.
          </p>

          <p>
            Just few gifs for your inspiration:
            <More label="click here to see the gifs" className=" is-border-bottom">

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/bens.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/galshir-candles.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/space-dog.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/galshir-coffee-machine.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/galshir.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/galshir-sharpener.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/galshir-toaster.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-9.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-11.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsse-20.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-2.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-6.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-8.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-10.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-111.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-12.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-16.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-21.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-24.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-25.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-28.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-31.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-32.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-36.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-38.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-39.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/rain_dribbble.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/sloth.gif" />

              <br/>

              <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-23.gif" />
              
              <br/>

            </More>
          </p>

          <h2>UI Use Cases</h2>

          <p>
            UI is another common use case for shapes. You can enhance UI transitions with shapes, add effects or even implode shapes to use them as part of UIs.
          </p>

          <p>
            Usually motion in UI helps the user to catch a clue about position, purpose and intention of the UI element.
          </p>

          <h3>Bubble Close Button</h3>

          <p>
            The next demo illustrates how the shapes can be used to appeal users' attention, providing them with feedback about availability of the control element in a playful way. There is a demo with two shapes that act like in place of UI element:
          </p>

          <Pen pen="3e7e766d0d5eaa3fa953c56c394bc1b5" height="500"></Pen>

          <p>
            Then you can add even more effects to the button to fit the mood of your current UIs, for instance "bubble UI" in this case:
          </p>

          <Pen pen="97d57587438de4d1e8592304a961be84" height="500"></Pen>

          <p>
            If user will click the close button, we need to remove it, for that we can add a "bubbles" effect to keep the "bubbles" pace:
          </p>

          <Pen pen="181b4ba2ebb5a05d755647e9144a50d8" height="500"></Pen>

          <p>
            This is how it will look like if we will connect these two transitions (click the close button):
          </p>

          <Pen pen="3c49de2d7d0ca3e92bf5db5bf7a2687d" height="500"></Pen>

          <p>
            That's the exact same effect I've used in Bubble Layout demo a while ago, when was trying to convey the bubble interface (click on any circle to see the close button):
          </p>

          <Pen pen="yNOage" height="500"></Pen>

          <p>
            In this demo above you can notice two more effects that were made with shapes, - one is the subtle white ripple that spreads out when you click on any bubble, the second one is the white collision effect right under the project image box when it jumps over the screen:
          </p>

          <Pen pen="e5fe8c0a9a0a2b387cfa2858ea7e2046" height="500"></Pen>

          <h3>Microinteractions</h3>

          <p>
            Since the shapes are tuneable, you can add effects to you UI regarding user interactions (hover over the links to see):
          </p>

          <Pen pen="a46534d118a64d2450e6a0e8e93541fd" height="500"></Pen>

          <p>
            Another demo for microiteractions is the pointer ripple, the effect that spreads out after user clicks any touchable surface. The <span className="highlight">mojs-player</span> itself has a lot of those so I will put an empty player as demo (click on player controls to see):
          </p>

          <Pen pen="249b42683dfa4b7a11f641e842270427" height="200"></Pen>

          <p>
            That's basically exact the same principle we have used in this tune demo:
          </p>

          <Pen pen="fcf6121653db713d8567271d3e8eea10" height="200"></Pen>



          <h3>Love/Hate Modal</h3>

          <p>
            Ok. Let's do another demo with shapes regarding UI. This time we will have a plus button, it will show up from bottom left, after it will stop - we will mimic button push transition by adding concurrent rotation of the button. By that we will imitate "let's go/follow me" gesture, inviting user to follow up with a click:
          </p>

          <Pen pen="1f6cce8046f76ca43aca3a5ac681b97c" height="500"></Pen>

          <p>
            Then we can expand the button sequence even more to add some playfull splash effect:
          </p>

          <Pen pen="51350c86ef0e0fb722e034006fcafb8f" height="500"></Pen>

          <p>
            Then, if user doesn't click the button for a while, let's invite him to proceed by adding the callout vibration, to mime an incoming call:
          </p>

          <Pen pen="9935b7cec036eae2ddb762213ceae6d4" height="500"></Pen>

          <p>
            When user eventually will click the button, we will show the quiz modal with the most valiable question we have ever had. That's how the modal will look like:
          </p>

          <Pen pen="2c95e0397b0d20eb4fbc952e3c5f0fe0" height="500"></Pen>

          <p>
            Every piece of this sequence is composed with shapes - ripple inside a modal, few details in the top and bottom right corners, backround spread effect, modal shape itself and it's corner are shapes too.
          </p>

          <p>
            Now when the user hovers over any button, we need to show some tension, conveying that something is going to happen if he will proceed with a click (hover over buttons to see):
          </p>

          <Pen pen="ad612440c8b08d0b506e0a8cb4152b9c" height="500"></Pen>

          <p>
            The extend parts of infalting modal are nothing than plain shapes, in fact <span className="highlight">curve</span>s, that just get scaled when user hovers over the buttons. I've set the modal shape to disappear to reveal the extending parts so it will be clear for you what I mean (hover over buttons):
          </p>

          <Pen pen="4b54df04faa5b6c885a7b0222c842b5d" height="500"></Pen>

          <p>
            As you can see now - the extending parts are just <span className="highlight">curves</span> on each side of the modal. Each of them gets larger when user hovers over the buttons.
          </p>

          <p>
            Next, if user leaves the button with his pointer, we need to show the tension relief by mimicing the air currents that float out of the modal, just few swirls would do here (hover over buttons and then release to see):
          </p>

          <Pen pen="fcc29bcf5d0eebf37d558864b7a2e334" height="500"></Pen>

          <p>
            In the other case, when user finally proceeds with the button click, we will blow up the modal as a consequqnce of modal's tension and show the chosen word. That's the entire sequence:
          </p>

          <Pen pen="812699ce32c9a7aeb70c9384b32a533a" height="600"></Pen>
          <em>
            You can find the entire source code in <UniteLink link="https://github.com/legomushroom/shape-demo3">this repo</UniteLink> since the bundeled codepen code could be unreadable.
          </em>

          <p>There are few gifs for your inspiration over the UI's and shapes:</p>

          <More label="click here to see the gifs" className=" is-border-bottom">

            <br/>

            <Gif src="/gifs/shape-ui/upload.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/awsm.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/checkbox.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/download.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/circle-menu-github-open-source-ramotion.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/close.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/dailyui-049.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/download2.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/dribbble_hex-nav.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/dribbble-morph.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/ezgif.com-gif-maker__2_.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/ezgif.com-gif-maker__5_.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/fab-animation.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/finalshot.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/hp_dribbble_2.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/IMG_1171.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/inboxui.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-1.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-2.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-3.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-4.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-5.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-6.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-7.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/LingoAsset-8.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/pause-push-2.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/right_and_wrong.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/search_3.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/share.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/time-marine-hud.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/touch-me-mb.gif" className="gif--50-width" />
            
            <br/>

            <Gif src="/gifs/shape-ui/anim.gif" className="gif--50-width" />
            
            <br/>


          </More>

          <h2>Recap</h2>

          <p>
            Phew, that was intence. I hope you didn't get bored. We have touched only surface of possible use cases in this post but I hope it puts some light on why and when you can use shapes. It is probably is clear at this point that to create a shape you use a declarative call and the shape appears in any place you of the screen( or HTMLElement) you want without any bootsrapping. You  can use <span className="highlight">then</span> method to chain states of shape and <span className="highlight">tune</span> them afterwards or even re<span className="highlight">generate</span> all random properties on it before strating the animation. Remember that shapes obey the <span className="highlight">tweenable</span> interface thus it has tween properties, callbacks and public methods that any <span className="highlight">tween</span> has.
          </p>

          <p>
            Need to admit that this post was written as an introduction to more complex and mature module that is called <span className="highlight">Burst</span>, it was important to familiarize you with the base concepts and API's syntax before we will proceed further. I think now you are ready to meet the <UniteLink link="/tutorials/burst/">Burst</UniteLink>!
          </p>

          <h2>Thank you!</h2>

          <p>
            I deeply appriciate you did it down here, I tried to make it not so boring for you. For any questions, catch me on twitter (<UniteLink link="https://twitter.com/legomushroom">@legomushroom</UniteLink>), ask a question on StackOverflow with <span className="highlight">#mojs</span> tag, rise an issue on <UniteLink link="https://github.com/legomushroom/mojs">github repo</UniteLink> or leave a comment in the section below. You can help the project on <UniteLink>Patreon</UniteLink> (project does need help) and/or on <UniteLink link="https://github.com/legomushroom/mojs/issues">github</UniteLink>. {'Love <3.'}
          </p>

          <p style = {{ textAlign: 'center', marginTop: '50px' }}>
            <br />
            Next: &nbsp;<UniteLink link="/tutorials/burst" className="highlight">Burst</UniteLink>
          </p>

          <SocialNetworksAbout className="post__social-networks-about" />
          <ORXLine className="post__last-orx-line" type="center" />
          <DisqusComments />

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