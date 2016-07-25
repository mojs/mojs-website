React       = require 'react'
Router      = require 'react-router'
UniteLink   = require 'partials/unite-link'
{ Link } = Router

MoleSample    = require './mole-sample'
Vimeo         = require 'partials/vimeo'
PostImage     = require 'partials/post-image'
Cite          = require 'partials/cite'
ORXLine       = require 'partials/orx-line'
CodeSample    = require 'partials/code-sample'
Pen           = require 'partials/codepen'
EasingObjectGraph = require 'partials/easing-object-graph'
EasingGraph       = require 'partials/easing-graph'
Resizable         = require 'react-component-resizable'

More  = require('partials/more.babel.jsx').default

HeftyContent        = require 'partials/hefty-content'
DisqusComments      = require 'partials/disqus-comments'
SocialNetworksAbout = require 'partials/social-networks-about'
require 'css/pages/tutorials-page'
require 'css/blocks/post'
require './path-easing-styles.styl'

window.onbeforeunload = ->
  post = document.getElementById 'post'
  sessionStorage.setItem('beforeUnloadPostHeight', post.offsetHeight)

module.exports = React.createClass
  getInitialState:-> {}
  _onResize:-> window.dispatchEvent(new Event('resize'))
  componentWillUnmout:-> clearTimeout @_tm
  componentDidMount:->
    @_checkHeight()
    @_tm = setTimeout (=> @setState({ isShow: true }); @_setRealHeight() ), 500

  _checkHeight:->
    url = sessionStorage.getItem('beforeUnloadURL')
    height = sessionStorage.getItem('beforeUnloadPostHeight')
    if url = window.location.href
      el = @getDOMNode()
      el.style['min-height'] = "#{height}px"

  _setRealHeight:-> @getDOMNode().style['min-height'] = "auto"


  render:->
    content = null
    if @state.isShow
      content = <div>
          <div className="post__header">Easing / Path Easing</div>
          <div className="post__description"> This post is about path easing functions for precise timing function control.</div>
          <ORXLine className="post__orx-line" />

          <p className="post__top-links">
            <UniteLink link="http://codepen.io/sol0mka/full/477056cb1ffe88c4bfbf8a3005d99496/">demo on CodePen</UniteLink> | 
            <UniteLink link="https://github.com/legomushroom/property-curves">demo's repo on GitHub</UniteLink> | 
            <UniteLink link="https://github.com/legomushroom/mojs/">mo · js on GitHub</UniteLink>
          </p>
          
          <p>
            Easing (or timing function) is the secret sauce ingredient that makes our motion work
            look natural and delightful.
            Linear movement can seem very unnatural, as nothing moves linearly in our physical world.
          </p>

          <Cite author="Stanislaw Ulam">
            Using a term like nonlinear science is like referring to the 
            bulk of zoology as the study of non-elephant animals.
          </Cite>

          <p>
            Animation with equal interim spacing (ie. with linear easing) can
            be dull, or make our brain respond with suspicion.
            By contrast, excellently crafted easing appeals to the user's attention,
            and raises their curiosity, thus draws them in.
            That's why it's so crucial to embrace full control over easing functions.
          </p>

          <p>
            Fortunately <span className="highlight">mo· js</span> has the most comprehensive set of easing functions available on the modern web. Besides&nbsp;
              <UniteLink link="/easing/basic" isDisabled="true">
                Base Easing Functions
              </UniteLink>, 
              <UniteLink link="/easing/bezier-curves" isDisabled="true">
                Bezier Curves
              </UniteLink> and 
              <UniteLink link="/easing/springs" isDisabled="true">
                Springs
              </UniteLink> which you can find in other web animation libraries, 
              <span className="highlight">mo· js</span>
              &nbsp; has a super precise easing function type
              - <span className="highlight">path easing</span>.
              It allows you to draw your own timing functions.
              That's what this tutorial is dedicated to, hang tight!
          </p>

          <h2>First things first</h2>

          <p>
            Consider the example below, 
            a case where we need precise control over the easing function.
            The start point is a simple falling square:
          </p>

          <CodeSample pen="3b0aa7072d18806d8a6e80fe7e22051b">
            { js: """var square = document.querySelector('#js-square');
                      new mojs.Tween({
                        repeat:   999,
                        delay:    2000,
                        onUpdate: function (progress) {
                          square.style.transform = 'translateY(' + 200*progress + 'px)';
                        }
                      }).play();
              """
            }
          </CodeSample>

          <em>
            <i>Note</i>: No vendor prefixes are used in the code above for
            clarity's sake but some browsers still do need them.
          </em>

          <p>
            We've created a tween here by constructing 
            the <span className="highlight">mojs.Tween</span> class (line 2).
            On every frame update, we multiply the tween's progress (in a range from 0 to 1)
            by 200 and set the result as the current 
            <span className="highlight">translateY</span> property (line 6) of our 
            <span className="highlight">square</span> object (line 1).
          </p>

          <p>
            As a result we have one sloppy movement here, it doesn’t really look
            like something falling down at all. So lets add bounce easing:
          </p>

          <CodeSample pen="bd62b1fd5a638e34f03607f6a6968769">
            { js: """var square = document.querySelector('#js-square');
                      new mojs.Tween({
                        repeat:   999,
                        delay:    2000,
                        onUpdate: function (progress) {
                          var bounceProgress = mojs.easing.bounce.out(progress);
                          square.style.transform = 'translateY(' + 200*bounceProgress + 'px)';
                        }
                      }).play();
              """
            }
          </CodeSample>

          <p>
            The bounce easing was added by passing the linear progress 
            through a <span className="highlight">bounce.out</span> function
            (line 6)
            &nbsp;that is available on 
            <span className="highlight">mojs.easing</span> object - the place where 
            all easing functions and helpers are stored. 
            The outcome is pretty obvious - you've probably seen it before -
            we have something that kind of looks like a falling object with it’s own physics,
            despite the fact that it doesn't obey any physics laws. It's behavior is hardcoded
            into this graph:
          </p>

          <EasingObjectGraph
            duration={ 1000 }
            onUpdate = { (o)->
              shift = 180*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
              "#{shift.toFixed(0)} px"
            }
            label="translateY"
            background="#F1E2D7"
            path="M0,100 C2.45434624,97.8269293 16.3464551,108.82637 36.7536484,1.51862764 C57.2239404,55.7168427 71.8396693,1.51862764 73.4575634,0.417637977 C82.7586528,14.6942143 89.6790662,2.18537229 91.391449,0 C95.988064,6.63361647 100,0 100,0">
            
            <div className="path-easing-rectangle"></div>
          
          </EasingObjectGraph>

          <p>
            If you think about it, this common bounce easing graph represents
            composition of an object's parameters like the material it is made of or
            it's weight or acceleration.
            Savvy readers starting to grasp the main issue of this widespread easing function
            - you are unable to change individual properties on demand, so it is quite limited.
          </p>

          <p>
            What if we want to change the weight parameter of our object so it will
            have much wider bouncing amplitude range? That’s the point where the 
            <span className="highlight">path easing</span> become irreplaceable. 
            Lets jump to a vector graphics editor
            with <UniteLink link="/app/pages/tutorials/easing/path-easing/files/bounce-easing.svg">this common graph</UniteLink> as a bootstrap. 
          </p>

          <em>
            <i>Note</i>: Any vector editor will do here, I prefer to use Sketch lately, 
            but any that can produce a <span className="highlight">SVG path</span> works.
          </em>

          <p>
            We will amplify the bouncing curves a bit, to make our motion feel like it belongs to a lighter object
            (or much more bouncy one - made of rubber instead of wood).
            This is what the bouncy graph might look like:
          </p>

          <EasingObjectGraph
            duration={ 1500 }
            onUpdate = { (o)->
              shift = 180*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
              "#{shift.toFixed(0)} px"
            }
            label="translateY"
            background="#F1E2D7"
            path="M0,100 C6.50461245,96.8525391 12.6278439,88.3497543 16.6678547,0 C16.6678547,-1.79459817 31.6478577,115.871587 44.1008572,0 C44.1008572,-0.762447191 54.8688736,57.613472 63.0182497,0 C63.0182497,-0.96434046 70.1500549,29.0348701 76.4643231,0 C76.4643231,0 81.9085007,16.5050125 85.8902733,0 C85.8902733,-0.762447191 89.4362183,8.93311024 92.132216,0 C92.132216,-0.156767385 95.0157166,4.59766248 96.918051,0 C96.918051,-0.156767385 98.7040751,1.93815588 100,0">
            
            <div className="path-easing-rectangle"></div>
          
          </EasingObjectGraph>

          <em>
            <i>Note</i>: This path easing is used in the <UniteLink link="http://codepen.io/sol0mka/full/477056cb1ffe88c4bfbf8a3005d99496/">final demo</UniteLink> (with small tweaks), 
            particularly when the white cube bounces on the floor.
          </em>

          <p>
            Here is my <UniteLink link="/app/pages/tutorials/easing/path-easing/files/bouncy-easing.svg">.svg file</UniteLink> with this bouncy graph.
            Now we can generate our custom easing function from this SVG path.
            To do this, copy the Path's commands from the 
            <span className="highlight">d attribute</span> and pass them to 
            the <span className="highlight">mojs.easing.path</span> function (line 2) and 
            you will get a newly generated easing function back:
          </p>

          <CodeSample pen="c4b415a9167718d3134df04f07ac609b">
            { js: """var square = document.querySelector('#js-square');
                      var bouncyEasing = mojs.easing.path('M0,100 C6.50461245,96.8525391 12.6278439,88.3497543 16.6678547,0 C16.6678547,-1.79459817 31.6478577,115.871587 44.1008572,0 C44.1008572,-0.762447191 54.8688736,57.613472 63.0182497,0 C63.0182497,-0.96434046 70.1500549,29.0348701 76.4643231,0 C76.4643231,0 81.9085007,16.5050125 85.8902733,0 C85.8902733,-0.762447191 89.4362183,8.93311024 92.132216,0 C92.132216,-0.156767385 95.0157166,4.59766248 96.918051,0 C96.918051,-0.156767385 98.7040751,1.93815588 100,0');

                      new mojs.Tween({
                        repeat:   999,
                        delay:    2000,
                        duration: 1500,
                        onUpdate: function (progress) {
                          var bounceProgress = bouncyEasing(progress);
                          square.style.transform = 'translateY(' + 200*bounceProgress + 'px)';
                        }
                      }).play();
              """
            }
          </CodeSample>

          <p>
            Yay! We've drawn our custom path easing - 
            our square feels much more bouncy now!
          </p>

          <p>
            You can literally draw your easing functions with <span className="highlight">Path easing</span>.
            These are a few more examples of the custom easing you can draw:
          </p>

          <ul>
            <li>
              extreme ease-in-out (
              <UniteLink link="/app/pages/tutorials/easing/path-easing/files/extreme-ease-in-out.svg">.svg file</UniteLink>) :
            </li>
          </ul>

          <EasingObjectGraph
            duration={ 3000 }
            onUpdate = { (o)->
              shift = 1 - .9*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "scale(#{shift}) translateZ(0)"
              "scale( #{shift.toFixed(2)} )"
            }
            label="scale"
            background="#F1E2D7"
            path="M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0">
            
            <div className="path-easing-rectangle path-easing-rectangle--extreme-ease"></div>
          
          </EasingObjectGraph>

          <CodeSample pen="bf7056db37e491eacb20b33665d13260">
            { js: """var square = document.querySelector('#js-square');
                      var extremeInOutEasing = mojs.easing.path('M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0');

                      new mojs.Tween({
                        repeat:   999,
                        delay:    2000,
                        duration: 1500,
                        onUpdate: function (progress) {
                          var extremeInOutProgress = extremeInOutEasing(progress);
                          square.style.transform = 'scale(' + (1 - (.9*extremeInOutProgress)) + ')';
                        }
                      }).play();


              """
            }
          </CodeSample>

          <br />

          <ul>
            <li>
              or even <span className="highlight">extreme ease-in-elastic-out</span> (
              <UniteLink link="/app/pages/tutorials/easing/path-easing/files/extreme-ease-in-elastic-out.svg">.svg file</UniteLink>):
            </li>
          </ul>

          <EasingObjectGraph
            duration={ 1500 }
            onUpdate = { (o)->
              shift = 1 - .9*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "scale(#{shift}) translateZ(0)"
              "scale( #{shift.toFixed(0)} )"
            }
            label="scale"
            background="#F1E2D7"
            path="M0,100 C50,100 50,100 50,50 C50,-15.815625 53.7148438,-19.1218754 60.4981394,0 C62.2625924,4.97393188 66.4286578,6.07928485 68.3303467,0 C71.3633751,-6.23011049 74.5489919,-1.10166123 75.7012545,0 C79.6946191,3.60945678 84.2063904,-0.104182975 84.2063905,0 C87.5409362,-2.25875668 90.4589294,-0.0327241098 93.4950242,0 C97.3271182,0.20445262 100,-0.104182352 100,0">
            
            <div className="path-easing-rectangle path-easing-rectangle--extreme-ease"></div>
          
          </EasingObjectGraph>

          <CodeSample pen="54b59e63f48373df2bd39baab02b1f9b">
            { js: """var square = document.querySelector('#js-square');
                      var extremeInElasticOutEasing = mojs.easing.path('M0,100 C50,100 50,100 50,50 C50,-15.815625 53.7148438,-19.1218754 60.4981394,0 C62.2625924,4.97393188 66.4286578,6.07928485 68.3303467,0 C71.3633751,-6.23011049 74.5489919,-1.10166123 75.7012545,0 C79.6946191,3.60945678 84.2063904,-0.104182975 84.2063905,0 C87.5409362,-2.25875668 90.4589294,-0.0327241098 93.4950242,0 C97.3271182,0.20445262 100,-0.104182352 100,0');

                      new mojs.Tween({
                        repeat:   999,
                        delay:    2000,
                        duration: 1500,
                        onUpdate: function (progress) {
                          var extremeInElasticOutProgress = extremeInElasticOutEasing(progress);
                        square.style.transform = 'scale(' + (1 - (.9*extremeInElasticOutProgress)) + ')';
                        }
                      }).play();
              """
            }
          </CodeSample>

          <em>
            <i>Note</i>: 
            As you can see in the <UniteLink href="/app/pages/tutorials/easing/path-easing/files/bouncy-easing.svg">.svg file</UniteLink>, by default <span className="highlight">mo· js</span> expects you to draw your easing paths in a 100x100 rectangle, but
            you can change that with a special option, which we'll cover a little later
            in the <span className="highlight">options</span> section of this tutorial.
          </em>
          
          <p>
            Imagine the amount of
            freedom <span className="highlight">path easing</span> can give you
            and how comprehensive your easing functions can now be.
            <br />
            Nonetheless, <span className="highlight">it has much more powerfull purposes</span>, so keep reading!
          </p>

          <h2>Property curves</h2>
          
          <h3>Getting acquainted with property curves</h3>

          <p>
            If you are familiar with After Effects workflow and have ever worked 
            with <UniteLink link="http://www.schoolofmotion.com/intro-to-animation-curves-in-after-effects/">animation curves</UniteLink> (go watch this video, I'll be waiting on you here) 
            this idea won't be entirely new to you.
            If you haven't - no worries, it is pretty simple but when used attentively, it can change
            the way you create your animations!
          </p>

          <p>
            Let me try to express the idea of property curves in one sentence:
          </p>

          <Cite className="is-no-author">
            With a property curve we can specify (or draw)
            how a certain property behaves over time.
          </Cite>

          <p>
            Yes exactly. We can draw for instance how a translate or scale (or any other)
            property will act on progress change. To describe it more verbosely consider
            the next use case.
          </p>

          <p>
            We have our square, but now it starts at very bottom - then jumps up with squash & stretch motion.
            Just like this:
          </p>

          <HeftyContent className="is-full-width">
            <Pen pen="c7b99f1a216498818cbb9f0c881fc542"></Pen>
          </HeftyContent>

          <p>
            As you may have guessed, this motion will be composed with 2 <span className="highlight">property curves</span>.
            The first one for <span className="highlight">y</span> position 
            or the <span className="highlight">translateY</span> property,
            the second one is for the <span className="highlight">scale</span> property to describe 
            squash & stretch effect.
          </p>

          <p>
            The first <span className="highlight">translateY</span> property curve 
            will look like this:
          </p>

          <EasingObjectGraph
            duration={ 1000 }
            onUpdate = { (o)->
              shift = -180*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
              "translateY( #{shift.toFixed(0)} px )"
            }
            label="translateY"
            background="#F1E2D7"
            path="M0,100 L25,99.9999983 C34.6815219,20.073713 40.852195,-3.12132897e-09 100,0">
            
            <div className="path-easing-rectangle path-easing-rectangle--jump"></div>
          
          </EasingObjectGraph>

          <p>
            The delay at the very start was made to give some time for the initial squash
            property curve to act. So it waits some time and then grows to 1 with
            something that looks like exponential-out easing. Don't be fooled by the fact that it looks
            like easing -- yes it starts at 0 and ends at
            1 <span className="highlight">y</span>. My intention was
            to describe how the <span className="highlight">translateY</span> property 
            will act over time, consider the next example for
            a better understanding of what I mean.
          </p>

          <p>
            The second, <span className="highlight">scale</span> property curve 
            will look like this:
          </p>

          <EasingObjectGraph
            duration={ 1000 }
            onUpdate = { (o)->
              squashP = 2*o.easedP[0]
              scaleX = 1-squashP; scaleY = 1+squashP
              mojs.h.style o.objEl, 'transform', "scaleX(#{scaleX}) scaleY(#{scaleY}) translateZ(0)"
              "scaleX( #{scaleX.toFixed(2)} ) scaleY( #{scaleY.toFixed(2)} )"
            }
            label="translateY"
            background="#F1E2D7"
            path="M0,100.004963 C0,100.004963 25,147.596355 25,100.004961 C25,70.7741867 32.2461944,85.3230873 58.484375,94.8579105 C68.9280825,98.6531013 83.2611815,99.9999999 100,100">
            
            <div className="path-easing-rectangle path-easing-rectangle--jump"></div>
          
          </EasingObjectGraph>

          <p>
            The <span className="highlight">scale</span> property 
            curve represents the deviation from <span className="highlight">0</span>.
            We can set <span className="highlight">scaleY</span>&nbsp;
            as <span className="highlight">1 + curve progress</span>&nbsp;
            and <span className="highlight">scaleX</span> as <span className="highlight">1 - curve progress</span>&nbsp;
            to imitate the desired effect.

            While the <span className="highlight">translateY</span> curve is in a passive state
            at the beginning, this curve goes
            under <span className="highlight">0</span>, imitating a squash motion, and showing
            that our rectangle accumulates some power for the subsequent jump. When 
            the first curve starts to 
            lift our rectangle in the air, this curve goes 
            over <span className="highlight">0</span>, imitating the stretch that object
            will experience when accelerating. At the end, this curve returns
            back to <span className="highlight">0</span> showing 
            that there is no speed left in the movement.
          </p>

          <p>
            You may notice that now it doesn't starts at 0 and end at
            1 <span className="highlight">y</span>. In 
            fact <span className="highlight">property curves</span> can use
            any <span className="highlight">y</span> value you want. They must obey
            one law for the <span className="highlight">x</span> value though -
            start at 0 and end at 1 <span className="highlight">x</span>, 
            as it represents the progress from start (0) to finish (1).
          </p>

          <p>
            This is how our two property curves work together:
          </p>

          <EasingObjectGraph
            duration={ 1000 }
            isIt = { true }
            onUpdate = { (o)->
              squashP = 2*o.easedP[0]
              translateP = -180*o.easedP[1]
              scaleX = 1-squashP; scaleY = 1+squashP
              mojs.h.style o.objEl, 'transform', "translateY(#{translateP}px) scaleX(#{scaleX}) scaleY(#{scaleY}) translateZ(0)"
              "translateY(#{(translateP).toFixed(2)}px) scaleX( #{scaleX.toFixed(2)} ) scaleY( #{scaleY.toFixed(2)} )"
            }
            label={['scale', 'translateY']}
            background="#F1E2D7"
            path={['M0,100.004963 C0,100.004963 25,147.596355 25,100.004961 C25,70.7741867 32.2461944,85.3230873 58.484375,94.8579105 C68.9280825,98.6531013 83.2611815,99.9999999 100,100', 'M0,100 L25,99.9999983 C34.6815219,20.073713 40.852195,-3.12132897e-09 100,0' ]}>
            
            <div className="path-easing-rectangle path-easing-rectangle--jump"></div>
          
          </EasingObjectGraph>

          <CodeSample pen="c7b99f1a216498818cbb9f0c881fc542">
            { js: """var square = document.querySelector('#js-square'),
                          translateCurve = mojs.easing.path('M0,100 L25,99.9999983 C26.2328835,75.0708847 19.7847843,0 100,0'),
                          squashCurve = mojs.easing.path('M0,100.004963 C0,100.004963 25,147.596355 25,100.004961 C25,70.7741867 32.2461944,85.3230873 58.484375,94.8579105 C68.9280825,98.6531013 83.2611815,99.9999999 100,100');

                      new mojs.Tween({
                        repeat:   999,
                        delay:    2000,
                        duration: 1000,
                        onUpdate: function (progress) {
                          var translateProgress = translateCurve(progress),
                              squashProgress = squashCurve(progress),
                              scaleX = 1 - 2*squashProgress,
                              scaleY = 1 + 2*squashProgress;
                          
                          square.style.transform = 
                            'translateY(' + -180*translateProgress + 'px) '+
                            'scaleX(' + scaleX + ') ' + 'scaleY(' + scaleY + ')';
                        }
                      }).play();


              """
            }
          </CodeSample>

          <p>
            Pretty neat, huh? Property curves allow us to visually describe how certain properties
            behave over time. We can compose them simultaneously to get our final motion.
            Yep it takes some time to wrap your head around this concept, but when you
            have used it a few times, it feels very intuitive and you finally
            start to see the truth.
          </p>

          <p>
            "We can use 5 common tweens here instead of these property curves." - one could say
            and would be right. We can use 5 tweens instead of two property curves.
            One, delayed, for translateY property and four for squash & strech motion
            (two for squash and two for stretch). But there are few problems with this.
            Even if we don't acknowledge the amount of code that would require, these 5 tweens
            would need to be precisely
            timed to get the same eventual motion. All of the
            little timing nuances would need to be kept in your head while you are coding. Ugh.
            Also maintaining such a chain of tweens would be annoying.
            By contrast, property curves are much more intuitive and convenient way
            to correlate property changes with time.
            Maintaining a property curve wouldn't be much harder than
            maintaining one clean svg file.
          </p>

          <h3>More complex property curves</h3>

          <p>
            Consider the next more complex example, where the a tween animation is could not compete.
            Splitting motion like this in to several tweens would be a nightmare to manage.
            It will also consist of two property curves just like the previous example 
            but it will have much more advanced curves so don't freak out, they are 
            so complicated only for demonstration purposes.
          </p>

          <p>
            Lets get out our first custom easing function with bouncy easing:
          </p>

          <EasingObjectGraph
            duration={ 1500 }
            onUpdate = { (o)->
              shift = 180*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
              "#{shift.toFixed(0)} px"
            }
            label="translateY"
            background="#F1E2D7"
            path="M0,100 C6.50461245,96.8525391 12.6278439,88.3497543 16.6678547,0 C16.6678547,-1.79459817 31.6478577,115.871587 44.1008572,0 C44.1008572,-0.762447191 54.8688736,57.613472 63.0182497,0 C63.0182497,-0.96434046 70.1500549,29.0348701 76.4643231,0 C76.4643231,0 81.9085007,16.5050125 85.8902733,0 C85.8902733,-0.762447191 89.4362183,8.93311024 92.132216,0 C92.132216,-0.156767385 95.0157166,4.59766248 96.918051,0 C96.918051,-0.156767385 98.7040751,1.93815588 100,0">
            
            <div className="path-easing-rectangle"></div>
          
          </EasingObjectGraph>

          <p>
            We can insert inactive periods between the bounces
            to make some room for squash motion:
          </p>

          <EasingObjectGraph
            duration={ 1500 }
            onUpdate = { (o)->
              shift = 180*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
              "#{shift.toFixed(0)} px"
            }
            label="translateY"
            background="#F1E2D7"
            path="M0,100 C4.09332506,96.8557232 7.94664867,88.3615401 10.4890103,0.101163189 L21.0369247,0.0529570347 C21.0369247,-1.65137514 30.4637771,115.895775 38.3003969,0.121056532 L46.9324469,0.201100531 C46.9324469,-0.645830728 53.708714,57.6710335 58.8370818,0.108432613 L64.7902198,0.101163189 C64.7902198,-0.884162099 69.2782346,29.0847003 73.2517768,0.0563486783 L77.4798577,0.0566611047 C77.4798577,0.0345576664 80.9058556,16.5228732 83.4115682,0.0345576664 L86.3881372,0.0345576664 C86.5206567,-0.645437439 88.7521049,9.04031166 90.4486848,0.0730637537 L92.4781637,0.0726514455 C92.6134623,-0.122912361 94.428037,4.62670777 95.6251679,0.0336964333 L97.1134524,0.0262594354 C97.1134524,0.00758931351 98.2373898,1.95224833 99.0529099,0.00758931351 L100,0">
            
            <div className="path-easing-rectangle"></div>
          
          </EasingObjectGraph>


          <p>
            That's our <span className="highlight">translateY</span> property curve, 
            lets sketch the <span className="highlight">scale</span> one now:
          </p>

          <EasingObjectGraph
            duration={ 2500 }
            onUpdate = { (o)->
              scaleX = 1+1.5*o.easedP[0]
              scaleY = 1-1.5*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "scaleX(#{scaleX}) scaleY(#{scaleY}) translateZ(0)"
              ""
            }
            label="scale"
            background="#F1E2D7"
            path="M0,100 C7.81150159,99.8552004 10.5,124.956388 10.5,124.956388 C10.6364142,-0.167048257 20.7999985,99.8575387 20.8,99.8575415 C20.8000015,99.8575443 26.8367187,138.182953 30.6039062,99.857543 C36.3236123,99.9221201 38.1,118.97564 38.1,118.97564 C38.2039989,23.5845053 46.8999988,99.923904 46.9,99.9239062 C46.9000012,99.9239083 50.8279858,129.142288 53.7,99.923906 C57.6148517,99.9884282 58.9,113.065132 58.9,113.065132 C58.9711335,47.8192476 64.7999992,99.989649 64.8,99.9896504 C64.8000008,99.9896519 67.4706109,119.974518 69.4350189,99.9896506 C72.3313246,100.046231 73.2,109.611947 73.2,109.611947 C73.2519882,61.9267379 77.3999994,100.047123 77.4,100.047124 C77.4000006,100.047125 79.4204624,114.653142 80.8561577,100.047124 C82.8367206,100.021884 83.3999999,106.746427 83.3999999,106.746427 C83.4364957,73.2713076 86.4999995,100.02251 86.4999999,100.022511 C86.5000003,100.022512 87.6948194,110.275967 88.7026805,100.022511 C90.1283952,100.031273 90.5289739,104.813463 90.5289739,104.813463 C90.5549281,81.0074753 92.3999997,100.031718 92.4,100.031719 C92.4000003,100.031719 93.5948603,107.323512 94.3116055,100.031719 C95.2672636,99.9339509 95.7,103.132754 95.7,103.132754 C95.7175753,87.0120996 97.0999998,99.9342524 97.1,99.9342527 C97.1000002,99.9342531 97.6146431,104.872022 98.1,100 L100,100">
            
            <div className="path-easing-rectangle path-easing-rectangle--jump"></div>
          
          </EasingObjectGraph>

          <p>
            Don't freak out, it is actually an easy one. If you take some time, you
            may notice that the pattern is repetitive. On every translateY period,
            we have according squash & streatch period which then recurs over and over.
            One such period period looks like this:
          </p>

          <EasingGraph
            className = "fly-g"
            label     = {['translateY','scale']}
            path      = {['M0,100 C4.09332506,96.8557232 7.94664867,88.3615401 10.4890103,0.101163189 L21.0369247,0.0529570347 C21.0369247,-1.65137514 30.4637771,115.895775 38.3003969,0.121056532 L46.9324469,0.201100531 C46.9324469,-0.645830728 53.708714,57.6710335 58.8370818,0.108432613 L64.7902198,0.101163189 C64.7902198,-0.884162099 69.2782346,29.0847003 73.2517768,0.0563486783 L77.4798577,0.0566611047 C77.4798577,0.0345576664 80.9058556,16.5228732 83.4115682,0.0345576664 L86.3881372,0.0345576664 C86.5206567,-0.645437439 88.7521049,9.04031166 90.4486848,0.0730637537 L92.4781637,0.0726514455 C92.6134623,-0.122912361 94.428037,4.62670777 95.6251679,0.0336964333 L97.1134524,0.0262594354 C97.1134524,0.00758931351 98.2373898,1.95224833 99.0529099,0.00758931351 L100,0', 'M0,100 C7.81150159,99.8552004 10.5,124.956388 10.5,124.956388 C10.6364142,-0.167048257 20.7999985,99.8575387 20.8,99.8575415 C20.8000015,99.8575443 26.8367187,138.182953 30.6039062,99.857543 C36.3236123,99.9221201 38.1,118.97564 38.1,118.97564 C38.2039989,23.5845053 46.8999988,99.923904 46.9,99.9239062 C46.9000012,99.9239083 50.8279858,129.142288 53.7,99.923906 C57.6148517,99.9884282 58.9,113.065132 58.9,113.065132 C58.9711335,47.8192476 64.7999992,99.989649 64.8,99.9896504 C64.8000008,99.9896519 67.4706109,119.974518 69.4350189,99.9896506 C72.3313246,100.046231 73.2,109.611947 73.2,109.611947 C73.2519882,61.9267379 77.3999994,100.047123 77.4,100.047124 C77.4000006,100.047125 79.4204624,114.653142 80.8561577,100.047124 C82.8367206,100.021884 83.3999999,106.746427 83.3999999,106.746427 C83.4364957,73.2713076 86.4999995,100.02251 86.4999999,100.022511 C86.5000003,100.022512 87.6948194,110.275967 88.7026805,100.022511 C90.1283952,100.031273 90.5289739,104.813463 90.5289739,104.813463 C90.5549281,81.0074753 92.3999997,100.031718 92.4,100.031719 C92.4000003,100.031719 93.5948603,107.323512 94.3116055,100.031719 C95.2672636,99.9339509 95.7,103.132754 95.7,103.132754 C95.7175753,87.0120996 97.0999998,99.9342524 97.1,99.9342527 C97.1000002,99.9342531 97.6146431,104.872022 98.1,100 L100,100']} >
            <div className="path-easing-tutorial__repeatative"></div>
          </EasingGraph>

          <p>
            Now we can compose out two property curves to get our motion:
          </p>

          <EasingObjectGraph
            duration={ 1500 }
            onUpdate = { (o)->
              translateP = o.easedP[1]
              scaleX = 1 + 1.5*o.easedP[0]
              scaleY = 1 - 1.5*o.easedP[0]
              mojs.h.style o.objEl, 'transform', "translateY(#{180*translateP}px) scaleX(#{scaleX}) scaleY(#{scaleY}) translateZ(0)"
              null
            }
            label={['scale', 'translateY']}
            background="#F1E2D7"
            path={["M0,100 C7.81150159,99.8552004 10.5,124.956388 10.5,124.956388 C10.6364142,-0.167048257 20.7999985,99.8575387 20.8,99.8575415 C20.8000015,99.8575443 26.8367187,138.182953 30.6039062,99.857543 C36.3236123,99.9221201 38.1,118.97564 38.1,118.97564 C38.2039989,23.5845053 46.8999988,99.923904 46.9,99.9239062 C46.9000012,99.9239083 50.8279858,129.142288 53.7,99.923906 C57.6148517,99.9884282 58.9,113.065132 58.9,113.065132 C58.9711335,47.8192476 64.7999992,99.989649 64.8,99.9896504 C64.8000008,99.9896519 67.4706109,119.974518 69.4350189,99.9896506 C72.3313246,100.046231 73.2,109.611947 73.2,109.611947 C73.2519882,61.9267379 77.3999994,100.047123 77.4,100.047124 C77.4000006,100.047125 79.4204624,114.653142 80.8561577,100.047124 C82.8367206,100.021884 83.3999999,106.746427 83.3999999,106.746427 C83.4364957,73.2713076 86.4999995,100.02251 86.4999999,100.022511 C86.5000003,100.022512 87.6948194,110.275967 88.7026805,100.022511 C90.1283952,100.031273 90.5289739,104.813463 90.5289739,104.813463 C90.5549281,81.0074753 92.3999997,100.031718 92.4,100.031719 C92.4000003,100.031719 93.5948603,107.323512 94.3116055,100.031719 C95.2672636,99.9339509 95.7,103.132754 95.7,103.132754 C95.7175753,87.0120996 97.0999998,99.9342524 97.1,99.9342527 C97.1000002,99.9342531 97.6146431,104.872022 98.1,100 L100,100", 'M0,100 C4.09332506,96.8557232 7.94664867,88.3615401 10.4890103,0.101163189 L21.0369247,0.0529570347 C21.0369247,-1.65137514 30.4637771,115.895775 38.3003969,0.121056532 L46.9324469,0.201100531 C46.9324469,-0.645830728 53.708714,57.6710335 58.8370818,0.108432613 L64.7902198,0.101163189 C64.7902198,-0.884162099 69.2782346,29.0847003 73.2517768,0.0563486783 L77.4798577,0.0566611047 C77.4798577,0.0345576664 80.9058556,16.5228732 83.4115682,0.0345576664 L86.3881372,0.0345576664 C86.5206567,-0.645437439 88.7521049,9.04031166 90.4486848,0.0730637537 L92.4781637,0.0726514455 C92.6134623,-0.122912361 94.428037,4.62670777 95.6251679,0.0336964333 L97.1134524,0.0262594354 C97.1134524,0.00758931351 98.2373898,1.95224833 99.0529099,0.00758931351 L100,0']}>
            
            <div className="path-easing-rectangle path-easing-rectangle--paused-jump"></div>
          
          </EasingObjectGraph>

          <div className="post__reverse-block post__center-text">
            <em>
              <UniteLink link="http://codepen.io/sol0mka/pen/4f0dea6316d301d5ab55beab17021209">codepen</UniteLink> for the graph above.
            </em>
          </div>

          <p>
            Whoo! This one is cute!
            <br />
            Imagine if you had to write a tween for every cube's movement.
            I can't.
            <br />
            <span className="highlight">Property curves</span> save us a lot of 
            time and effort. They will bring our work to a whole new level by allowing
            us to intuitively and visually describe our motion intention.
          </p>

          <h2>Thinking in property curves</h2>

          <p>
            Ok, now you have a little clue as to what the heck property curves are, and are hopefully
            convinced that they might be useful. This section will 
            help you to gain some skills in how and when to use them. Generally, we can use curves for 
            <UniteLink link="https://vimeo.com/111574737">lots of different purposes</UniteLink>, 
            but here we will talk with you about how to think in curves when you want to move an object
            on screen or transform it from one state to another.
          </p>

          <p>
            Consider the <UniteLink link="http://codepen.io/sol0mka/full/477056cb1ffe88c4bfbf8a3005d99496/">final demo</UniteLink>, particularly the
            part where mole deviates slightly back to inhale some air and then bends forward swiftly with his tongue out:
          </p>

          <Vimeo id="137677120" name="Inhale" />

          <p>
            We can describe the swinging motion with the next property curve
            for the <span className="highlight">skewX</span> property:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              
              @scopeEl ?= document.querySelector '#js-mole-sample-1'
              @moleEl ?= @scopeEl.querySelector '#js-mole'

              mojs.h.style(@moleEl, 'transform', "skewX(#{75*o.easedP[0]}deg) translateZ(0)");

              "skewX(#{(75*o.easedP[0]).toFixed(2)}deg)"
            }

            label="skewX angle"
            background="#50E3C2"
            path="M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100">
            
            <MoleSample id="js-mole-sample-1" />

          </EasingObjectGraph>

          <p className="post__reverse-block">
            <em>Y axis represents skewX angle</em>
          </p>

          <p>
            As you can see, our curve goes <span className="highlight">above 0</span> slightly 
            to implement the backward move then it goes <span className="highlight">below 0</span> to 
            make the forward move. This is the base curve for our scene, we will use
            it more further on. The code:
          </p>

          <CodeSample pen="a7c9ab066b13db760c74bc1536204b61">
            { js: """var moleEl = document.querySelector('#js-mole'),
                          skewEasing = mojs.easing.path('M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100');

                      new mojs.Tween({
                        repeat:   99999,
                        duration: 1800,
                        delay:    2000,
                        onUpdate: function (progress) {
                          var skewProgress = skewEasing(progress);
                          moleEl.style['transform'] = 'skewX(' + 75*skewProgress + 'deg)';
                        }
                      }).play();
              """
            }
          </CodeSample>
          
          <p>
            Our mole moves now, but err... this motion doesn't convey too much information.
            Lets add a secondary action to fulfill our scene.
            We will rise the mole's hand up (by rotating it) very fast when the mole deviates
            backward, so our curve should rise steeply at the beginning. Then, when the
            mole bends forward, we will rotate the hand to a small negative number, so the curve
            goes below zero. After that, when the mole moves to it's start position
            we will change the hand's angle all way up to zero slowly:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              @scopeEl    ?= document.querySelector '#js-mole-sample-2'
              @moleEl     ?= @scopeEl.querySelector '#js-mole'
              @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
              @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
              @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
      
              skewP  = @skewEasing o.p
              angleP = @handAngleEasing o.p

              mojs.h.style(@moleEl, 'transform', "skewX(#{75*skewP}deg) translateZ(0)");

              mojs.h.style(@moleHandEl, 'transform', "rotate(#{-200*angleP}deg) translateZ(0)");
              "rotate(#{(-200*angleP).toFixed(2)}deg)"
            }

            label="hand's angle"
            background="#50E3C2"
            path="M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100">
            
            <MoleSample id="js-mole-sample-2" />

          </EasingObjectGraph>
          
          <p className="post__reverse-block">
            <em>Y axis represents angle of the hand</em>
          </p>
          
          <br />

          <p>There is the full code. Lines 2, 3, 12 and 15 are new:</p>
          <CodeSample pen="95e3300c59686dc1d534d2b38c208ecc">
            { js: """var moleEl          = document.querySelector('#js-mole'),
                          moleHandEl      = document.querySelector('#js-mole-hand'),
                          handAngleEasing = mojs.easing.path('M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'),
                          skewEasing      = mojs.easing.path('M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100');

                      new mojs.Tween({
                        repeat:   99999,
                        duration: 1800,
                        delay:    2000,
                        onUpdate: function (progress) {
                          var skewProgress      = skewEasing(progress),
                              handAngleProgress = handAngleEasing(progress);

                          moleEl.style['transform']     = 'skewX(' + 75*skewProgress + 'deg)';
                          moleHandEl.style['transform'] = 'rotate(' + (-200*handAngleProgress) + 'deg)';
                        }
                      }).play();
              """
            }
          </CodeSample>

          <p>
            Ok that's better. Now lets work on the left hand. 
            Luckily we can use the same 
            <span className="highlight">skew</span> curve for 
            <span className="highlight">translate</span> and <span className="highlight">rotate</span> properties.
            This is highly illustrative example - you will often reuse the same
            curves on a scene:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              @scopeEl    ?= document.querySelector '#js-mole-sample-3'
              @moleEl     ?= @scopeEl.querySelector '#js-mole'
              @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
              @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
              @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
              @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
      
              skewP  = @skewEasing o.p
              angleP = @handAngleEasing o.p

              mojs.h.style(@moleEl,         'transform', "skewX(#{75*skewP}deg) translateZ(0)");
              mojs.h.style(@moleHandEl,     'transform', "rotate(#{-200*angleP}deg) translateZ(0)");
              mojs.h.style(@moleHandLeftEl, 'transform', "translate(#{100*skewP}px, #{-80*skewP}px) rotate(#{-110*skewP}deg) translateZ(0)");

              "translate(#{(100*skewP).toFixed(2)}px, #{(-80*skewP).toFixed(2)}px) rotate(#{(-110*skewP).toFixed(2)}deg)"
            }

            label="left hand's angle"
            background="#50E3C2"
            path="M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100">
            
            <MoleSample id="js-mole-sample-3" />

          </EasingObjectGraph>

          <p className="post__reverse-block">
            <em>Y axis represents angle and translation of the left hand</em>
          </p>
          
          <br />
          
          <p>The full code. Lines 3 and 18 are new:</p>

          <CodeSample pen="f9b5528666780ef4e26e83fba7e4a4bb">
            { js: """var moleEl          = document.querySelector('#js-mole'),
                          moleHandEl      = document.querySelector('#js-mole-hand'),
                          moleHandLeftEl  = document.querySelector('#js-mole-hand-left'),
                          
                          handAngleEasing = mojs.easing.path('M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'),
                          skewEasing      = mojs.easing.path('M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100');

                      new mojs.Tween({
                        repeat:   99999,
                        duration: 1800,
                        delay:    2000,
                        onUpdate: function (progress) {
                          var skewProgress      = skewEasing(progress),
                              handAngleProgress = handAngleEasing(progress);
                          
                          moleEl.style['transform']     = 'skewX(' + 75*skewProgress + 'deg)';
                          moleHandEl.style['transform'] = 'rotate(' + (-200*handAngleProgress) + 'deg)';
                          moleHandLeftEl.style['transform'] = 'translate(' + (100*skewProgress) + 'px,' + (-80*skewProgress) + 'px) rotate(' + (-110*skewProgress) + 'deg)';
                        }
                      }).play();
              """
            }
          </CodeSample>

          <p>
            We will continue working on secondary actions step by step to make our scene
            comprehensive. 
            It is the mouth's turn now.
            To implement mouth motion we need to scale it 
            up <span className="highlight">above 1</span> to convey the inhale and then scale it down to
            about <span className="highlight">.3</span> to convey the exhale:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              @scopeEl    ?= document.querySelector '#js-mole-sample-4'
              @moleEl     ?= @scopeEl.querySelector '#js-mole'
              @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
              @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
              @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'
              

              @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
              @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
              @mouthEasing ?= mojs.easing.path 'M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934'
      
              skewP  = @skewEasing o.p
              angleP = @handAngleEasing o.p
              mouthP = @mouthEasing o.p

              mojs.h.style(@moleEl,         'transform', "skewX(#{75*skewP}deg) translateZ(0)");
              mojs.h.style(@moleHandEl,     'transform', "rotate(#{-200*angleP}deg) translateZ(0)");
              mojs.h.style(@moleHandLeftEl, 'transform', "translate(#{100*skewP}px, #{-80*skewP}px) rotate(#{-110*skewP}deg) translateZ(0)");

              mojs.h.style(@mouthEl, 'transform', "scale(#{mouthP}) translateX(#{-100*skewP}px) translateZ(0)");

              "scale(#{mouthP.toFixed(2)}) translateX(#{(-100*skewP).toFixed(2)}px)"
            }

            label="mouth's scale"
            background="#50E3C2"
            path="M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934">
            
            <MoleSample id="js-mole-sample-4" />

          </EasingObjectGraph>

          <p className="post__reverse-block">
            <em>Y axis represents scale of the mouth</em>
          </p>
          
          <br />
          
          <p>The full code. Lines 4, 8 and 22 are new:</p>

          <CodeSample pen="8d52f3b9b4f35d80cf72bf4dce24276d">
            { js: """var moleEl          = document.querySelector('#js-mole'),
                        moleHandEl      = document.querySelector('#js-mole-hand'),
                        moleHandLeftEl  = document.querySelector('#js-mole-hand-left'),
                        mouthEl         = document.querySelector('#js-mole-mouth'),
                        
                        handAngleEasing = mojs.easing.path('M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'),
                        skewEasing      = mojs.easing.path('M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'),
                        mouthEasing     = mojs.easing.path('M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934');

                    new mojs.Tween({
                      repeat:   99999,
                      duration: 1800,
                      delay:    2000,
                      onUpdate: function (progress) {
                        var skewProgress      = skewEasing(progress),
                            handAngleProgress = handAngleEasing(progress),
                            mouthProgress     = mouthEasing(progress);
                        
                        moleEl.style['transform']         = 'skewX(' + 75*skewProgress + 'deg)';
                        moleHandEl.style['transform']     = 'rotate(' + (-200*handAngleProgress) + 'deg)';
                        moleHandLeftEl.style['transform'] = 'translate(' + (100*skewProgress) + 'px,' + (-80*skewProgress) + 'px) rotate(' + (-110*skewProgress) + 'deg)';
                        mouthEl.style['transform']        = 'scale(' + mouthProgress + ') translateX(' + (-100*skewProgress) + 'px)';
                      }
                    }).play();
              """
            }
          </CodeSample>

          <p>
            As you may notice, we've added some motion to the mouth's 
            <span className="highlight">translateX</span> property 
            by reusing the base <span className="highlight">skew</span> curve again. 
            It adds a kind of cartoony feel to the movement.
          </p>

          <p>
            Ok cool. Lets add tongue's motion. We need to wrap it with 
            a <span className="highlight">overflow: hidden;</span> wrapper,
            then apply the very first basic <span className="highlight">skew</span> curve 
            for the <span className="highlight">translateX</span> property:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              @scopeEl    ?= document.querySelector '#js-mole-sample-8'
              @tongueEl   ?= @scopeEl.querySelector '#js-sample-tongue'

              mojs.h.style(@tongueEl, 'transform', "translateX(#{-550*o.easedP[0]}px) translateZ(0)")
              
              "translateX(#{(-550*o.easedP[0]).toFixed(2)}px)"
            }

            label="tongue's translateX"
            background="#50E3C2"
            path="M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100">
            
            <div className="mole-tongue-example" id="js-mole-sample-8">
              <div className="mole-tongue-example__tongue" id="js-sample-tongue">
                <svg viewBox="0 0 60 60">
                  <path id="js-mole-tongue-path" d="M0 30 Q 20 10, 30 25 T 50 30" stroke="#C95549" fill="none" strokeWidth="18" strokeLinecap="round" />
                </svg>
              </div>
            </div>

          </EasingObjectGraph>

          <p className="post__reverse-block">
            <em>Y axis represents tranlateX of the tongue</em>
          </p>

          <p>
            Pretty simple and neat. Now we can add <span className="highlight">noize</span> curve to imitate 
            tongue's wiggle:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              @scopeEl      ?= document.querySelector '#js-mole-sample-9'
              @tongueEl     ?= @scopeEl.querySelector '#js-sample-tongue'
              @tonguePathEl ?= @scopeEl.querySelector '#js-mole-tongue-path'

              @skewEasing   ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'

              skewP = @skewEasing o.p

              mojs.h.style(@tongueEl, 'transform', "translateX(#{-550*skewP}px)")
              @tonguePathEl.setAttribute('d', "M0 30 Q 20 #{10+(550*o.easedP[0])}, 30 25 T 50 30");
              
              "M0 30 Q 20 #{(10+(550*o.easedP[0])).toFixed(2)}, 30 25 T 50 30"
            }

            label="path's d attribute"
            background="#50E3C2"
            path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
            
            <div className="mole-tongue-example" id="js-mole-sample-9">
              <div className="mole-tongue-example__tongue" id="js-sample-tongue">
                <svg viewBox="0 0 60 60">
                  <path id="js-mole-tongue-path" d="M0 30 Q 20 10, 30 25 T 50 30" stroke="#C95549" fill="none" strokeWidth="18" strokeLinecap="round" />
                </svg>
              </div>
            </div>

          </EasingObjectGraph>

          <p className="post__reverse-block">
            <em>Y axis represents Y position of the quadratic Bezier curve's handle of the tongue's path</em>
          </p>

          <p>
            We will reuse this noise curve shortly.
            Meanwhile let's add the tongue to the entire scene:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              @scopeEl    ?= document.querySelector '#js-mole-sample-10'
              @moleEl     ?= @scopeEl.querySelector '#js-mole'
              @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
              @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
              @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'

              @tongueEl     ?= @scopeEl.querySelector '#js-mole-tongue'
              @tonguePathEl ?= @scopeEl.querySelector '#js-mole-tongue-path'
              
              @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
              @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
              @mouthEasing ?= mojs.easing.path 'M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934'
              @noizeEasing ?= mojs.easing.path 'M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100'
      
              skewP  = @skewEasing o.p
              angleP = @handAngleEasing o.p
              mouthP = @mouthEasing o.p
              noizeP = @noizeEasing o.p

              mojs.h.style(@moleEl,         'transform', "skewX(#{75*skewP}deg) translateZ(0)");

              mojs.h.style(@moleHandEl,     'transform', "rotate(#{-200*angleP}deg) translateZ(0)");
              mojs.h.style(@moleHandLeftEl, 'transform', "translate(#{100*skewP}px, #{-80*skewP}px) rotate(#{-110*skewP}deg) translateZ(0)");

              mojs.h.style(@mouthEl, 'transform', "scale(#{mouthP}) translateX(#{-100*skewP}px) translateZ(0)");

              mojs.h.style(@tongueEl, 'transform', "translateX(#{-140*skewP}px)")
              @tonguePathEl.setAttribute('d', "M0 30 Q 20 #{10+(550*noizeP)}, 30 25 T 50 30");
              
              "M0 30 Q 20 #{(10+(550*noizeP)).toFixed(2)}, 30 25 T 50 30"
            }

            label="path's d attribute"
            background="#50E3C2"
            path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
            
            <MoleSample id="js-mole-sample-10" />

          </EasingObjectGraph>


          <p className="post__reverse-block post__center-text">
            <em>
              <UniteLink link="http://codepen.io/sol0mka/pen/755a7ebc62c89d16b3208b2996a49f1e">codepen</UniteLink> for the graph above (lines 27, 28 on javascript tab).
            </em>
          </p>


          <p>
            Few touches left. We see how the mole blows air from his mouth, but his effort
            should be emphasized by adding some twitching to the mole's entire body. Luckily
            we already have our <span className="highlight">noise</span> curve to use here.
            We need add it as a coefficient to all small parts to make them twitch and wiggle:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)->
              @scopeEl    ?= document.querySelector '#js-mole-sample-12'
              @moleEl     ?= @scopeEl.querySelector '#js-mole'
              @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
              @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
              @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'
              @coneEl     ?= @scopeEl.querySelector '#js-mole-hat-cone'
              @glassesEl  ?= @scopeEl.querySelector '#js-mole-glasses'
              @glassesLeftEl ?= @scopeEl.querySelector '#js-mole-glasses-left'
              @moleEyeEl ?= @scopeEl.querySelector('#js-mole-eye')
              @moleEyeLashEl ?= @scopeEl.querySelector('#js-mole-eye-lash')

              @tongueEl     ?= @scopeEl.querySelector '#js-mole-tongue'
              @tonguePathEl ?= @scopeEl.querySelector '#js-mole-tongue-path'
              
              @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
              @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
              @mouthEasing ?= mojs.easing.path 'M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934'
              @noizeEasing ?= mojs.easing.path 'M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100'

              @squintEasing ?= mojs.easing.mix({ to: .25, value: 1 }, { to: 1, value: 'cubic.in' });
      
              skewP  = @skewEasing o.p
              angleP = @handAngleEasing o.p
              mouthP = @mouthEasing o.p
              noizeP = @noizeEasing o.p

              squintP = @squintEasing o.p
              n_squintP = 1-squintP

              mojs.h.style(@moleEl,         'transform', "skewX(#{75*skewP-(5*noizeP)}deg) skewY(#{15*noizeP}deg) translateZ(0)");

              mojs.h.style(@moleHandEl,     'transform', "rotate(#{-200*angleP + 30*noizeP}deg) translateZ(0)");
              mojs.h.style(@moleHandLeftEl, 'transform', "translate(#{100*skewP}px, #{-80*skewP}px) rotate(#{-110*skewP}deg) translateZ(0)");

              mojs.h.style(@mouthEl, 'transform', "scale(#{mouthP - 3*noizeP}) translateX(#{-100*skewP}px) translateZ(0)");

              mojs.h.style(@glassesEl, 'transform', "translateY(#{-15*noizeP}px)");
              mojs.h.style(@glassesLeftEl, 'transform', "translateY(#{-15*noizeP}px)");
              mojs.h.style(@coneEl, 'transform', "rotateZ(#{-20*noizeP}deg)");

              this.moleEyeLashEl.setAttribute('d', "M0,0 Q 6.5 #{10*squintP}, 13 0");
              this.moleEyeLashEl.setAttribute('stroke-width', 2 + 1.5*n_squintP);
              mojs.h.style(this.moleEyeEl, 'transform', "rotate(#{37*n_squintP}deg) translate(#{7*n_squintP}px, #{-4*n_squintP}px) scaleX(#{1-.4*n_squintP})");

              mojs.h.style(@tongueEl, 'transform', "translateX(#{-140*skewP}px)")
              @tonguePathEl.setAttribute('d', "M0 30 Q 20 #{10+(550*noizeP)}, 30 25 T 50 30");
              
              "M0 30 Q 20 #{(10+(550*noizeP)).toFixed(2)}, 30 25 T 50 30"
            }

            label="path's d attribute"
            background="#50E3C2"
            path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
            
            <MoleSample id="js-mole-sample-12" />

          </EasingObjectGraph>

          <p className="post__reverse-block post__center-text">
            <em>
              <UniteLink link="http://codepen.io/sol0mka/pen/8ed8b12cd586ff74c0ba67956242dcfa">codepen</UniteLink> for the graph above (notice how noizeProgress was added to lines 26, 27 , 29, 30, 31, 32 on javascript tab).
            </em>
          </p>

          <p>
            The last touch would be to add saliva with a <span className="highlight">Burst</span> module.
            In short, this module type allows us to generate various effects in declarative way.
            We will look at it in detail in a dedicated tutorial. This is our entire scene
            with saliva added:
          </p>

          <EasingObjectGraph
            duration = { 1800 }
            onUpdate = { (o)=>
              @scopeEl    ?= document.querySelector '#js-mole-sample-11'
              @moleEl     ?= @scopeEl.querySelector '#js-mole'
              @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
              @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
              @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'
              @coneEl     ?= @scopeEl.querySelector '#js-mole-hat-cone'
              @glassesEl  ?= @scopeEl.querySelector '#js-mole-glasses'
              @glassesLeftEl ?= @scopeEl.querySelector '#js-mole-glasses-left'
              @moleEyeEl ?= @scopeEl.querySelector('#js-mole-eye')
              @moleEyeLashEl ?= @scopeEl.querySelector('#js-mole-eye-lash')

              if !@burst?
                @burst = new mojs.Burst({
                  parent:       @moleEl,
                  type:         'circle',
                  fill:         'white',
                  duration:     1800,
                  x: 145,       y: 105,
                  delay:        "stagger(#{(1800/4)}, rand(50, 100))",
                  degree:       0,
                  angle:        {75: 150},
                  isSwirl:      true,
                  randomRadius: .75,
                  radius:       {0:150},
                  count:        16,
                  isRunLess:    true,
                  isForce3d: false,
                  childOptions: {
                    radius:     { 'rand(.5,2)' : 0},
                    duration:   300
                  }
                });

                @burst.el.style['z-index'] = 10;

              @burst.timeline.setProgress o.p

              @tongueEl     ?= @scopeEl.querySelector '#js-mole-tongue'
              @tonguePathEl ?= @scopeEl.querySelector '#js-mole-tongue-path'
              
              @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
              @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
              @mouthEasing ?= mojs.easing.path 'M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934'
              @noizeEasing ?= mojs.easing.path 'M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100'

              @squintEasing ?= mojs.easing.mix({ to: .25, value: 1 }, { to: 1, value: 'cubic.in' });
      
              skewP  = @skewEasing o.p
              angleP = @handAngleEasing o.p
              mouthP = @mouthEasing o.p
              noizeP = @noizeEasing o.p

              squintP = @squintEasing o.p
              n_squintP = 1-squintP

              mojs.h.style(@moleEl,         'transform', "skewX(#{75*skewP-(5*noizeP)}deg) skewY(#{15*noizeP}deg) translateZ(0)");

              mojs.h.style(@moleHandEl,     'transform', "rotate(#{-200*angleP + 30*noizeP}deg) translateZ(0)");
              mojs.h.style(@moleHandLeftEl, 'transform', "translate(#{100*skewP}px, #{-80*skewP}px) rotate(#{-110*skewP}deg) translateZ(0)");

              mojs.h.style(@mouthEl, 'transform', "scale(#{mouthP - 3*noizeP}) translateX(#{-100*skewP}px)");

              mojs.h.style(@glassesEl, 'transform', "translateY(#{-15*noizeP}px)");
              mojs.h.style(@glassesLeftEl, 'transform', "translateY(#{-15*noizeP}px)");
              mojs.h.style(@coneEl, 'transform', "rotateZ(#{-20*noizeP}deg) translateZ(0)");

              this.moleEyeLashEl.setAttribute('d', "M0,0 Q 6.5 #{10*squintP}, 13 0");
              this.moleEyeLashEl.setAttribute('stroke-width', 2 + 1.5*n_squintP);
              mojs.h.style(this.moleEyeEl, 'transform', "rotate(#{37*n_squintP}deg) translate(#{7*n_squintP}px, #{-4*n_squintP}px) scaleX(#{1-.4*n_squintP})");

              mojs.h.style(@tongueEl, 'transform', "translateX(#{-140*skewP}px) translateZ(0)")
              @tonguePathEl.setAttribute('d', "M0 30 Q 20 #{10+(550*noizeP)}, 30 25 T 50 30");
              
              "M0 30 Q 20 #{(10+(550*noizeP)).toFixed(2)}, 30 25 T 50 30"
            }

            label="path's d attribute"
            background="#50E3C2"
            path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
            
            <MoleSample id="js-mole-sample-11" />

          </EasingObjectGraph>

          <p className="post__reverse-block post__center-text">
            <em>
              <UniteLink link="http://codepen.io/sol0mka/pen/dbb8241ed1e7eda8c58e850391f9a1a7">codepen</UniteLink> for the graph above (lines 17-37 and 52 on js tab).
            </em>
          </p>

          <em>
            <i>Note</i>:
            For simplicity's sake we have omitted the eye motion in this tutorial.
          </em>

          <p>
            That's basically it. We have used 4 property curves to bring our mole to life. 
            I hope you enjoyed the process. Thinking in curves could be a totally new
            mindset for you, but it will be convenient and intuitive after you've used
            it a few times. So don't forget to get some practice in the appropriate
            section of this tutorial at the end.
          </p>

          <h2>Options</h2>

          <p> 
            When you create an easing path with <span className="highlight">mojs.easing.path</span>, 
            you can pass an object with options just after the path coordinates string, as the 
            second parameter:
          </p>

          <CodeSample>
            { js: """
                      var easing = mojs.easing.path('M0,100 ..', {
                        // options
                        precompute: 1450,  // default, could be in range of 100 - 10000
                        eps:        0.001, // default
                        rect:       100    // default
                      });
              """
            }
          </CodeSample>

          <p>
            To generate an easing function from a SVG path, 
            the <span className="highlight">mo· js</span> will sample
            path's coordinates values. 
            The <span className="highlight">precompute</span> option defines how 
            many samples it should take from the path on initialization stage.
            This value could be in range of <span className="highlight">100 - 10000</span>.
            More samples means your resulting easing function would be more performant
            on runtime, but it will take longer to get all those samples.
          </p>

          <p>
            The <span className="highlight">eps</span> option defines how precise the
            resulting easing function will be. The smaller the <span className="highlight">eps</span> option is, the more precisely
            it will work during the runtime (however it will also run more slowly). If you are using a very large time resolution (long tween duration) and see that your path easing function gives your motion some twitching,
            increase the <span className="highlight">precompute</span> option and decrease
            the <span className="highlight">eps</span> one to solve the issue. 
            In most tough cases a <span className="highlight">precompute</span> of 3000 and an
            <span className="highlight">eps</span> of 0.0001 should be enough.
          </p>

          <p>
            The <span className="highlight">rect</span> option provides the desired
            rectangle size that the easing path is drawn into.
            By default the rectangle 
            is <span className="highlight">100</span> (means 100x100), but you can
            specify any size that works well for you.
          </p>

          <h2>Recap</h2>

          <p>
            Among lots of other easing functions and helpers, 
            <span className="highlight">mo· js</span> has <span className="highlight">path easing</span> that allows you to generate advanced easing functions from SVG 
            path coordinates. To do so the path's data should be sent to 
            the <span className="highlight">mojs.easing.path</span> method, 
            the newly generated easing function will be returned back:
          </p>

          <CodeSample>
            { js: """
                      var easing = mojs.easing.path('M0,100 L100, 0');
                      // .. then
                      var easedProgress = easing(progress);
              """
            }
          </CodeSample>

          <p>
            The <span className="highlight">path easing</span> also allows us to
            generate the <span className="highlight">property curves</span> - 
            much more complex and powerful easing paths, to describe a property
            change in time with a graph.
          </p>

          <p>
            You can also control how fast/precise your custom easing function will be 
            with <span className="highlight">precompute</span> and 
            <span className="highlight">eps</span> options. 
            The <span className="highlight">rect</span> option 
            specifies the rectangle's size that the easing path was drawn in to.
          </p>

          <p>
            It is worth noting that when you draw your easing path, 
            it's <span className="highlight">x</span> values must start at 0 and end at 100 
            (or at <span className="highlight">rect</span> option's value that you have set). 
            This rule comes from the fact that the <span className="highlight">x</span> axis 
            of your path represents <span className="highlight">progress</span> and the 
            progress can't go beyond 100% or before 0%. This restriction is a must only for 
            <span className="highlight">x</span> values and doesn't apply 
            to <span className="highlight">y</span> values of your path which can take
            any value you want.
          </p>

          <h2>Thank you!</h2>

          <p>
            Thanks a lot to you, reader, for the time and effort it took to read this tutorial!
            In the near future we are planning to add a page with a searchable list of path
            easings powered by live examples and graphs.
            Developers will be able to collaborate and share their easing paths and find ones
            that suite their current needs.
            <br />
            Don't forget to do the practice tasks from the next section.
            <br />
            A bunch of great stuff is coming up on other topics also so stay tuned!
          </p>
          <p>
            Big thanks to <UniteLink link="https://twitter.com/rachsmithtweets">Rachel Smith</UniteLink> for 
            help in editing this tutorial!
          </p>

          <br />

          <p style= { textAlign: 'center' }>
            <UniteLink link="http://codepen.io/sol0mka/full/477056cb1ffe88c4bfbf8a3005d99496/">demo on CodePen</UniteLink> | 
            <UniteLink link="https://github.com/legomushroom/property-curves">demo's repo on GitHub</UniteLink> | 
            <UniteLink link="https://github.com/legomushroom/mojs/">mo · js on GitHub</UniteLink>
          </p>

          <More label="Practice" className="is-h2 is-border-bottom">
            <p>
              <em>Note:</em> Animations and curves are representative of an author's motion intention, in fact they
              are always unique - like a human's fingerprint. Thus all of the answers listed in this
              section should be treated as "suggested answer" that the post's author came up with but
              not as a strict law.
            </p>

            <h3>Easing paths</h3>

            <ul className="task-list">
              <li>
                <span>
                  Draw an extreme-ease-in-out easing function (yep I did it in this tutorial), 
                  then generate easing function from it. Make the stick to move 180px right with 
                  this generated easing to get the next result:
                </span>

                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  isGraphLess = { true }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-easing-task-1')
                    translate = 180*o.easedP[0]
                    mojs.h.style(@el, 'transform', "translateX(#{translate}px) translateZ(0)")
                    "translateX( #{translate.toFixed(2)} px)"
                  }

                  label="translateX"
                  background="#F1E2D7"
                  path={["M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-1" id="js-easing-task-1"></div>

                </EasingObjectGraph>

                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/c203d280d0ed70301e623c4034809d24">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/bootstrap-easing-path.svg">bootstrap svg file</UniteLink>
                  </em>
                </p>

                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">
                  <EasingObjectGraph
                    duration = { 3000 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-easing-task-1a')
                      translate = 180*o.easedP[0]
                      mojs.h.style(@el, 'transform', "translateX(#{translate}px) translateZ(0)")
                      "translateX( #{translate.toFixed(2)} px)"
                    }

                    label="translateX"
                    background="#F1E2D7"
                    path={["M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0"]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-1" id="js-easing-task-1a"></div>

                  </EasingObjectGraph>

                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/0c4b6e210d8a66d651c6c24ca853a12d">answer codepen</UniteLink>
                    </em>

                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/easing-task-answer-1.svg">answer svg file</UniteLink>
                    </em>
                  </p>
                  
                  <p>
                    Hopefully you did it well. This easing is a good example of how 
                    you might want to work with user's attention when moving things around. 
                    In the first stage of the curve, we are moving our object very slowly, our
                    message is: "Hey, I'm moving this thing to the right nice and slowly 
                    so it is clear for you what is happening and what is about to happen". 
                    <br />
                    Then we have a very fast curve's motion, the message is:
                    "Hey, you were ready for the movement, so I won't bother you with
                    long animations, I'll just shoot this thing to the place where it 
                    should end".
                    <br />
                    The third curve's stage says: "Ok, that was fast I know, that's hypervelocity.  
                    Everything is operating as expected, docking to the final destination
                    platform".
                  </p>

                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>

              <li>
                <span>
                  Add twitching at the start, to appeal to user's attention before the move:
                </span>

                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  isGraphLess = { true }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-easing-task-2')
                    translate = 180*o.easedP[0]
                    mojs.h.style(@el, 'transform', "translateX(#{translate}px) translateZ(0)")
                    "translateX( #{translate.toFixed(2)} px)"
                  }

                  label="translateX"
                  background="#F1E2D7"
                  path={["M0,100 C1.984375,100 2.70793815,100.073064 4.04394531,100 C4.73828125,98.8152313 5.81738611,94.8017758 5.81738611,94.8017758 L7.85351562,104.587891 L9.27734375,97.2636719 L11.072431,102.959963 L12.4135742,98.8152313 L14.050293,101.364746 L15.6270003,98.81523 L17.1100006,100 C50,99.1317495 50,93.4111819 50,50 C50,0 50,1.73472348e-18 100,0"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-1" id="js-easing-task-2"></div>

                </EasingObjectGraph>

                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/cc90fd896d22164b7d69a165e5b84652">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/easing-task-answer-1.svg">bootstrap svg file</UniteLink>
                  </em>
                </p>

                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">

                  <EasingObjectGraph
                    duration = { 3000 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-easing-task-2a')
                      translate = 180*o.easedP[0]
                      mojs.h.style(@el, 'transform', "translateX(#{translate}px) translateZ(0)")
                      "translateX( #{translate.toFixed(2)} px)"
                    }

                    label="translateX"
                    background="#F1E2D7"
                    path={["M0,100 C1.984375,100 2.70793815,100.073064 4.04394531,100 C4.73828125,98.8152313 5.81738611,94.8017758 5.81738611,94.8017758 L7.85351562,104.587891 L9.27734375,97.2636719 L11.072431,102.959963 L12.4135742,98.8152313 L14.050293,101.364746 L15.6270003,98.81523 L17.1100006,100 C50,99.1317495 50,93.4111819 50,50 C50,0 50,1.73472348e-18 100,0"]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-1" id="js-easing-task-2a"></div>

                  </EasingObjectGraph>

                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/1551ef15264e7e251327db21f0603af9">answer codepen</UniteLink>
                    </em>
                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/easing-task-answer-2.svg">answer svg file</UniteLink>
                    </em>
                  </p>
                  
                  <p>
                    Twitching appeals to the user's attention even before the object going to move.
                    With it you can be sure that user's view is in the right spot just before 
                    the slow-ease-in curve's stage. "Hey, don't you see - I'm calling!"
                  </p>

                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>


              <li>
                <span>
                  Add an "elastic" move at the end, when movement slightly overlaps
                  the final position, then goes backward:
                </span>

                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  isGraphLess = { true }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-easing-task-3')
                    translate = 180*o.easedP[0]
                    mojs.h.style(@el, 'transform', "translateX(#{translate}px) translateZ(0)")
                    "translateX( #{translate.toFixed(2)} px)"
                  }

                  label="translateX"
                  background="#F1E2D7"
                  path={["M0,100 C1.984375,100 2.70793815,100.073064 4.04394531,100 C4.73828125,98.8152313 5.81738611,94.8017758 5.81738611,94.8017758 L7.85351562,104.587891 L9.27734375,97.2636719 L11.072431,102.959963 L12.4135742,98.8152313 L14.050293,101.364746 L15.6270003,98.81523 L17.1100006,100 C50,99.1317495 50,93.4111819 50,50 C50,35.896697 51.1576883,7.22650422 52.4855728,1.62947522e-07 C54.3235397,-10.0024322 56.8798986,-1.9553849 57.5555038,1.12621315e-07 C58.0496101,1.4300779 59.5105476,4.3734379 61.8531456,-2.20713957e-07 C61.8531456,1.84699047e-08 63.0574226,-2.38710926 65.5352859,-2.20713957e-07 C67.220314,1.47187521 70.6500015,1.84699047e-08 79.9632797,-2.20713957e-07 C85.2195282,-2.20713957e-07 97.2131235,0 100,0"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-1" id="js-easing-task-3"></div>

                </EasingObjectGraph>

                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/818dd25fe95c909b69fb71351fdb205d">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/easing-task-answer-2.svg">bootstrap svg file</UniteLink>
                  </em>
                </p>

                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">

                  <EasingObjectGraph
                    duration = { 3000 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-easing-task-3a')
                      translate = 180*o.easedP[0]
                      mojs.h.style(@el, 'transform', "translateX(#{translate}px) translateZ(0)")
                      "translateX( #{translate.toFixed(2)} px)"
                    }

                    label="translateX"
                    background="#F1E2D7"
                    path={["M0,100 C1.984375,100 2.70793815,100.073064 4.04394531,100 C4.73828125,98.8152313 5.81738611,94.8017758 5.81738611,94.8017758 L7.85351562,104.587891 L9.27734375,97.2636719 L11.072431,102.959963 L12.4135742,98.8152313 L14.050293,101.364746 L15.6270003,98.81523 L17.1100006,100 C50,99.1317495 50,93.4111819 50,50 C50,35.896697 51.1576883,7.22650422 52.4855728,1.62947522e-07 C54.3235397,-10.0024322 56.8798986,-1.9553849 57.5555038,1.12621315e-07 C58.0496101,1.4300779 59.5105476,4.3734379 61.8531456,-2.20713957e-07 C61.8531456,1.84699047e-08 63.0574226,-2.38710926 65.5352859,-2.20713957e-07 C67.220314,1.47187521 70.6500015,1.84699047e-08 79.9632797,-2.20713957e-07 C85.2195282,-2.20713957e-07 97.2131235,0 100,0"]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-1" id="js-easing-task-3a"></div>

                  </EasingObjectGraph>

                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/a840cd3b03153fed0c98ec7e21756c10">answer codepen</UniteLink>
                    </em>
                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/easing-task-answer-3.svg">answer svg file</UniteLink>
                    </em>
                  </p>
                  
                  <p>
                    With elastic motion at the end we are adding a little physical detail,
                    while spending the same time declaring the object's end position.
                  </p>
                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>

            </ul>

            <h3>Property curves</h3>

            <ul>
              <li>
                <p>
                  Add a heartbeat scale property curve to describe the next effect:
                </p>
                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  delay    = { 0 }
                  isGraphLess = { true }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-property-curve-task-0')

                    mojs.h.style(@el, 'transform', "scale(#{o.easedP[0]}) translateZ(0)")
                    
                    ""
                  }

                  label="translateX"
                  background="#F1E2D7"
                  path={["M0,0 C0,0 19.9451084,-0.00126838684 24.4702692,-0.0474248028 C25.7707024,-0.00126870284 28.6047459,-58.2960241 30.7671486,-0.0290822028 C32.779686,25.2264651 34.3119125,2.5071311 34.7164192,0 C35.1063042,-2.36105156 37.8332109,-47.123619 38.867691,0 C39.6096535,15.4494953 40.570773,1.8990711 42.8020554,0 L100,0"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-0" id="js-property-curve-task-0"></div>

                </EasingObjectGraph>

                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/8ffcbcd2882a5e84b8dae36fdc5f43d0">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/bootstrap-property-curve.svg">bootsrap svg file</UniteLink>
                  </em>
                </p>

                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">
                  <EasingObjectGraph
                    duration = { 3000 }
                    delay    = { 0 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-property-curve-task-0a')

                      mojs.h.style(@el, 'transform', "scale(#{o.easedP[0]}) translateZ(0)")
                      
                      ""
                    }

                    label="translateX"
                    background="#F1E2D7"
                    path={["M0,0 C0,0 19.9451084,-0.00126838684 24.4702692,-0.0474248028 C25.7707024,-0.00126870284 28.6047459,-58.2960241 30.7671486,-0.0290822028 C32.779686,25.2264651 34.3119125,2.5071311 34.7164192,0 C35.1063042,-2.36105156 37.8332109,-47.123619 38.867691,0 C39.6096535,15.4494953 40.570773,1.8990711 42.8020554,0 L100,0"]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-0" id="js-property-curve-task-0a"></div>

                  </EasingObjectGraph>

                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/84654c28b408a052ab0746fb0e720fa6">answer codepen</UniteLink>
                    </em>
                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-1.svg">answer svg file</UniteLink>
                    </em>
                  </p>

                  <p>
                    If you compare the curve with a <UniteLink link="https://mariamanna.files.wordpress.com/2009/06/cardiograph.jpg">real cardio graph</UniteLink>,
                    you will notice how different they are. That's because our understanding of a
                    heartbeat differs from the real one. You often want to "fake" common
                    motion over using a precise or realistic one, for the sake of user's perception.
                  </p>

                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>

              <li>
                <p>
                  Alter the previous heartbeat, scale the property curve to describe the next squash & stretch effect:
                </p>

                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  delay    = { 0 }
                  isGraphLess = { true }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-property-curve-task-01')

                    mojs.h.style(@el, 'transform', "scaleX(#{1-o.easedP[0]}) scaleY(#{1+o.easedP[0]}) translateZ(0)")
                    
                    ""
                  }

                  label="translateX"
                  background="#F1E2D7"
                  path={["M0,100 C0,100 19.9451084,99.9987335 24.4702692,99.9525771 C25.7707024,99.9987332 28.6047459,41.7039778 30.7671486,99.9709197 C32.779686,125.226467 34.3119125,102.507133 34.7164192,100 C35.1063042,97.6389503 37.8332109,52.8763829 38.867691,100 C39.6096535,115.449497 40.570773,101.899073 42.8020554,100 L100,100"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-0 path-easing-tutorial__property-curve-task-0--1" id="js-property-curve-task-01"></div>

                </EasingObjectGraph>
                
                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/5880d1dd49ef3612b94020c09eb1393f">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-1.svg">bootsrap svg file</UniteLink>
                  </em>
                </p>

                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">

                  <EasingObjectGraph
                    duration = { 3000 }
                    delay    = { 0 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-property-curve-task-01a')

                      mojs.h.style(@el, 'transform', "scaleX(#{1-o.easedP[0]}) scaleY(#{1+o.easedP[0]}) translateZ(0)")
                      
                      ""
                    }

                    label="translateX"
                    background="#F1E2D7"
                    path={["M0,100 C0,100 19.9451084,99.9987335 24.4702692,99.9525771 C25.7707024,99.9987332 28.6047459,41.7039778 30.7671486,99.9709197 C32.779686,125.226467 34.3119125,102.507133 34.7164192,100 C35.1063042,97.6389503 37.8332109,52.8763829 38.867691,100 C39.6096535,115.449497 40.570773,101.899073 42.8020554,100 L100,100"]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-0 path-easing-tutorial__property-curve-task-0--1" id="js-property-curve-task-01a"></div>

                  </EasingObjectGraph>
                  
                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/74b8dd0e13dd1fe014d1edf004bbb60c">answer codepen</UniteLink>
                    </em>
                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-2.svg">answer svg file</UniteLink>
                    </em>
                  </p>

                  <p>
                    The graph was simply moved to a zero baseline. This allows us to use it as
                    a coefficient graph, so we can subtract the curve's value from 1 for
                    scaleX and add the curve's value to 1 for scaleY:
                  </p>
                  <CodeSample>
                    { js: """
                              // ..
                              var easedProgress = easingCurve(progress);
                              el.style['transform'] = 'scaleX(' + (1-easedProgress) + ') ' +
                                                      'scaleY(' + (1+easedProgress) + ')';
                              // ..
                      """
                    }
                  </CodeSample>
                
                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>

              <li>
                <p>
                  Given the translateX extreme easing, add an angle property curve
                  to describe the next motion:
                </p>

                { propCurveEasing1 =  mojs.easing.path 'M0,100 C50,100 50,100 50,50 L50,0 L50,50 C50,100 50,100 100,100' }
                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-property-curve-task-1')

                    mojs.h.style(@el, 'transform', "translateX(#{180*o.easedP[0]}px) rotate(#{-140*(propCurveEasing1(o.p))}deg) translateZ(0)")
                    
                    ""
                  }

                  label="translateX"
                  background="#F1E2D7"
                  path={["M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-1" id="js-property-curve-task-1"></div>

                </EasingObjectGraph>

                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/cc90fd896d22164b7d69a165e5b84652">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/easing-task-answer-3.svg">bootstrap svg file</UniteLink>
                  </em>
                </p>


                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">

                  <EasingObjectGraph
                    duration = { 3000 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-property-curve-task-1a')

                      mojs.h.style(@el, 'transform', "translateX(#{180*o.easedP[0]}px) rotate(#{-140*o.easedP[1]}deg) translateZ(0)")
                      
                      ""
                    }

                    label={["translateX", "angle"]}
                    opacity = {[.5, 1]}
                    background="#F1E2D7"
                    path={[ "M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0", "M0,100 C50,100 50,100 50,50 L50,0 L50,50 C50,100 50,100 100,100" ]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-1" id="js-property-curve-task-1a"></div>

                  </EasingObjectGraph>

                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/0e027f58c588f9a94edd08cf25e58919">answer codepen</UniteLink>
                    </em>
                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-3.svg">answer svg file</UniteLink>
                    </em>
                  </p>
                  
                  <p>
                    On maximum translateX velocity, the stick has the maximum angle of deviation.
                    This technique is usually called <span className="highlight">drag</span> -
                    one of the fundamental animation principles.
                    You may notice that the angle property curve is in fact the first half
                    of the <span className="highlight">translateX</span> property curve, 
                    that was expanded to <span className="highlight">1</span>, then copied
                    and flipped vertically.
                  </p>

                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>

              <li>
                <p>
                  Alter the previous angle property curve, to add the next oscillating motion
                  at the end:
                </p>

                { propCurveEasing2 =  mojs.easing.path 'M0,100 C50,100 50,100 50,50 L50,0 L50,50 C50,72.6779468 52.8514147,105.033368 57.1929207,112.031548 C62.851963,121.153496 67.6802979,100 67.6802979,100 C67.6802979,100 70.6599579,81.7189484 74.2423482,100 C74.2423477,100 77.2498016,111.29863 80.7531832,100 C82.0066376,97.3673859 82.9997787,94.8164368 85.6327322,100 C87.1416016,103.389648 88.1576157,100 100,100' }

                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-property-curve-task-2')

                    mojs.h.style(@el, 'transform', "translateX(#{180*o.easedP[0]}px) rotate(#{-140*(propCurveEasing2(o.p))}deg) translateZ(0)")
                    
                    ""
                  }

                  label="translateX"
                  background="#F1E2D7"
                  path={["M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-1" id="js-property-curve-task-2"></div>

                </EasingObjectGraph>

                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/0e027f58c588f9a94edd08cf25e58919">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-3.svg">bootstrap svg file</UniteLink>
                  </em>
                </p>
                
                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">
                  <EasingObjectGraph
                    duration = { 3000 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-property-curve-task-2a')

                      mojs.h.style(@el, 'transform', "translateX(#{180*o.easedP[0]}px) rotate(#{-140*(propCurveEasing2(o.p))}deg) translateZ(0)")
                      
                      ""
                    }

                    label={['translateX', 'angle']}
                    opacity = {[.5, 1]}
                    background="#F1E2D7"
                    path={["M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0,", "M0,100 C50,100 50,100 50,50 L50,0 L50,50 C50,72.6779468 52.8514147,105.033368 57.1929207,112.031548 C62.851963,121.153496 67.6802979,100 67.6802979,100 C67.6802979,100 70.6599579,81.7189484 74.2423482,100 C74.2423477,100 77.2498016,111.29863 80.7531832,100 C82.0066376,97.3673859 82.9997787,94.8164368 85.6327322,100 C87.1416016,103.389648 88.1576157,100 100,100"]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-1" id="js-property-curve-task-2a"></div>

                  </EasingObjectGraph>

                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/8d35b8f97d6db48c72820a0f776a1020">answer codepen</UniteLink>
                    </em>
                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-4.svg">answer svg file</UniteLink>
                    </em>
                  </p>
                  <p>
                    When the sticks stops, it's angle follows through and then comes back.
                    You may know this animation principle as <UniteLink link="https://www.youtube.com/watch?v=4OxphYV8W3E">follow through</UniteLink>,
                    it adds a great deal of realism to a motion.
                  </p>
                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>

              <li>
                <p>
                  For the previous task, add one more scale property curve for squash & stretch
                  effect (the stick was made fat just to emphasize the scaleX motion):
                </p>


                {
                  propCurveEasing3 =  mojs.easing.path 'M0,100 C50,100 50,100 50,50 L50,0 L50,50 C50,72.6779468 52.8514147,105.033368 57.1929207,112.031548 C62.851963,121.153496 67.6802979,100 67.6802979,100 C67.6802979,100 70.6599579,81.7189484 74.2423482,100 C74.2423477,100 77.2498016,111.29863 80.7531832,100 C82.0066376,97.3673859 82.9997787,94.8164368 85.6327322,100 C87.1416016,103.389648 88.1576157,100 100,100'
                  propCurveEasing4 = mojs.easing.path 'M0,100 C6.69604123,100 36.7852869,100.120092 41.8079414,100 C49.0709648,100 50,93.3039588 50,75 L53,75 C53.7799492,90.208985 56.9783087,106.849836 60.1929207,112.031548 C65.851963,121.153496 70.6802979,100 70.6802979,100 C70.6802979,100 73.6599579,81.7189484 77.2423482,100 C77.2423477,100 80.2498016,111.29863 83.7531832,100 C85.0066376,97.3673859 85.9997787,94.8164368 88.6327322,100 C90.1416016,103.389648 87.9330063,100 100,100'
                }

                <EasingObjectGraph
                  curtainLabel = 'tap to see the result'
                  duration = { 3000 }
                  onUpdate = { (o)->
                    @el ?= document.querySelector('#js-property-curve-task-3')

                    mojs.h.style(@el, 'transform', "translateX(#{180*o.easedP[0]}px) rotate(#{-140*(propCurveEasing3(o.p))}deg) scaleY(#{ 1 + propCurveEasing4(o.p)} ) scaleX(#{ 1 - propCurveEasing4(o.p)} ) translateZ(0)")
                    
                    ""
                  }

                  background="#F1E2D7"
                  label={['translateX', 'angle']}
                  path={["M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0", "M0,100 C50,100 50,100 50,50 L50,0 L50,50 C50,72.6779468 52.8514147,105.033368 57.1929207,112.031548 C62.851963,121.153496 67.6802979,100 67.6802979,100 C67.6802979,100 70.6599579,81.7189484 74.2423482,100 C74.2423477,100 77.2498016,111.29863 80.7531832,100 C82.0066376,97.3673859 82.9997787,94.8164368 85.6327322,100 C87.1416016,103.389648 88.1576157,100 100,100"]} >
                  
                  <div className="path-easing-tutorial__property-curve-task-1 path-easing-tutorial__property-curve-task-1--fat" id="js-property-curve-task-3"></div>

                </EasingObjectGraph>

                <p className="post__reverse-block post__center-text">
                  <em>
                    <UniteLink link="http://codepen.io/sol0mka/pen/4e1d51bfd17c01b678fca7cc6a5b03b3">bootstrap codepen</UniteLink>
                  </em>
                  <em>
                    <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-4.svg">bootstrap svg file</UniteLink>
                  </em>
                </p>

                <ORXLine className="post__list-orx-line post__list-orx-line--top" type="center" />

                <More label="answer" className="is-center">

                  <EasingObjectGraph
                    duration = { 3000 }
                    onUpdate = { (o)->
                      @el ?= document.querySelector('#js-property-curve-task-3a')

                      mojs.h.style(@el, 'transform', "translateX(#{180*o.easedP[0]}px) rotate(#{-140*(propCurveEasing3(o.p))}deg) scaleY(#{ 1 + propCurveEasing4(o.p)} ) scaleX(#{ 1 - propCurveEasing4(o.p)} ) translateZ(0)")
                      
                      ""
                    }

                    background="#F1E2D7"
                    opacity = {[ .2, .2, 1 ]}
                    label = {['translateX', 'angle', 'scale']}
                    path = {["M0,100 C50,100 50,100 50,50 C50,0 50,0 100,0", "M0,100 C50,100 50,100 50,50 L50,0 L50,50 C50,72.6779468 52.8514147,105.033368 57.1929207,112.031548 C62.851963,121.153496 67.6802979,100 67.6802979,100 C67.6802979,100 70.6599579,81.7189484 74.2423482,100 C74.2423477,100 77.2498016,111.29863 80.7531832,100 C82.0066376,97.3673859 82.9997787,94.8164368 85.6327322,100 C87.1416016,103.389648 88.1576157,100 100,100", "M0,100 C6.69604123,100 36.7852869,100.120092 41.8079414,100 C49.0709648,100 50,93.3039588 50,75 L53,75 C53.7799492,90.208985 56.9783087,106.849836 60.1929207,112.031548 C65.851963,121.153496 70.6802979,100 70.6802979,100 C70.6802979,100 73.6599579,81.7189484 77.2423482,100 C77.2423477,100 80.2498016,111.29863 83.7531832,100 C85.0066376,97.3673859 85.9997787,94.8164368 88.6327322,100 C90.1416016,103.389648 87.9330063,100 100,100"]} >
                    
                    <div className="path-easing-tutorial__property-curve-task-1 path-easing-tutorial__property-curve-task-1--fat" id="js-property-curve-task-3a"></div>

                  </EasingObjectGraph>

                  <p className="post__reverse-block post__center-text">
                    <em>
                      <UniteLink link="http://codepen.io/sol0mka/pen/1d2d3e73a3c5a390cd83bb8493158b3c">answer codepen</UniteLink>
                    </em>
                    <em>
                      <UniteLink link="/app/pages/tutorials/easing/path-easing/files/property-curve-task-answer-5.svg">answer svg file</UniteLink>
                    </em>
                  </p>

                  <p>
                    The scale property curve was made from 
                    the previous <span className="highlight">drag + follow through</span> one.
                    The first "rise" stage was made slightly more steep and the oscillating motion
                    stage was slightly delayed, it adds a gummy feeling to the motion.
                    You may know this technique 
                    as the <UniteLink link="https://www.youtube.com/watch?v=haa7n3UGyDc">squash & stretch</UniteLink> animation
                    principle.
                  </p>

                </More>

                <ORXLine className="post__list-orx-line" type="center" />

              </li>

            </ul>

          </More>

          <p style= { textAlign: 'center', marginTop: '50px' }>
            <br />
            Next: &nbsp;<UniteLink link="/tutorials/easing/mix" isDisabled="true" className="highlight">Easing: Mix tutorial</UniteLink>
          </p>

          <SocialNetworksAbout className="post__social-networks-about" />
          <ORXLine className="post__last-orx-line" type="center" />
          <DisqusComments />
        </div>

    className = if @state.isShow then 'is-show' else ''
    classNameLoading = if @state.isShow then 'is-hide' else ''
    <Resizable className="post" onResize=@_onResize id="post">
      <div className="post__loading #{classNameLoading}"> Loading The Post.. </div>
      <div className="post__content #{className}">{content}</div>
    </Resizable>
