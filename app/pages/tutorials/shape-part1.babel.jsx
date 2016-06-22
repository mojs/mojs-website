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
            Nothing interesting yet. Just hotpink circle right in the center of the codepen. You can set presentation properties to the shape:
          </p>

          <CodeSample pen="d929be6cdb64bb0a2979f35669284197">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',
  radius:       25,        // shape radius
  fill:         'none',    // same as 'transparent'
  stroke:       '#F64040', // or 'cyan'
  strokeWidth:  5,         // width of the stroke
  isShowStart:  true,      // show before any animation starts
});
`
              }
            }
          </CodeSample>

          <p>
            Colors could be expressed in different forms - <UniteLink link="https://www.w3.org/TR/css3-color/">color keywords</UniteLink>, <span className="highlight">rgb</span>, <span className="highlight">rgba</span> or <span className="highlight">hex</span>.
          </p>

          <p>
            Every shape has <span className="highlight">radius</span> property that sets it's (no prizes for guessing) radius. Alos you can set <span className="highlight">radiusx</span>/<span className="highlight">radiusY</span> with appropriate properties. They fallback by default fallback to the value of the <span className="highlight">radius</span>.
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
            Needless to say that the <span className="highlight">radius</span> property is a property that determines size of any shape, not just <span className="highlight">circle</span> as in example above, so if you have a shape of <span className="highlight">rect</span> or <span className="highlight">polygon</span> they would have <span className="highlight">radius</span> properties too for the purpose:
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
            Every property could be unit based (like <span className="highlight">top</span>/<span className="highlight">left</span> below) or even can be expressed with <span className="highlight">rand</span> strings (like <span className="highlight">x</span> below):
          </p>

          <CodeSample pen="d7b4e84ddcd72664709f2394ce9f7968">
            {
              { js: `var shape = new mojs.Shape({
  shape:        'circle',
  isShowStart:  true,
  top: '50%',
  x:  'rand(-250, 250)'
});`
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
            We have set transition for <span className="highlight">scale</span> property of the shape from <span className="highlight">0</span> to <span className="highlight">1</span>. As you can see <span className="highlight">delta</span> in <span className="highlight">mojs</span> is plain javascript object that holds <span className="highlight">start</span> and <span className="highlight">end</span> state of the property, where <span className="highlight">key</span> of the object is the <span className="highlight">start</span> state and <span className="highlight">value</span> of the object is the <span className="highlight">end</span> state respectively. If you still confused, just change <span className="highlight">:</span> to <span className="highlight">-></span> in your mind and you will have <span className="highlight">{ '0 -> 1' }</span>. Start and end values in the <span className="highlight">delta(∆)</span> object can be <span className="highlight">unit</span> based or random <span className="highlight">rand</span> ones or whatever you have — just the same as the static values:
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
            Here, <span className="highlight">strokeDashoffset</span> property uses <span className="highlight">unit based</span> values in <span className="highlight">delta</span>, <span className="highlight">x</span> property uses random unit based values and <span className="highlight">fill</span> property uses <span className="highlight">color keywords</span>.
          </p>

          <p>
            The nice thing about declarative APIs is that you define <span className="highlight">what</span> you want to do by contrast with <span className="highlight">how</span> to do it, so it makes intention of the transition cristal clear with just one short glimpse. Consider this part of the code of the triangles demo above:
          </p>

          <CodeSample>
            {
              { js: `// TRIANGLE //
const OPTS = {
  shape:      'polygon',
  fill:       COLORS.cyan,
  radius:     65,
  angle:      { [-120]: -40 },
  x:          { [-200]: 20 },
  y:          { [50]: -20 },
  scaleX:     { 0 : 1.3 },
  duration:   800,
  isShowEnd:  false
};`
              }
            }
          </CodeSample>


          <p>
            If you will translate this code sample to proper English, you will have something like this —  we have a <span className="highlight">cyan</span> <span className="highlight">polygon</span> of <span className="highlight">65px radius</span> right in the middle of the screen, when animation starts — it rotates from <span className="highlight">-120</span> to <span className="highlight">-40</span> degrees, shifts <span className="highlight">-120</span> to the right starting from <span className="highlight">-200px</span> and <span className="highlight">scale</span>s from <span className="highlight">0</span> to <span className="highlight">1.3</span> concurrently during <span className="highlight">800ms</span> with default <span className="highlight">easing</span>. When animation ends, the shape <span className="highlight">x dissapears</span>.
          </p>

          <p>
            Almost every property besides <span className="highlight">tween</span> properties and <span className="highlight">boolean</span> values can be expressed in <span className="highlight">delta</span>, please refer to the <UniteLink link="">API's</UniteLink> on that matter. The <span className="highlight">∆</span> symbol in the comment right above properties defines that the property is <span className="highlight">"deltable"</span>.
          </p>

          <p>
            Delta can also have it's own <span className="highlight">easing</span> field, that can hold any <span className="highlight">mojs</span> <UniteLink link="">easing type</UniteLink>, this makes shape transitions more flexible to the real world needs.
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
            The 3rd property that is available on delta objects is <span className="highlight">curve</span> property that overrides <span className="highlight">easing</span> property if both present. The <span className="highlight">curve</span> property is the way to go if you want to declare a <span className="highlight">property curve</span> for a property, where <span className="highlight">delta</span> values is base curve value (more on this further in this post):
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
  
  delay:        500,
  duration:     800,
  repeat:       999,
}).play();`
              }
            }
          </CodeSample>

          <p>
            I don't want to spend much time with <span className="highlight">curve</span> property here because it is a <UniteLink link="http://mojs.io/tutorials/easing/path-easing/">huge</UniteLink> topic to discuss. We will have some examples related to this property further in this tutorial. For now just keep in mind the availability.
          </p>

          <p>
            So to recap, <span className="highlight">delta</span> syntax:
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

          <p>Then what?</p>

          <h2>Then Zen</h2>

          <p>
            You can chain shape states with <span className="highlight">then</span> calls:
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
            <i>Note</i>: In the demo above, I've added <span className="highlight">MojsPlayer</span> to control the demo sequnce instead of explicit <span className="highlight">.play</span> call. <span className="highlight">MojsPlayer</span> is part of <span className="highlight">mojs tools</span> that gives you GUI contols thus help you to craft your motion sequence. Since our animations are getting more complex, the player is getting to be irreplaceable tool for our needs.
          </em>

          <p>
            So here we have continued the sequence with the next state declaration for the <span className="highlight">strokeWidth</span> and <span className="highlight">scale</span> properties. As you probably have noticed - <span className="highlight">then</span> doesn't need delta to describe new transition - it creates delta automatically from whatever property value was before to the new one.
          <br />
            If you want explicitly specify <span className="highlight">easing</span> for the <span className="highlight">then</span> property call - you can use an object where <span className="highlight">to</span> key describes the next state ( see <span className="highlight">scale</span> property in <span className="highlight">then</span> call above).
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
            As you can witness, setting <span className="highlight">delta</span> in <span className="highlight">then</span> call tells <span className="highlight">mojs</span> to ignore whatever was before and proceed to entire new delta transition.
          </p>

          <p>
            <b>Important note:</b> <span className="highlight">duration</span> is the only property that gets inherited from previous then call:
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
  
  duration:       600
}).then({
  
  // duration here will be 600 too because inherited from previous block
  
  angle:          -360,
  scale:          2,
  strokeWidth:    0,
  stroke:         { 'magenta' : 'yellow'  }
});`
              }
            }
          </CodeSample>

          <h2>Tweenable interface</h2>

          <p>
            <span className="highlight">Shape</span> obeys <span className="highlight">tweenable</span> interface thus it has the same <span className="highlight">tween properties</span>, <span className="highlight">callbacks</span> and <span className="highlight">public methods</span> as any <UniteLink link="">tween</UniteLink> has:
          </p>

          <CodeSample pen="911ca9f311423e52a80f4509574925bc">
            {
              { js: `const shape = new mojs.Shape({
  shape:          'rect',
  fill:           'none',
  stroke:         'cyan',
  radius:         10,
  strokeWidth:    { 20 : 0 },
  angle:          { [-360] : 0 },
  
  // tween properties
  easing:         'cubic.out',
  backwardEasing: 'cubic.in',
  delay:          200,
  duration:       600,
  repeat:         20,
  yoyo:           true,
  onStart (isForward, isYoyo) {
    //...
  },
  onUpdate (ep, p, isForward, isYoyo) {
    //...
  },
  onComplete (isForward, isYoyo) {
    //...
  },
  // ...etc
})
// tween public methods
.setSpeed(.25)
// .pause()
// .stop()
// .replay()
// .playBackward()
// etc
.play();`
              }
            }
          </CodeSample>

          <p>
            Also implementing <span className="highlight">tweenable</span> interface means that any <span className="highlight">Shape</span> can be <span className="highlight">add</span>ed or <span className="highlight">append</span>ed to any <span className="highlight">timeline</span> as any <span className="highlight">tween</span> can be:
          </p>

          <CodeSample pen="72e333584c53191806ec7ecb5bce1630">
            {
              { js: `const timeline = new mojs.Timeline;
timeline
   .add( rect, circle, triangle, polygon, triangle2, polygon2, circle2 );`
              }
            }
          </CodeSample>

          <h2> Tune </h2>

          <p>
            You can <span className="highlight">tune</span> any property of a shape before playing it. The method was designed to give you the ability to change start properties on the fly regarding user input, thus you can add interactivity (click somewhere to see):
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
            Here above, we have tuned <span className="highlight">x</span> and <span className="highlight">y</span> properties of the circles before <span className="highlight">replay</span>ing it. Any property besides <span className="highlight">shape</span> one could be tuned at any moment of the time.
          </p>

          <p>
            Note that <span className="highlight">tune</span> call transforms entire shape's property query to keep it up to date form the new tuned one.Thus you tune not only the first shape state but the subsequent ones. For instance if you had chain of fill <span className="highlight"> yellow -> cyan</span> then <span className="highlight">magenta</span> and tune it to <span className="highlight">deepink</span>, you will eventually have <span className="highlight">deepink -> magenta</span> chain (click somewhere to see):
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

  // static value tune
  circle2
    .tune({ fill: 'deeppink' })
    .replay();
  
  // delta tune
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

          <h2>Custom Shapes</h2>

          <p>
            You probably have noticed that <span className="highlight">mojs</span> supports a bunch of built in shapes. Namely they are <span className="highlight">circle</span>, <span className="highlight">rect</span>, <span className="highlight">polygon</span>, <span className="highlight">line</span>, <span className="highlight">cross</span>, <span className="highlight">equal</span>, <span className="highlight">curve</span> and <span className="highlight">zigzag</span>. You can extend the set on shapes by providing <span className="highlight">mojs</span> with a custom one that suits your needs. For that:
          </p>

          <ul>
            <li>
              Draw your shape inscribed in a rectangle of <span className="highlight">100x100</span> in any vector editor and save the shape as <span className="highlight">svg</span>.
            </li>
            <li>
              Extend <span className="highlight">mojs.CustomShape</span> class and override <span className="highlight">getShape</span> method returning the shape tags from it excluding <span className="highlight">svg</span> tag itself:
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
              Now you can register this shape in <span className="highlight">mojs</span> with a <span className="highlight">name</span> that will be used in <span className="highlight">shape</span> property of <span className="highlight">mojs.Shape</span> constructor:
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
              { js: `/* ADD CUSTOM SHAPE */
class Bubble extends mojs.CustomShape {
  getShape () { return '<path d="M83.0657721,87.5048737 C74.252469,95.2810178 62.6770192,99.9991713 49.9995857,99.9991713 C22.385577,99.9991713 0,77.6135943 0,49.9995857 C0,22.385577 22.385577,0 49.9995857,0 C77.6135943,0 99.9991713,22.385577 99.9991713,49.9995857 C99.9991713,50.0248803 99.9991526,50.0501705 99.999115,50.0754564 L100,94.5453117 C100,99.9979302 96.8685022,101.290527 93.0045119,97.4313174 L83.0657721,87.5048737 Z"></path>'; }
  getLength () { return 200; } // optional
}
mojs.addShape( 'bubble', Bubble ); // passing name and Bubble class

/* USE CUSTOM SHAPE */
// now it is avaliable on mojs.Shape constructor as usual
const bubble = new mojs.Shape({
  shape:        'bubble',
  fill:         'none',
  stroke:       'white',
  scale:        { 0 : 1 },
  strokeWidth:  { 50 : 0 },
  y:           -20,
  duration:     1000,
});`
              }
            }
          </CodeSample>

          <h2>ShapeSwirl</h2>

          <p>
            <span className="highlight">ShapeSwirl</span> module basically is <span className="highlight">Shape</span> module with a little bit more functionality bolted on. ShapeSwirl automatically calculates sinusoidal x/y path for your shape, for that it adds more <span className="highlight">6</span> properties thus allowing to control frequency of size of the path and other parameters (click somewhere to see):
          </p>

          <CodeSample pen="c6888ce5c9f81ad825444d969779eadc">
            {
              { js: `const shapeSwirl = new mojs.ShapeSwirl({
  shape:          'circle',
  isSwirl:        true, // sets if the shape should follow sinusoidal path, true by default
  swirlSize:      10, // defines amplitude of the sine
  swirlFrequency: 3, // defines frequency of the sine
  pathScale:      'rand( .1, 1 )', // defines how much the total path length should be scaled
  degreeShift:    45, // angle shift for the sinusoidal path
  direction:      1, // direction of the sine could be 1 or -1
  x:              { 0 : 90 }
});`
              }
            }
          </CodeSample>

          <p>
            The main idea behind ShapeSwirl is to give you the ability to compose dust/smoke/bubbles effects or bassically any effect that needs to move over sine path (click somewhere to see):
          </p>

          <Pen pen="90e2506d73313d14d49486f7d71fb9d0" height="500"></Pen>

          <p>
            In any other aspect the <span className="highlight">ShapeSwirl</span> is the same as a simple <span className="highlight">Shape</span> so I won't spend much time with it.
          </p>

          <br/>

          <Cite>
            That was very fast intro to the `Shape` module. You can use <UniteLink link="">Shape APIs</UniteLink> and <UniteLink link="">ShapeSwirl APIs</UniteLink> as reference further on. What is important at this point — is that you should understand the ability to create a <span className="highlight">Shape</span> in any part of the screen or HTMLElement. If you want to animate some property — you add a <span className="highlight">delta</span> object that describes the transition of that property. You can chain the shape transition with <span className="highlight">then</span> calls and <span className="highlight">tune</span> new properties when you want. Tweenable interface allows you to work with <span className="highlight">Shape</span> same as you work with any other <span className="highlight">Tween</span>.
          </Cite>

          <br/>

          <h2>Use Cases</h2>

          <p>
            Despite the fact that <span className="highlight">Shape</span> and <span className="highlight">ShapeSwirl</span> modules are tiny bits that compose higher order modules, they have strong use cases and can be used by their own. There is no thing in the whole world such expressive and appealing as simple geometric shapes so they are ubiquitous in the motion graphics nowadays. You can also use it in your animations to add special effects and details making your animation more expressive. Also <span className="highlight">Shape</span>s often used to implode them into <span className="highlight">UI</span> thus enhancing it. From the development side of view — <span className="highlight">Shape</span> can be created with just one declarative call allowing you to focus entirely on you motion sequences and don't spend time to bootstrap things, this fact powers you with a <span className="highlight">"shape framework"</span> to think in so your sequences get more organized and consistent. I hope you don't believe me that <span className="highlight">Shape</span>s are usefull just because I claimed it out of loud, so let me convince you with the next real wold use cases.
          </p>

          <h3>Motion Graphics Use Cases</h3>

          <p>
            Motion graphics is indeed one of the strongest use cases for <span className="highlight">Shape</span>s. If you will think about it, nothing breathes life into static content better than the use of motion graphics. With shapes, the limits are simply the imagination of the designer or the artist, - you can create complex mograph sequnces based entirely on geometric and custom shapes.
          </p>


          <h4>Bubbles</h4>

          <p>
            Demo with custom bubble shapes and built in <span className="highlight">rect</span> and <span className="highlight">circle</span> ones.
          </p>

          <Pen pen="2ef10ed42ff535182c31cd1dbb81e453" height="500"></Pen>

          <h4>Geometric Scenes</h4>

          <p>
            We will walk thru some simple geometric scenes and then combine them to get a nice into.
          </p>

          <p>
            Another mograph sequence with triangles, - mistical, simple and appealing:
          </p>

          <Pen pen="4db9ec6079a3537d8c60ec888dd8e532"></Pen>

          <p>
            Next demo for mograph, - elegant, contrast and yet simple:
          </p>

          <Pen pen="c0b7b94e90142f19acba6ed9a4b05a2f"></Pen>

          <p>
            The next one is rather funky:
          </p>

          <Pen pen="c33a3582fc02842b99fa6eb01be6b3ba" height="700"></Pen>

          <p>
            Note that the best suite for white <span className="highlight">sparks</span> effect on the sides of the square is <span className="highlight">Burst</span> module which we will discuss shortly in the next tutorial, meanwhile in this particular demo, it was made with custom shapes to give you another clue how you would use the custom shapes.
          </p>

          <p>
            The next demo is just a nice transition between pages/app states:
          </p>

          <Pen pen="95a862f1ad8445134466ad7d64213d46" height="700"></Pen>

          <p>
            The last scene for this seqence would be <span className="highlight">mojs</span> logo reveal - good use case for shapes in tandem with <span className="highlight">property curves</span> application:
          </p>

          <Pen pen="b37bb9c6dede99d0ac75d60b5fb0d43d" height="700"></Pen>

          <p>
            We have a bunch of short contrast scenes which a drip contradict to each other. Let's finnaly connect all of them to get the etntire sequence:
          </p>

          <Pen pen="39427561a8a0b15d7896480a7d96d3d1" height="700"></Pen>

          <em>
            You can find the entire source code in <UniteLink link="https://github.com/legomushroom/shape-demo1">this repo</UniteLink> since the codepen code could be unreadable.
          </em>

          <h4>Word reveal</h4>

          <p>
            The last demo I will give you for the motion graphics use case is word reveal sequnce:
          </p>

          <Pen pen="c94452fb65dbf676b0ae8a12d4267473" height="700"></Pen>

          <p>
            That's would be it for mograph use cases demos, I hope you are getting more convinced that shapes could be useful in compositing effects when working with motion graphics on the web.
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