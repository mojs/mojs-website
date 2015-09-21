React       = require 'react'
Router      = require 'react-router'
UniteLink   = require 'partials/unite-link'
{ Route, RouteHandler, Link } = Router

mojs          = require 'mo-js'
MoleSample    = require './mole-sample'
Vimeo         = require 'partials/vimeo'
PostImage     = require 'partials/post-image'
Cite          = require 'partials/cite'
ORXLine       = require 'partials/orx-line'
CodeSample    = require 'partials/code-sample'
Pen           = require 'partials/codepen'
EasingObjectGraph = require 'partials/easing-object-graph'
EasingGraph   = require 'partials/easing-graph'

HeftyContent  = require 'partials/hefty-content'
DisqusComments      = require 'partials/disqus-comments'
SocialNetworksAbout = require 'partials/social-networks-about'
require 'css/pages/tutorials-page'
require 'css/blocks/post'
require './path-easing-styles.styl'

module.exports = React.createClass
  render: ()->
    <div className="post">
      <div className="post__header">Easing / Path Easing</div>
      <div className="post__description"> This post is about path easing functions for your precise timing control.</div>
      <ORXLine className="post__orx-line" />
      
      { ###
        
        <p>TODO: add jumping square example</p>
        <p>TODO: add draggable progress </p>

        <p>TODO: add pens</p>
        <p>TODO: fix motion for the wxeb demo</p>
        <p>TODO: add server rendering to this website</p>
        <p>TODO: buy domain</p>
      ### }

      <p>
        Easing (or timing function) is the secret sauce ingredient that makes a good motion delightful. 
        Linear movement trudging unnaturally and sloppy, 
        this feeling comes from our physical world experience - nothing moves linearly around us.
      </p>

      <Cite author="Stanislaw Ulam">
        Using a term like nonlinear science is like referring to the 
        bulk of zoology as the study of non-elephant animals.
      </Cite>

      <p>
        Animation with equal interim spacing(read with linear easing) can 
        envoke in human brain nothing than suspicious or dull response. 
        By contrast, excellent crafted easing appeal user's attention, 
        araise curiosity and so involvement.
        That's why so crutial to embrace the full control of easing functions.
      </p>

      <p>
        Fortunately <span className="highlight">mo· js</span> 
        &nbsp;has the best set of easing functions of various 
        types in the modern web. Besides 
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
          &nbsp;has super precise easing function type 
          - <span className="highlight">path easing</span>.
          It allows you to draw your timing functions. 
          That's what this tutorial is dedicated to, hang tight!
      </p>

      <h2>First things first</h2>

      <p>
        Consider the example below that was made to illustrate 
        the case when we need precise control over easing function. 
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
                  }).run();
          """
        }
      </CodeSample>

      <em>
        <i>Note</i>: No vendor prefixes used in the code above for 
        clarity's sake but some browsers still do need them.
      </em>

      <p>
        We've created a tween here by constructing 
        the <span className="highlight">mojs.Tween</span> class (line 2), 
        on every frame update we multiply tween's progress(it is in range of from 0 to 1) 
        on 200 and set the result as the current 
        <span className="highlight">translateY</span> property (line 6) of our 
        <span className="highlight">square</span> object (line 1).
      </p>

      <p>
        As the result we have one sloppy movement here, it doesn’t really look 
        like something falling down at all, so lets add bounce easing:
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
                  }).run();
          """
        }
      </CodeSample>

      <p>
        The bounce easing was added by passing the linear progress 
        thru <span className="highlight">bounce.out</span> function 
        (line 6)
        &nbsp;that is available on 
        <span className="highlight">mojs.easing</span> object - the place where 
        all easing functions and helpers are stored. 
        The outcome is pretty obvious - you probably did it thousands times - 
        we have something that kind of looking like falling object with it’s own physics, 
        despite the fact that it doesnt obey any physics laws, its behavior is hardcoded 
        into this graph:
      </p>

      <EasingObjectGraph
        duration={ 1000 }
        onUpdate = { (o)=>
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
        If you'll think about it, this common bounce easing graph represents our object's 
        parameters like the material it is made of or it's weight or acceleration it has. 
        Savvy readers starting to grasp the main problem with this widespread easing function 
        - the limit to one set of these parameters that can not be changed on demand.
      </p>

      <p>
        But what if we want to change the weight parameter of our object so it will 
        have much wider bouncing amplitude range? That’s the point where the 
        <span className="highlight">path easing</span> become irreplaceable. 
        Lets jump to vector graphics editor 
        with <UniteLink link="/app/pages/tutorials/easing/path-easing/files/bounce-easing.svg">this common graph</UniteLink> as a bootstrap. 
      </p>

      <em>
        <i>Note</i>: Any vector editor will do here, I prefer to use Sketch lately, 
        but any that can produce a <span className="highlight">SVG path</span> works.
      </em>

      <p>
        We will amplify the bouncing curves a bit, to add our motion feel of much more lighter object 
        (or much more bouncy one - made of rubber instead of wood).
        That's what the bouncy graph might look like:
      </p>

      <EasingObjectGraph
        duration={ 1500 }
        onUpdate = { (o)=>
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
        <i>Note</i>: This path easing is used in the final demo (with small tweaks), 
        particularly when white cube bounces on the floor.
      </em>

      <p>
        There is my <UniteLink link="/app/pages/tutorials/easing/path-easing/files/bouncy-easing.svg">.svg file</UniteLink> with this bouncy graph.
        Now we can generate our custom easing function from this SVG path.
        For this simply copy the Path's commands from 
        <span className="highlight">d attribute</span> and pass them to 
        the <span className="highlight">mojs.easing.path</span> function (line 2):
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
                  }).run();
          """
        }
      </CodeSample>

      <p>
        Yay! We've drawn our custom path easing!
        Our square feels much more bouncy now!
      </p>

      <p>
        You can literally draw your easing functions with <span className="highlight">Path easing</span>.
        There are few more examples of drawn custom easing:
      </p>

      <ul>
        <li>
          extreme ease-in-out (
          <UniteLink link="/app/pages/tutorials/easing/path-easing/files/extreme-ease-in-out.svg">.svg file</UniteLink>) :
        </li>
      </ul>

      <EasingObjectGraph
        duration={ 3000 }
        onUpdate = { (o)=>
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
                  }).run();


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
        onUpdate = { (o)=>
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
                  }).run();
          """
        }
      </CodeSample>

      <em>
        <i>Note</i>: 
        As you can see in the <UniteLink href="/app/pages/tutorials/easing/path-easing/files/bouncy-easing.svg">.svg file</UniteLink>, by default <span className="highlight">mo· js</span> expects you to draw your easing paths in rectangle of 100x100, but 
        you can change that with special option, we will talk about it a bit later, 
        in <span className="highlight">options</span> section of this tutorial.
      </em>
      
      <p>
        Imagine what amount of 
        freedom <span className="highlight">path easing</span> can give you,  
        how comprehensive your easing functions can now be.
        <br />
        Nonetheless, <span className="highlight">it has much more powerfull purposes</span>, so keep reading!
      </p>

      <h2>Property curves</h2>
      
      <h3>Make acquaintance</h3>

      <p>
        If you are familiar with After Effects workflow and have ever worked 
        with <UniteLink link="http://www.schoolofmotion.com/intro-to-animation-curves-in-after-effects/">animation curves</UniteLink> (go watch this video, I'll be waiting on you here) 
        this idea won't be entirely new for you.
        If you haven't - no worries, it is pretty easy but be attentive it can change 
        the way you are treating your animations!
      </p>

      <p>
        Let me try to express the idea of property curves in one sentence:
      </p>

      <Cite author="LegoMushroom">
        With property curves we can specify(or draw) 
        how would a certain property behave in time.
      </Cite>

      <p>
        Yes exactly. We can draw for instance, how a translate or scale(or any other) 
        propety will act on progress change. To describe it more verbosely consider
        the next use case.
      </p>

      <p>
        We have our square, but now it starts at very bottom, then jumps up with squash&stretch motion. 
        Just like this:
      </p>

      <HeftyContent className="is-full-width">
        <Pen pen="c7b99f1a216498818cbb9f0c881fc542"></Pen>
      </HeftyContent>

      <p>
        As you may guessed, it will compose this motion with help of 2 <span className="highlight">property curves</span>.
        The first one for <span className="highlight">y</span> position 
        or <span className="highlight">translateY</span> property, 
        the second one is for the <span className="highlight">scale</span> property to describe 
        squash&stretch.
      </p>

      <p>
        The first <span className="highlight">translateY</span> property curve 
        will look like this:
      </p>

      <EasingObjectGraph
        duration={ 1000 }
        onUpdate = { (o)=>
          shift = -180*o.easedP[0]
          mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
          "translateY( #{shift.toFixed(0)} px )"
        }
        label="translateY"
        background="#F1E2D7"
        path="M0,100 L25,99.9999983 C25,99.9999983 41.809064,-0.819014106 100,0">
        
        <div className="path-easing-rectangle path-easing-rectangle--jump"></div>
      
      </EasingObjectGraph>

      <p>
        The delay at very start was made to give some time for initial squash 
        easing to act. So it waits some time and then increases to 1 with
        something like cubic-out easing. Dont get fooled by the fact that it looks 
        like an easing -- yes it starts at 0 and ends and 
        1 <span className="highlight">Y</span> -- my intention was 
        to describe how <span className="highlight">translateY</span> property 
        will act in time, but not ease the change. Consider the next example for 
        better understanding what I mean.
      </p>

      <p>
        The second, <span className="highlight">scale</span> property curve 
        will look like this:
      </p>

      <EasingObjectGraph
        duration={ 1000 }
        onUpdate = { (o)=>
          squashP = 2*o.easedP[0]
          scaleX = 1-squashP; scaleY = 1+squashP
          mojs.h.style o.objEl, 'transform', "scaleX(#{scaleX}) scaleY(#{scaleY}) translateZ(0)"
          "scaleX( #{scaleX.toFixed(2)} ) scaleY( #{scaleY.toFixed(2)} )"
        }
        label="translateY"
        background="#F1E2D7"
        path="M0,100.004963 C0,100.004963 25,147.596355 25,100.004961 C25,59.1393229 64.2747421,100 100,100">
        
        <div className="path-easing-rectangle path-easing-rectangle--jump"></div>
      
      </EasingObjectGraph>

      <p>
        The <span className="highlight">scale</span> property 
        curve represents deviation from <span className="highlight">0</span>. 
        We can set <span className="highlight">scaleY</span>&nbsp;
        as <span className="highlight">1 + curve progress</span>&nbsp;
        and <span className="highlight">scaleX</span> as <span className="highlight">1 - curve progress</span>&nbsp;
        to imitate the desired effect.

        While the <span className="highlight">translateY</span> curve in passive state 
        at the begining, this curve goes 
        under <span className="highlight">0</span> imitating squash motion to 
        show that our rectangle 
        accumulates some power for the subsequent jump. When the first curve starts to 
        lift our rectangle in air, this curve goes 
        over <span className="highlight">0</span> imitating stretch that object 
        will get when it is moving. At the end this curve returns 
        back to <span className="highlight">0</span> showing 
        that's there is no acceleration left in the movement.
      </p>

      <p>
        You can notice that now it doesn't starts at 0 and ends at 
        1 <span className="highlight">Y</span>. In 
        fact <span className="highlight">property curves</span> can get 
        any <span className="highlight">Y</span> value you want. It should obey 
        the law for <span className="highlight">X</span> value though. 
        It should start at 0 and end at 1, as it represents the progress and 
        progress can't go beyond 1 as it makes no sense.
      </p>

      <p>
        That's how our two property curves work together:
      </p>

      <EasingObjectGraph
        duration={ 1000 }
        onUpdate = { (o)=>
          squashP = 2*o.easedP[0]
          translateP = -180*o.easedP[1]
          scaleX = 1-squashP; scaleY = 1+squashP
          mojs.h.style o.objEl, 'transform', "translateY(#{translateP}px) scaleX(#{scaleX}) scaleY(#{scaleY}) translateZ(0)"
          "translateY(#{(translateP).toFixed(2)}px) scaleX( #{scaleX.toFixed(2)} ) scaleY( #{scaleY.toFixed(2)} )"
        }
        label={['scale', 'translateY']}
        background="#F1E2D7"
        path={['M0,100.004963 C0,100.004963 25,147.596355 25,100.004961 C25,59.1393229 64.2747421,100 100,100', 'M0,100 L25,99.9999983 C25,99.9999983 41.809064,-0.819014106 100,0' ]}>
        
        <div className="path-easing-rectangle path-easing-rectangle--jump"></div>
      
      </EasingObjectGraph>

      <CodeSample pen="c7b99f1a216498818cbb9f0c881fc542">
        { js: """var square = document.querySelector('#js-square'),
                      translateCurve = mojs.easing.path('M0,100 L25,99.9999983 C25,99.9999983 41.809064,-0.819014106 100,0'),
                      squashCurve = mojs.easing.path('M0,100.004963 C0,100.004963 25,147.596355 25,100.004961 C25,59.1393229 64.2747421,100 100,100');

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
                  }).run();


          """
        }
      </CodeSample>

      <p>
        Pretty neat, ha? These type of curves allow us to visualy describe how certain properties 
        behave in time. Then we can compose them together to get our final motion.
        Yep it takes some time to wrap your head around this concept, but when you 
        using it for few times, it feels very intuitive. You 
        start to see the matrix in those random hieroglyphs(read path's coordinates).
      </p>

      <p>
        "We can use 5 common tweens here instead of these property curves." - one will say 
        and will be right. We can use 5 tweens instead of two property curves. 
        One, delayed, for translateY property and four for squash&strech motion 
        (two for squash and two for stretch). But there are few problems though. 
        Even if we omit amount of code we will get, these 5 tweens should be precisely 
        timed to get the same eventual motion. All this 
        little timing nuances should be kept in your head while you are coding. Ugh.
        Also maintaining such chain would be itchy.
        By contrast, property curves are much more intuitive and convient way 
        to correlate property change with time. 
        Maitaining a property curve wouldn't be much harder than 
        merely maintaining one clean svg file.
      </p>

      <h3>More complex property curve</h3>

      <p>
        Consider the next more complex example, where the tween animation is helpless. 
        Splitting a motion like that to bunch of tweens will be nightmare.
        It will also consist of two property curves just like the previous example 
        but it will have much more advanced curves so don't freak out, they are 
        so complicated only for demonstration purposes.
      </p>

      <p>
        Lets get out our first custom easing function with bouncy easing:
      </p>

      <EasingObjectGraph
        duration={ 1500 }
        onUpdate = { (o)=>
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
        Now lets insert inactive periods between the bounce ones 
        to make some room for squash motion:
      </p>

      <EasingObjectGraph
        isIt = true
        duration={ 1500 }
        onUpdate = { (o)=>
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
        onUpdate = { (o)=>
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
        Don't freak out, it is actually an easy one. If you will take some time, you 
        may notice that the pattern is repeatative. On every translateY period, 
        we have according squash&streatch period and then it recur over and over.
        One such period period looks like this:
      </p>

      <EasingGraph
        className = "fly-g"
        label     = {'scale'}
        path      = {'M0,100 C7.81150159,99.8552004 10.5,124.956388 10.5,124.956388 C10.6364142,-0.167048257 20.7999985,99.8575387 20.8,99.8575415 C20.8000015,99.8575443 26.8367187,138.182953 30.6039062,99.857543 C36.3236123,99.9221201 38.1,118.97564 38.1,118.97564 C38.2039989,23.5845053 46.8999988,99.923904 46.9,99.9239062 C46.9000012,99.9239083 50.8279858,129.142288 53.7,99.923906 C57.6148517,99.9884282 58.9,113.065132 58.9,113.065132 C58.9711335,47.8192476 64.7999992,99.989649 64.8,99.9896504 C64.8000008,99.9896519 67.4706109,119.974518 69.4350189,99.9896506 C72.3313246,100.046231 73.2,109.611947 73.2,109.611947 C73.2519882,61.9267379 77.3999994,100.047123 77.4,100.047124 C77.4000006,100.047125 79.4204624,114.653142 80.8561577,100.047124 C82.8367206,100.021884 83.3999999,106.746427 83.3999999,106.746427 C83.4364957,73.2713076 86.4999995,100.02251 86.4999999,100.022511 C86.5000003,100.022512 87.6948194,110.275967 88.7026805,100.022511 C90.1283952,100.031273 90.5289739,104.813463 90.5289739,104.813463 C90.5549281,81.0074753 92.3999997,100.031718 92.4,100.031719 C92.4000003,100.031719 93.5948603,107.323512 94.3116055,100.031719 C95.2672636,99.9339509 95.7,103.132754 95.7,103.132754 C95.7175753,87.0120996 97.0999998,99.9342524 97.1,99.9342527 C97.1000002,99.9342531 97.6146431,104.872022 98.1,100 L100,100'} >
        <div className="path-easing-tutorial__repeatative"></div>
      </EasingGraph>

      <p>
        Now we can compose out two property curves to get our motion:
      </p>

      <EasingObjectGraph
        duration={ 1500 }
        onUpdate = { (o)=>
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

      <p>
        Whoo! This one is cute!
        <br />
        Imaging you have to write a tween for every cube's movement. 
        I can't.
        <br />
        <span className="highlight">Property curves</span> save us a lot of 
        time and effort. Bring our work to the whole new level by allowing 
        us to intuitively describe our motion intention.
      </p>


      <h2>Thinking in property curves</h2>

      <p>
        Ok, now you have some clue what the heck property curves are. This section will 
        help you to gain some skill how and when to use them. Generally, we can use curves in 
        <UniteLink link="https://vimeo.com/111574737">lots of different purposes</UniteLink>, 
        but here we will talk with you how to think in curves when you want to move an object 
        on screen or transform it from one state into another.
      </p>

      <p>
        Consider the <UniteLink link="http://final demo">final demo</UniteLink>, particulary the 
        part when mole deviates slightly back to inhale some air and then bend forward swiftly with his tongue out:
      </p>

      <Vimeo id="137677120" name="Inhale" />

      <p>
        We can describe the swinging motion with the next propety curve 
        for <span className="highlight">skewX</span> property:
      </p>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
          
          @scopeEl ?= document.querySelector '#js-mole-sample-1'
          @moleEl ?= @scopeEl.querySelector '#js-mole'

          mojs.h.style(@moleEl, 'transform', "skewX(#{75*o.easedP[0]}deg) translateZ(0)");

          "skewX(#{(75*o.easedP[0]).toFixed(2)}deg)"
        }

        label="angle"
        background="#50E3C2"
        path="M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100">
        
        <MoleSample id="js-mole-sample-1" />

      </EasingObjectGraph>

      <p>
        As you can see, our curve goes <span className="highlight">above 0</span> slightly 
        to implement the backward move then it goes <span className="highlight">below 0</span> to 
        make the forward move. This is base curve for our scene, we will use 
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
                  }).run();
          """
        }
      </CodeSample>
      
      <p>
        Our mole moves now, but errr.. This motion doesn't convey too much.
        Lets add a secondary action to fulfill(наполнить) our scene.
        We will rise mole's hand up(by rotating it) very fast when mole deviates 
        backward, so our curve should rise steeply at the beggining. Then, when 
        mole bends forward, we will rotate our hand to small negative number, so the curve 
        goes below zero. After that, when mole moves to it's start position 
        we will change hand's angle all way up to zero slowly:
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

        label="angle"
        background="#50E3C2"
        path="M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100">
        
        <MoleSample id="js-mole-sample-2" />

      </EasingObjectGraph>

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
                  }).run();
          """
        }
      </CodeSample>

      <p>
        Ok thats better. Now lets work on the left hand. 
        Luckily we can use the same 
        <span className="highlight">skew</span> curve for 
        <span className="highlight">translate</span> and <span className="highlight">rotate</span> properties.
        This is highly illustrative situation - you will often reuse the same 
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

        label="angle"
        background="#50E3C2"
        path="M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100">
        
        <MoleSample id="js-mole-sample-3" />

      </EasingObjectGraph>

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
                  }).run();
          """
        }
      </CodeSample>

      <p>
        We will continue working on secondary actions step by step making our scene 
        comprehensive. 
        It is the mouth's turn now. 
        To implement mouth motion we need to scale it 
        up <span className="highlight">above 1</span> conveying inhale and then scale it down to 
        about <span className="highlight">.4</span> conveying exhale, after that we need to continue 
        scaling it down slowly to convey the fact that the mouth tends to close slowly, while air is comming out of the mouth moved by mole's 
        lagger presure:
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

        label="scale"
        background="#50E3C2"
        path="M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934">
        
        <MoleSample id="js-mole-sample-4" />

      </EasingObjectGraph>

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
                }).run();
          """
        }
      </CodeSample>

      <p>
        As you can notice, we've added some motion to the 
        <span className="highlight">translateX</span> property 
        by reusing the base <span className="highlight">skew</span> curve again. 
        It adds kind of cartoony feel to the mouth's movement.
      </p>

      <p>
        Ok cool. Lets add tongue's motion. We need to wrap it with 
        a <span className="highlight">overflow: hidden;</span> wrapper,
        then apply the very first basic <span className="highlight">skew</span> curve 
        for <span className="highlight">translate</span> property:
      </p>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
          @scopeEl    ?= document.querySelector '#js-mole-sample-8'
          @tongueEl   ?= @scopeEl.querySelector '#js-sample-tongue'

          mojs.h.style(@tongueEl, 'transform', "translateX(#{-550*o.easedP[0]}px)")
          
          "translateX(#{(-550*o.easedP[0]).toFixed(2)}px)"
        }

        label="translateX"
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

          @skewEasing  = mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'

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

      <p>
        We will reuse this noize curve further on shorlty. 
        Meanwhile lets add the tongue to the entire scene:
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


      <p>
        [CODEPEN]
      </p>


      <p>
        Few touches left. We see how mole blows air from his mouth, but his effort 
        should be emphasized by adding some twitching to the whole mole's body. Luckily 
        we already have our <span className="highlight">noize</span> curve to use here. 
        We need add it as a cofficient to all small parts to make them twitch and wiggle:
      </p>

      [CODEPEN with all parts twitching]

      <p>
        The latest touch would be to add saliva with <span className="highlight">Burst</span> module. 
        In short, this module type allows us to grenerate various effects in declarative way. 
        We will look at it in detail in dedicated tutorial. That's our entire scene 
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
          @glassesLeftEl  ?= @scopeEl.querySelector '#js-mole-glasses-left'
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
        
        <MoleSample id="js-mole-sample-11" />

      </EasingObjectGraph>

      <em>
        <i>Note</i>:
        For simplisity's sake we have omited the eye motion in this tutorial.
      </em>

      <p>
        That's basically it. We have used 4 property curves to bring our mole to life. 
        I hope you enjoined the process. Thinking in curves could be totally new  
        mindset for you, but it gets very convinient and intuitive when you use 
        it for a few times so go get some practice right now.
        [MAYBE ADD TASKS FOR PRACTICE]
      </p>


      <h2>Options</h2>

      <p> 
        When you create an easing path with help 
        of <span className="highlight">mojs.easing.path</span>, you can 
        pass an object with options just after the path coordinates string, as the 
        second parameter:
      </p>

      <CodeSample>
        { js: """
                  var easing = mojs.easing.path('M0,100 ..', {
                    // options
                    precompute: 140,  // default, could be in range of 100 - 10000
                    eps:        0.01, // default
                    rect:       100   // default
                  });
          """
        }
      </CodeSample>

      <p>
        To generate an easing function from a SVG path, 
        the <span className="highlight">mo· js</span> should sample 
        path's coordinates values. 
        The <span className="highlight">precompute</span> option defines how 
        much samples it should take from the path on initialization stage. 
        Allowed range is <span className="highlight">100 - 10000</span> value.
        More samples, means your result easing function would be more performant 
        on runtime, but it will take longer to get all those samples.
      </p>

      <p>
        The <span className="highlight">eps</span> option defines how precise will the 
        result easing function be. Smaller <span className="highlight">eps</span> option is, more precisely it will work on during the runtime (but more slowly 
        though). If you are using very big time resolution (long tween duration) and see that your path easing function gives to your motion some twitching, 
        increase <span className="highlight">precompute</span> option and decrease 
        the <span className="highlight">eps</span> one to solve the issue. 
        In most tough cases <span className="highlight">precompute</span> of 3000 and 
        <span className="highlight">eps</span> of 0.0001 should be enough.
      </p>

      <p>
        The <span className="highlight">rect</span> option provides desired 
        rectangle size path was drawn into to the <span className="highlight">mojs.easing.path</span> method. 
        By default the rectangle 
        is <span className="highlight">100</span>(means 100x100), but you can 
        specify any size that works good for you.
      </p>

      <h2>Recap</h2>

      <p>
        Among lots of other easing functions and helpers, 
        <span className="highlight">mo· js</span> has <span className="highlight">path easing</span> that allows you to generate advanced easing functions from SVG 
        path coordinates. To do so the path's data should be sent to 
        the <span className="highlight">mojs.easing.path</span> method, 
        the newely generated easing function will be returned back:
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
        The <span className="highlight">path easing</span> also allows as to 
        generate the <span className="highlight">property curves</span> - 
        much more complex and powerfull easing paths, to descibe a property 
        change in time with a graph.
      </p>

      <p>
        You can also control how fast/precise your custom easing function will be 
        with <span className="highlight">precompute</span> and 
        <span className="highlight">eps</span> options. 
        The <span className="highlight">rect</span> option 
        specifies the rectangle's size the easing path was drawn into.
      </p>

      <p>
        It is worth noting that when you draw your easing path, 
        it's <span className="highlight">x</span> values must start at 0 and end at 100 
        (or at <span className="highlight">rect</span> option's value that you have set). 
        This rule comes from the fact that the <span className="highlight">x</span> axis 
        of your path represents <span className="highlight">progress</span> and the 
        progress can't go beyond 100% or before 0%. This restriction is must only for 
        <span className="highlight">x</span> values and doesn't apply 
        to <span className="highlight">y</span> values of your path which can take
        any value you want.
      </p>

      <h2>Thank you!</h2>

      <p>
        Thanks a lot to the reader for time and effort in reading this tutorial! 
        In a short future we are planning to add a page with a searchable list of path 
        xeasings powered by live examples and graphs.
        So developers can collaborate and share their easing paths and find ones 
        that suite their current needs.
        <br />
        Bunch of great stuff is comming up on other topics also so stay tuned!
      </p>

      <br />

      <p style= { textAlign: 'center' }>
        <UniteLink link="http://codepen.io/">demo on CodePen</UniteLink> | 
        <UniteLink link="https://github.com/legomushroom/property-curves">demo's repo on GitHub</UniteLink> | 
        <UniteLink link="https://github.com/legomushroom/mojs/">mo · js on GitHub</UniteLink>
      </p>

      <p style= { textAlign: 'center' }>
        <br />
        Next: &nbsp;<UniteLink link="/tutorials/easing/mix" isDisabled="true" className="highlight">Easing: Mix tutorial</UniteLink>
      </p>

      <ORXLine className="post__last-orx-line" type="center" />
      <SocialNetworksAbout className="post__social-networks-about" />
      <DisqusComments />

    </div>
