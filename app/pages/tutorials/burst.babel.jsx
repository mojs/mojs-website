import React        from 'react';
import Resizable    from 'react-component-resizable';
import ORXLine      from 'partials/orx-line';
import UniteLink    from 'partials/unite-link';
import Cite         from 'partials/cite';
import CodeSample   from 'partials/code-sample';
import Pen          from 'partials/codepen';
import HeftyContent from 'partials/hefty-content';
import More         from 'partials/more';
import PostImage    from 'partials/post-image';
import Gif          from 'partials/gif';
import SocialNetworksAbout from 'social-networks-about';
import DisqusComments from 'disqus-comments';
// const More = require('partials/more');

const BurstPage = new React.createClass({
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
      el.style['min-height'] = `${height}px`;
    }
  },
  _setRealHeight () { this.getDOMNode().style['min-height'] = "auto"; },

  render() {
    let content = null;
    if (this.state.isShow) {
      content = <div>
          <div className="post__header"> Burst </div>
          <div className="post__description"> Burst is the module that helps you to craft numerous sophisticated motion effects.</div>
          <ORXLine className="post__orx-line" />

          <Cite>
            Please make sure you are comfortable with <UniteLink link="/tutorials/shape/">Shapes & ShapeSwirl</UniteLink> before proceeding with this tutorial. Understanding those modules is crucial for understanding the <span className="highlight">Burst</span>.
          </Cite>

          <h2> Burst </h2>
          
          <p>
            <span className="highlight">Burst</span> is higher order module that creates sophisticated visual effects in any part of the screen you want. You can think of <span className="highlight">Burst</span> as particle emitter that composes bunch of <span className="highlight">ShapeSwirl</span>s together, creating a circle of particles.
          </p>

          <p>
            That's how it looks like by default (click somewhere to see):
          </p>

          <CodeSample pen="19099317e0137756f414ed3a043f85ae">
            {
              { js: `const burst = new mojs.Burst();` }
            }
          </CodeSample>

          <p>
            Just like with <span className="highlight">Shape</span>, mojs takes care about all bootstrapping work, creating as little container as possible and positioning the effect for you.
          </p>

          <p>
            From the technical point of view, <span className="highlight">Burst</span> is just a main <span className="highlight">ShapeSwirl</span> that holds bunch of child <span className="highlight">ShapeSwirls</span>. Nonetheless, you can control each of the child swirls. Pictorily it looks like this:
          </p>

          <p>
            <PostImage src="images/burst-pic.png"></PostImage>
          </p>

          <p>
            The main swirl has no <span className="highlight">shape</span> nor any presentation properties and in fact is <span className="highlight">0</span> size by default completely unreachable for user's interaction pointer.
          </p>

          <p>
            Another important note is that <span className="highlight">radius</span> property (and <span className="highlight">radiusX</span>/<span className="highlight">radiusY</span> ones) has different meaning - it controls the radius of radial shape of particles:
          </p>

          <CodeSample pen="643c0d3499e331934e95e80ffe2e323c">
            {
              { js: `const burst = new mojs.Burst({ radius: { 0: 100 } });` }
            }
          </CodeSample>

          <p>
            There is few more properties that <span className="highlight">Burst</span> implements over <span className="highlight">ShapeSwirl</span>  to control the radial shape behavior that particles compose. The first one is the <span className="highlight">count</span> property that sets amount of particles:
          </p>

          <CodeSample pen="fe6f9d1476aae148f1cfb36f599c92ff">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    3
});` }
            }
          </CodeSample>

          <p>
           The particles of the burst evenly placed in the circle that has 360 degree which you can change with the the <span className="highlight">degree</span> property:
          </p>

          <CodeSample pen="11fadc18861a656f0a72f5e132f48f12">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    5,
  degree:   30
});` }
            }
          </CodeSample>

          <p>
            Here above, we have the burst that has <span className="highlight">30 degree</span> of sufficient place for particles.
          </p>

          <p>
            It is very important to note here that since the main swirl of <span className="highlight">Burst</span> module has no actual shape - it completely have no style attributes that define shape's presentation - all of them among which are the <span className="highlight">stroke</span> or <span className="highlight">strokeWidth</span> or <span className="highlight">fill</span> are completely useless.
          </p>

          <p>
            Also the main swirl of the burst have no <span className="highlight">tween</span> related properties like <span className="highlight">delay</span> or <span className="highlight">duration</span>, the later is computed automatically regarding the <span className="highlight">duration</span> of the particles.
          </p>

          <p>
            Nonetheless, all <span className="highlight">properties</span> that control shape position, parent and opacity are present:
          </p>

          <CodeSample pen="dd9e8ce40b04df492bbf500616ddb815">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    7,
  angle:    { 0: 90 },
  opacity:  { 1: 0 },
});` }
            }
          </CodeSample>

          <p>
            To recap, the main swirl of the <span className="highlight">Burst</span> has no <span className="highlight">style</span> attributes because it has no shape, has no <span className="highlight">tween</span> related properties like <span className="highlight">duration</span> which is computed regarding particles <span className="highlight">duration</span>. But <span className="highlight">Burst</span> has all other properties most of them regarding position, opacity parent etc. You can always use the <UniteLink link="https://github.com/legomushroom/mojs/api/burst.md">Burst API</UniteLink> as reference.
          </p>

          <p>
            <span className="highlight">Burst</span> won't be much interesting unless we can control child particles, right?
          </p>

          <h2> Children Options</h2>

          <p>
            You can control children options with <span className="highlight">children</span> object property:
          </p>

          <CodeSample pen="4df574c7099a40929aebaaf4af386a04">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    5,
  degree:   30,
  children: {
    fill:       { 'cyan' : 'yellow' },
    duration:   2000
  }
});` }
            }
          </CodeSample>

          <p>
            I have some good news for you - you already know <span className="highlight">Burst's</span> syntax! Confusing claim? Nah! If you are familiar with <span className="highlight">Shape</span> and <span className="highlight">ShapeSwirl</span> modules - you know the <span className="highlight">Burst</span>. That's because the <span className="highlight">Burst</span> is nothing than just a <span className="highlight">ShapeSwirl</span> that holds child <span className="highlight">ShapeSwirls</span>, remember? This means you can put any property of <span className="highlight">ShapeSwirl</span> to the <span className="highlight">children</span> object, go try:
          </p>

          <CodeSample pen="64f13b396761ceabeb6e2967472acfa2">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    5,
  children: {
    shape:      'polygon',
    fill:       { 'cyan' : 'yellow' },
    radius:     20,
    angle:      { 360: 0 },
    duration:   2000
  }
});` }
            }
          </CodeSample>

          <p>
            Actually <span className="highlight">Burst</span> gives you even more control over each child, allowing you to specify property for each of them explicitly. These two techniques are called <span className="highlight">Stagger Strings</span> and <span className="highlight">Property Maps</span>.
          </p>

          
          <h3>Stagger Strings</h3>

          <p>
            <span className="highlight">Stagger Strings</span> were designed to express continious numeric values with some defined step (see delay property on children):
          </p>

          <CodeSample pen="3610a7d0e0ab283acf8d42f3a4b6b9a9">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    10,
  children: {
    shape:      'polygon',
    points:     5,
    fill:       { 'cyan' : 'yellow' },
    angle:      { 360: 0 },
    duration:   2000,
    delay:      'stagger(0, 100)'
  }
});` }
            }
          </CodeSample>

          <p>
            The first parameter in <span className="highlight">stagger</span> function is <span className="highlight">start</span> value, all subsequent steps will be added to that start value which is fairy optional tho and can be omitted. If you just write <span className="highlight">stagger(25)</span> - this means stagger with step of <span className="highlight">25</span>, starting from <span className="highlight">0</span>.
          </p>

          <p>
            In the demo above, that's exact the same circle, but we have <span className="highlight">staggered</span> the <span className="highlight">delay</span> property so it looks rather spiral now.
          </p>

          <p>
            Every numeric value can be expressed with stagger stings. Also they can contain <span className="highlight">rand</span>oms (see the delay property in children):
          </p>

          <CodeSample pen="05ff77cfc49e2d5f82363d90339a24e1">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    10,
  children: {
    shape:      'polygon',
    points:     5,
    fill:       { 'cyan' : 'yellow' },
    angle:      { 360: 0 },
    duration:   2000,
    delay:      'stagger( rand(0, 100) )'
  }
});` }
            }
          </CodeSample>

          <p>
            We have staggered the delay with random function in interval of 0 to 100.
          </p>


          <h3>Property Maps</h3>

          <p>
            Property Map was designed to express sequential values. You can use it to generate values that repeat over and over but are mapped to children length. Basically it is just an array that maps its values to children regarding child index with <span className="highlight">mod</span> function. So if you have <span className="highlight">property map</span> with <span className="highlight">3 values</span> and burst has <span className="highlight">5 children</span>, then <span className="highlight">4</span>th and <span className="highlight">5</span>th item will receive <span className="highlight">0</span>th and <span className="highlight">1</span>st values from the map respectively:
          </p>

          <CodeSample pen="c3c518a84fea019d715cad07e87c29bf">
            {
              { js: `const burst = new mojs.Burst({
  radius:   { 0: 100 },
  count:    5,
  children: {
    shape:        'circle',
    radius:       20,
    fill:         [ 'deeppink', 'cyan', 'yellow' ],
    strokeWidth:  5,
    duration:     2000
  }
});` }
            }
          </CodeSample>

          <p>
            So starting from 12 o'clock clockwise children <span className="highlight">fill</span> property gets values of <span className="highlight">deeppink</span>, <span className="highlight">cyan</span>, <span className="highlight">yellow</span> and then again starting from the beginning of the property map - <span className="highlight">deeppink</span>, <span className="highlight">cyan</span>.
          </p>

          <p>
            Property maps work with any property and property forms, in fact that's just a prism(or multiplexer) that feeds children with properties by virtue of modulus function. Good aid if you want to set some property on child explicitly.
          </p>

          <h2> then, tune, generate and play </h2>

          <p>
            You can make <span className="highlight">then</span> state chains, <span className="highlight">tune</span> and <span className="highlight">generate</span> any <span className="highlight">Burst</span> the same as you do with <span className="highlight">Shape</span> or <span className="highlight">ShapeSwril</span>. Also since the <span className="highlight">Burst</span> is merely a <span className="highlight">ShapeSwirl</span> under the hood, you can use any <span className="highlight">tween</span> interface public method like <span className="highlight">play</span>, <span className="highlight">setProgress</span>, <span className="highlight">replay</span> etc (click somewhere to see):
          </p>

          <CodeSample pen="dbf4904aa71f428a38401610e1c8f863">
            {
              { js: `document.addEventListener( 'click', function (e) {
burst
  .tune({ x: e.pageX, y: e.pageY })
  .setSpeed(3)
  .replay();
});` }
            }
          </CodeSample>


          <h2> Recap </h2>

          <p>
            That's basically the burst, as I said you already know it so we won't go thru the children options again, instead let's jog thru some use cases in the next section which will help as to gain some intuition over where and how to use the bursts. As you remember, - <span className="highlight">Burst</span> is just a composition of bunch of <span className="highlight">ShapeSwirls</span>. There is the main swirl in the center of the burst but it has no visual shape. Also it has no tween properties and it's durations is calculated regarding duration of the children. All child swirls use the main one as <span className="highlight">parent</span>. You can set properties of <span className="highlight">children</span> with the appropriate property. Please, use the <UniteLink link="/tutorials/burst.md">Burst API</UniteLink> as the reference.
          </p>

          <h2> Use Cases </h2>

          <Cite>
            Please note that the use cases section contains a lot of live code examples but the actual code samples are omitted for time savings and simplicity sake. The actual code is still available on the <span className="highlight">Babel</span> tab of the pens and I highly encourage you to read through and play with them while we will walk through this section. You can omit reading large demos code since it is probably unreadable (Codepen can contain bundled code) or it could be too large to understand sparingly, but you can return to them later, - after you will complete this tutorial. I will leave a little (×) mark for you to indicate that you can skip reading the source code of the Codepen for now.
          </Cite>

          <p>
            <span className="highlight">Burst</span>, in similarity with <span className="highlight">Shape</span> or <span className="highlight">ShapeSwirl</span> has numerous application fields, among which are motion graphics, animation or UI. In contrary to <UniteLink link="/tutorials/shape/"> Shape&ShapeSwirl </UniteLink> tutorial, I won't split use cases to different entities but rather will try to do lot's of small demos, each with explanation comments. Hang tight!
          </p>

          <h3>Microconfirmations</h3>

          <p>
            First what comes in mind when I see the default burst - is the famous Twitter's fav animation. Animations like that are usually called <span className="highlight">microconfirmations</span> but I've used to call them <span className="highlight">microcelebrations</span> because of their festivity.
          </p>

          <p>
            Anyways, sequences like that are a cinch when you have the burst module in your hands. There is how to do the main part of the sequence (click anywhere to see):
          </p>

          <Pen pen="cb910fce2e9ed27f902ae7f895bbb9ac" height="500" />

          <p>
            Here above, we have declared a burst with 5 particles (which is by default) with a burst's radius transition form 4 to 19. There are 2 strategies for bursts like that - one is to scale children down (by default), the second one is to animate <span className="highlight">strokeDashoffset</span> on children which we have used here.
          </p>

          <p>
            The next step is to add two more shapes to the scene - one circle with <span className="highlight">strokeWidth</span> animation and a custom one - the star with <span className="highlight">elastic.out</span> transition for the <span className="highlight">scale</span>(click anywhere to see):
          </p>

          <Pen pen="080045a3420abd5344443aff91c85fa2" height="500" />

          <p>
            I love using the burst module over sprites because it turns out to be a way flexible over pre-rendered sequence of images, - you can play with easings, time, delay, colors etc. Also you can even change shapes with no effort at all - for instance if you want to add stars instead of lines(click anywhere to see):
          </p>

          <Pen pen="0fd14523d76f93865539f1f011682da9" height="500" />

          <p>
            Ok, lets redo the later Twitter love animation too. There is the burst part of the sequence(click anywhere to see):
          </p>

          <Pen pen="28b429cd2d5ae8c0dd0f10cecd6d0bd0" height="500" />

          <p>
            The catch here is to use the <span className="highlight">in</span> easing for <span className="highlight">scale</span> property and the opposite <span className="highlight">out</span> easing for particles position. Also we have set the <span className="highlight">pathScale</span> slightly smaller for "inner" particles. Alos we have defined a small <span className="highlight">degreeShift</span> for each odd("inner") particle.
          </p>

          <p>
            The next step is to add the circle shape and heart animations almost identical to ones we have used in the Twitter fav scene(click anywhere to see):
          </p>

          <Pen pen="e3751855536c67dc6f57f9e74e5e347d" height="500" />

          <p>
            And the last touch is to add all the color deltas, there are quite some of them(click anywhere to see):
          </p>

          <Pen pen="f25a2fbaf15c43c0923f507d54951cdb" height="500" />

          <p>
            That's basically the same microconfirmations that I've gave you in the <UniteLink link="/tutorials/shape/">Shape&ShapeSwirl</UniteLink> tutorial(×):
          </p>

          <Pen pen="3c49de2d7d0ca3e92bf5db5bf7a2687d" height="500"></Pen>

          <p>
            You can imagine that those effects are much easier with <span className="highlight">Burst</span> module. For instance bubbles, in the the first part, can be made like this:
          </p>

          <Pen pen="a336008aff2d73121763887097a99001" height="500"></Pen>

          <p>
            Here we have static <span className="highlight">radius</span> of <span className="highlight">25</span> on burst and <span className="highlight">3</span> <span className="highlight">white</span> particles. We've set slightly <span className="highlight">rand</span>om <span className="highlight">degreeShift</span> and <span className="highlight">delay</span> on <span className="highlight">children</span> that eventually gives us the bubble like motion.
          </p>

          <p>
            The second burst is super simple one:
          </p>

          <Pen pen="afbfb59f00d5dfb8b28fc97510fcc167" height="500"></Pen>

          <p>
            As you can see, the second burst is almost the default one, we have only changed the main <span className="highlight">radius</span> to <span className="highlight">0 : 30</span>. As for children, we tweaked the <span className="highlight">shape</span> to <span className="highlight">line</span> value, and made the <span className="highlight">scaleX</span> to fade out from <span className="highlight">1</span> to <span className="highlight">0</span>.
          </p>

          <p>
            The final touch is to add center <span className="highlight">circle</span> and <span className="highlight">cross</span> shapes:
          </p>

          <Pen pen="d260dc9246f2100b9f2dbe79a01d01f6" height="500"></Pen>

          <p>
            The second part of the demo is even simpler, we just need to set <span className="highlight">degree</span> to <span className="highlight">0</span> so the particles will flow in one direction, then set <span className="highlight">isSwirl</span> to <span className="highlight">true</span> (Burst composes ShapeSwirls, remember?) on <span className="highlight">children</span> thus particles will follow sine path. After that we need to slightly randomize <span className="highlight">swirlSize</span>, <span className="highlight">swirlFrequency</span> and <span className="highlight">pathScale</span> parameters (click somewhere to see):
          </p>

          <Pen pen="60d5d3c97981022f20f86c37580bceb1" height="500"></Pen>

          <p>
            Just like with previous example, the last touch is to add <span className="highlight">circle</span> and <span className="highlight">cross</span> transitions (click somewhere to see):
          </p>

          <Pen pen="f307bc95b1ac02c09042c89ea7afe945" height="500"></Pen>

          <h3>Motion for the web</h3>

          <p>
            Let's recall the old "motion for the web" demo(×):
          </p>

          <Pen pen="ogOYJj" height="500" />

          <em>
            Note that the demo was made a while ago so it contains deprecated syntax.
          </em>

          <p>
            How many burst modules have you noticed in this demo? There are quite some actually. I think the most noticeable are collisions with the ground (click to see):
          </p>

          <Pen pen="4fe37a79f6d665d749ebcb4f22c2ee4e" height="500" />

          <p>
            This one was made by virtue of <span className="highlight">degree: 180</span>, children <span className="highlight">radius</span> of <span className="highlight">7</span> and <span className="highlight">strokeDashoffset</span> animation on particles.
          </p>

          <p>
            There is another one burst in that demo:
          </p>

          <Pen pen="953926af8c30d3dd297070b1a079e059" height="500" />

          <p>
            This one is simple too, good one to practice basics.
          </p>

          <p>
            Did you notice those meteors on the left of the letters? Those are <span className="highlight">Burst</span> too. How? Well first you have a burst with 3 children:
          </p>


          <Pen pen="1018219ace50f564f7bb8b77b53efeb8" height="500" />

          <p>
            Then you set <span className="highlight">degree</span> of <span className="highlight">0</span> so they all will fly to the same direction:
          </p>

          <Pen pen="d84370a3c19fdcea8c714e7049c9ab5d" height="500" />

          <p>
            Hm, they kind of overlap, so lets shift them by staggering <span className="highlight">left</span> and <span className="highlight">top</span> properties on children, after that lets add some <span className="highlight">delay</span> with a property map:
          </p>

          <Pen pen="2be25259bdd8e01f9ac3770f6f2bd36a" height="500" />

          <p>
            Do you see that? Almost there. The last touch is to rotate the main swirl:
          </p>


          <Pen pen="bf8377efd5b0dada9537481e29ecd6af" height="500" />

          <p>
            Pretty yummy.
          </p>

          <p>
            What else have we got in the demo? Letters! That's how O letter was made:
          </p>

          <Pen pen="432464f276fe6f06b457915ca6062723" height="500" />

          <p>
            As you can see, we've set the main swirl's <span className="highlight">radius</span> and <span className="highlight">degree</span> to <span className="highlight">0</span> to put the child shapes in the one spot. Then we just have to slightly stagger <span className="highlight">delay</span> on children.
          </p>

          <p>
            The same technique for the other parts - vertical and horizontal lines:
          </p>

          <Pen pen="33f7924ecd146d951698bf190ac7838e" height="500" />

          <p>
            Catching up? Good. Let's refactor it a bit and make the vertical line to start from the bottom, like firework launch:
          </p>


          <Pen pen="a3c64825683dddd18316f8f288475131" height="500" />

          <p>
            That's better.
          </p>

          <h3>Blast all the things up</h3>

          <p>
            Let's move on. What else we can do with <span className="highlight">Burst</span>? We can blast things up. I love blasting things up, do you? Recall this demo from the <UniteLink link="/tutorials/shape/">Shape&ShapeSwirl</UniteLink> tutorial(×):
          </p>

          <Pen pen="c94452fb65dbf676b0ae8a12d4267473" height="500" />

          <p>
            Do you see that blast at the start? Lets make it together. First, you can notice these small particles:
          </p>
          
          <Pen pen="79db23782ec1eb9d16246b136ec82b9c" height="500" />

          <p>
            Notice how we use <span className="highlight">pathScale</span> and <span className="highlight">degreeShift</span> properties to add randomness to the blast. The <span className="highlight">pathScale</span> property defines how the length of the particle's path scales. The <span className="highlight">degreeShift</span> property defines how much the particle will shift in it's radial position in burst circle shape. So if particle has <span className="highlight">degreeShift</span> of <span className="highlight">90</span>, it will be shifted in radial shape by 90 degree. Since <span className="highlight">pathScale</span> and <span className="highlight">degreeShift</span> both have random values and we <span className="highlight">generate</span> the module on each user click - we always have the random blast pattern.
          </p>

          <p>
            Lets add more details to the blast, for instance another burst with large geometric shapes:
          </p>

          <Pen pen="3b9c757a7625dc015753740bcad8fb66" height="500" />

          <p>
            Feels rather messy. But it's fine for now, it should get straight when we will add more shapes:
          </p>

          <Pen pen="4c8366d3a7eea2a5f83a3d457f8e9cd9" height="500" />

          <p>
            And the last touch is to add "one spot" large burst of 3 items - one red, one white and one black:
          </p>

          <Pen pen="699cfc8716a13e0e1c15105af2b6fb95" height="500" />

          <p>
            Yum. I hope you love to blast things up too now. Notice we did it without a single repaint!
          </p>

          <h3>Modal blast</h3>

          <p>
            If you recall the next old demo, you probably can say now how it was done. How many modules does this blast compose (click close to see the effect)(×)?
          </p>

          <Pen pen="XJjLxe" height="700" />

          <p>
            The answer is 3 - <span className="highlight">2 Bursts</span> and <span className="highlight">1 subtle circle</span> in the middle.
          </p>

          <Pen pen="6caf96461207a5caa9226fbd2631569d" height="500" />

          <p>
            The effect is a drip more modest than the previous one. As you can see, I haven't recreated exact the same sequence here, but rather made a bit different one.
          </p>

          <h3>The sleepy mole</h3>

          <p>
            OK. Enough distraction. Lets create something less obvious. Recall this demo with the mole(×):
          </p>

          <Pen pen="477056cb1ffe88c4bfbf8a3005d99496" height="600" />

          <p>
            Can you count how much effects are bursts here? There are quite few. The most noticeable is the effect that appears after door shuts down - the 4 spots of dust. This one was composed with 4 bursts (one for each corner), lets start with just one for now:
          </p>

          <Pen pen="97a95a5cb7663cf336e8d80f9f511553" height="500" />

          <p>
            How is it possible? Remember that the <span className="highlight">Burst</span> composes <span className="highlight">ShapeSwirl</span>s not simple <span className="highlight">Shape</span>s so, if we set <span className="highlight">isSwirl</span> to <span className="highlight">true</span>, we will have sine paths. That's how you do 4 at once (click to see):
          </p>

          <Pen pen="bbc4c52b7145d9d872ac437f21afd75f" height="500" />

          <em>
            You can do the same <span className="highlight">4 dust points effect</span> with just one declarative call if will use <span className="highlight">Stagger</span> module, but that's a topic for the next tutorial.
          </em>

          <p>
            OK. Recalling the mole demo, what else did you notice? Probably that confetti that appear when cube hits the floor. Right! 
          </p>

          <p>
            That's how you the first large one:
          </p>

          <Pen pen="421a16733643447bb4770424cf72563d" height="500" />

          <p>
            The main catch here is to mimic the air flow by rotating the main swirl backward slightly. Then you have to create more bursts, each one is smaller then previous one and each of them should have a smaller delay.
          </p>

          <Pen pen="d0d0c2b1e98f1a0f8d6ea250c31ed081" height="500" />

          <p>
            What else have you noticed in the mole demo? Yep saliva that comes from the mole mouth when it teases. First you want to make <span className="highlight">0 degree</span> burst, and rotate the main swirl downward, imitating that the air current that comes out form his mouth gets weaker:
          </p>

          <Pen pen="828d4f1e1f6fdfd608b588af0b9bdd45" height="500" />

          <p>
            Then add larger burst's <span className="highlight">radius</span>, turn on swirl sine paths and randomize them with <span className="highlight">pathScale</span> property:
          </p>

          <Pen pen="8b3f0eb920226a7c2d703e601af38fcf" height="500" />

          <p>
            At last add random <span className="highlight">radius</span> to children and mix <span className="highlight">direction</span> of the swirls:
          </p>

          <Pen pen="b1e36259bfa2d6023402eef7de77cc8d" height="500" />

          <p>
            You can see that the <span className="highlight">Burst</span> module is pretty flexible thus helps you to craft numerous sophisticated effects.
          </p>

          <h3>The dust trail</h3>

          <p>
            That's it. OK, lets recall another demo, remember this one from previous tutorial? Did I notice that the dust trail effect is much easier with burst(×)?
          </p>

          <Pen pen="633e6aa52d40691cca2f2cda91650bae" height="500"></Pen>

          <p>
            As you remember, to create the dust trail effect, you first we need to shoot the child swirls downward to the ground with random children radiuses:
          </p>

          <Pen pen="c59d4e046a6c78f3ac9d3a5699018fa8" height="500"></Pen>

          <p>
            Look, now instead of multiple swirl modules which we have been using in previous tutorial, we use just one burst - <span className="highlight">stagger</span> expressions turn out to be useful! After that you want to create an <span className="highlight">overflow: hidden</span> container and assign it as <span className="highlight">parent</span> to the burst:
          </p>


          <Pen pen="e48eb4e56ce1fa94c515b4fda6513d24" height="500"></Pen>

          <p>
            This time we have used <span className="highlight">Shape</span> module as <span className="highlight">parent</span> overflow constrain.
          </p>

          <p>
             The last touch is to add the fading burst at the end and make the <span className="highlight">parent</span> move to the left:
          </p>

          <Pen pen="10cc620075141688d0cf8eca7a561062" height="500"></Pen>

          <p>
            That's exact the same effect as we have made in the <UniteLink link="/tutorials/shape/">Shape&ShapeSwirl</UniteLink> tutorial, but this time with just 2 <span className="highlight">Bursts</span>! <span className="highlight">Bursts</span> are fun, there is a little demo I've made with the dust effect (click to see):
          </p>

          <Pen pen="03e9d8f2fbf886aa1505c61c81d782a0" height="700"></Pen>

          <p>
            That's it for <span className="highlight">Burst</span>. We've touched only the surface of the possible effects that you can compose with this module, but that's a good start to convey the idea and APIs. Also my friends from <UniteLink link="http://tympanus.net/codrops/">Codrops</UniteLink> wrote a awesome <UniteLink link="http://tympanus.net/Development/Animocons/">post</UniteLink> a while ago on the <span className="highlight">Burst</span> matter, definitely check it out.
          </p>

          <h2> Recap </h2>

          <p>
            Burst is the module that helps you to craft sophisticated motion effects with simple declarative calls. Technically, it is the main <span className="highlight">ShapeSwirl</span> that composes bunch of child <span className="highlight">ShapeSwirls</span> forming radial shape by default. <span className="highlight">mojs</span> takes care about all markup bootstrapping and positioning of the module for you. The main swirl has no shape thus no presentation properties. The duration of the main swirl is calculated regarding duration of the child swirls and could not be set either. To control child swirls, pass the <span className="highlight">ShapeSwirl</span> properties to the <span className="highlight">children</span> property of the main swirl. You can find exhaustive API reference at <UniteLink>Burst API</UniteLink> section.
          </p>

          <p>
            
          </p>

          <h2>Thank you!</h2>

          <p>
            I happy you've made it here! It was a long and intense journey, I hope you don't feel overwhelmed. I also humbly hope that these effect modules will come handy to you on your web development route. There are some more "effects" modules will land to the mojs shortly so stay tuned. For any questions, catch me on Twitter (<UniteLink link="https://twitter.com/legomushroom">@legomushroom</UniteLink>), ask a question on StackOverflow with <span className="highlight">#mojs</span> tag, rise an issue on <UniteLink link="https://github.com/legomushroom/mojs">github repo</UniteLink> or leave a comment in the section below. You can help the project on <UniteLink>Patreon</UniteLink> (project does need help) and/or on <UniteLink link="https://github.com/legomushroom/mojs/issues">github</UniteLink>. {'Love <3.'}
          </p>

          <p style = {{ textAlign: 'center', marginTop: '50px' }}>
            <br />
            Next: &nbsp;<UniteLink link="/tutorials/stagger" isDisabled="true" className="highlight">Stagger</UniteLink>
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

export default BurstPage;