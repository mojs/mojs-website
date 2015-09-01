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
EasingObjectGraph = require 'partials/easing-object-graph'

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

      <p style= { textAlign: 'left', fontSize: '.65em', opacity: '.75', marginTop: '15px' }>
        <a href="">demo on CodePen</a> | <a href="">demo's repo on GitHub</a> | 
        <a href="">mo· js on GitHub</a>
      </p>
      
      <ORXLine className="post__orx-line" />
      
      { ###
        <p>TODO: add links everywhere on the post</p>
        <p>TODO: add pens</p>
        <p>TODO: fix motion for the web demo</p>
        <p>TODO: add server rendering to this website</p>
        <p>TODO: move it to another repo</p>
        <p>TODO: buy domain</p>
        <p>TODO: make mojs' release</p>
        <p>TODO: add easing graph background</p>
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
        By contrast, excellent crafted easing appeal user's attention, araise curiosity
        and involvement.
        That's why so important to have full control of easing functions.
      </p>

      <p>
        Fortunately <span className="highlight">mo· js</span> 
        &nbsp;has the best set of easing functions of various 
        types in the modern web. Besides 
          <UniteLink link="/" isDisabled="true">
            Base Easing Functions
          </UniteLink>, 
          <UniteLink link="/" isDisabled="true">
            Bezier Curves
          </UniteLink> and 
          <UniteLink link="/" isDisabled="true">
            Springs
          </UniteLink> that you can find in other web animation libraries, 
          <span className="highlight">mo· js</span>
          &nbsp;has super precise easing function type 
          - <span className="highlight">Path Easing</span>.
          It allows you to draw your timing functions! 
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
                    onUpdate: function (progress) {
                      square.style.transform = 'translateY(' + 100*progress + 'px)';
                    }
                  }).start();
          """
        }
      </CodeSample>

      <em>
        <i>Note</i>: No vendor prefixes used in the code above for 
        clarity's sake but some browsers still do need them.
      </em>

      <p>
        We have one sloppy movement here, it doesn’t really look 
        like something falling down at all, so lets add bounce easing:
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var square = document.querySelector('#js-square');
                  new mojs.Tween({
                    onUpdate: function (progress) {
                      var bounceProgress = mojs.easing.bounce.out(progress);
                      square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
                    }
                  }).start();
          """
        }
      </CodeSample>

      <p>
        The bounce easing was added by passing the linear progress 
        thru <span className="highlight">bounce.out</span> function 
        (line 4)
        &nbsp;that is available on 
        <span className="highlight">mojs.easing</span> object - the place where 
        all easing functions and helpers are stored. 
        The result is pretty obvious - you probably did it thousands times - 
        we have something that kind of looking like falling object with it’s own physics, 
        despite the fact that it is not.
      </p>

      <p>
        If you'll think about it, this bounce easing represents our object's 
        parameters like the material it is made of or it's weight or acceleration it has. 
        Savvy readers starting to grasp the main problem with the usual easing function 
        - it is limited to one set of these parameters and we can’t change them 
        effecively - they are hardcoded into this graph:
      </p>

      <EasingObjectGraph
        duration={ 1000 }
        onUpdate = { (o)=>
          shift = 180*o.easedP
          mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
          "#{shift.toFixed(0)} px"
        }
        label="translateY"
        background="#F1E2D7"
        path="M0,100 C2.45434624,97.8269293 16.3464551,108.82637 36.7536484,1.51862764 C57.2239404,55.7168427 71.8396693,1.51862764 73.4575634,0.417637977 C82.7586528,14.6942143 89.6790662,2.18537229 91.391449,0 C95.988064,6.63361647 100,0 100,0">
        
        <div className="path-easing-rectangle"></div>
      
      </EasingObjectGraph>

      <p>
        But what if we want to change the weight parameter of our object so it will 
        have much wider bouncing amplitude range? That’s the point where the 
        <span className="highlight">path easing</span> become irreplaceable. 
        Lets jump to vector graphics editor with <a href="">this common graph</a> as a bootstrap. 
      </p>

      <em>
        <i>Note</i>: Any vector editor will do here, I prefer to use Sketch lately, 
        but any that can produce a <span className="highlight">SVG path</span> works.
      </em>

      <p>
        We will amplify the bouncing curves a bit, to add our motion feel of much more lighter object 
        (or much more bouncy one - made of rubber instead of wood).
        Thats what it the bouncy graph might look like:
      </p>

      <EasingObjectGraph
        duration={ 1500 }
        onUpdate = { (o)=>
          shift = 180*o.easedP
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
        There is my <a href="">.svg file</a> with the bouncy graph.
        Now we can generate our custom easing function from the SVG path commands the 
        path's <span className="highlight">d attribute</span> contains.
        For this simply copy the commands and pass it to 
        the <span className="highlight">mojs.easing.path</span> function (line 2):
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var square = document.querySelector('#js-square'),
                      bouncyEasing = mojs.easing.path('M0,100 C2.45434624,97.8269293 16.3464551,108.82637 36.7536484,1.51862764 C57.1552734,140.170898 73.4575653,0 73.4575634,0.417637977 C84.8740234,87.625 91.391449,0 91.391449,0 C97.2792969,51.6884766 100,0 100,0');

                  new Tween({
                    onUpdate: function (progress) {
                      var bounceProgress = bouncyEasing(progress);
                      square.style.transform = 'translateY(' + 100*bounceProgress + 'px)';
                    }
                  }).start();
          """
        }
      </CodeSample>

      <p>
        Yay! We've drawn our custom path easing!
        Our square feels much more bouncy now!
      </p>
      
      <p>
        You can imagine what amount of 
        freedom <span className="highlight">path easing</span> can give you 
        and how comprehensive your easing functions can now be. But it has much more 
        powerfull purposes, keep reading!
      </p>

      <em>
        <i>Note</i>: 
        As you can see in the <a href="">.svg file</a>, by default <span className="highlight">mo· js</span> expects you to draw your easing paths in rectangle of 100x100, but 
        you can change that with special option, we will talk about it a bit later, 
        in <span className="highlight">options</span> section of this tutorial.
      </em>

      <h2>Property curves</h2>

      <p>
        If you are familiar with After Effects workflow and have ever worked 
        with <a href="http://www.schoolofmotion.com/intro-to-animation-curves-in-after-effects/">animation curves </a> (go watch this video, I will wait on you here) 
        this idea won't be entirely new for you.
        If you haven't - no worries, it is pretty easy but be attentive it can change 
        the way you are treating your animations!
      </p>

      <p>
        Let me try to describe the idea of property curves in one sentence:
      </p>

      <Cite author="LegoMushroom">
        With property curves we can specify(or draw) 
        how would a certain property behave in time.
      </Cite>

      <p>
        Yes exactly. We can draw for instance, how a translate or scale(or any other) 
        propety will behave on progress change.
      </p>

      <p>
        Let me describe it more verbosely with code snippet and codepen.
        Imagine our previous rectangle is very heavy and not bouncy at all.
        When it hits the ground, it stays still and causes a small earthquake.
        That's what the quake graph will look like:
      </p>

      <EasingObjectGraph
        duration={ 250 }
        onUpdate = { (o)=>
          shift = 100*o.easedP
          mojs.h.style o.objEl, 'transform', "translateY(#{shift}px) translateZ(0)"
          "#{shift.toFixed(0)} px"
        }
        label="translateY"
        background="#F1E2D7"
        path="M0,100 C0,100 4.0173199,82.9648449 6.6417514,100 C9.2661829,116.22712 13.2779121,100 13.2779121,100 C13.2779121,100 16.5033366,87.4358263 21.4140571,100 C26.3247776,111.756139 30.6617252,100 30.6617252,100 C30.6617252,100 37.196174,76.3465416 36.5598618,100 C35.9235497,122.845424 43.9988668,100 43.9988668,100 C43.9988668,100 52.464346,75.7550222 58.5137014,100 C64.5630569,123.436943 71.5901242,100 71.5901242,100 C71.5901242,100 76.5794972,84.1964285 77.2506861,100 C77.921875,114.995537 86.5100569,100 86.5100569,100 C86.5100569,100 90.656647,90.8900683 92.252708,100 C93.84877,108.301897 97.195841,100 97.195841,100 C97.195841,100 98.303581,96.0117193 99.740517,100">
        
        <div className="path-easing-rectangle path-easing-rectangle--quake"></div>
      
      </EasingObjectGraph>

      <em>
        <i>Note</i>: This path easing is used in the final demo, 
        particularly when mole severely closes the door.
      </em>

      <p>
       Consider the graph at right. The <span className="highlight">x</span> axis represents progress of our animation.
       The <span className="highlight">y</span> axis is the change of our property in time, 
       in this particularly example this is <span className="highlight">translateY</span> property.
       As you can see, curve's <span className="highlight">Y</span> value shouldn't 
       start at <span className="highlight">0</span> and end 
       at <span className="highlight">1</span>, it can take any value you want.
       But the <span className="highlight">x</span> value must start 
       at <span className="highlight">0</span> and end 
       at <span className="highlight">1</span> because progress can't go 
       beyond <span className="highlight">100%</span> as it makes no sense.
       Now lets jump to codepen to see how does it work exactly:
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var square = document.querySelector('#js-square'),
                      quakeEasing = mojs.easing.path(''),
                      fallAmount = 100;

                  new mojs.Tween({
                    onUpdate: function (progress) {
                      var fallProgress = mojs.easing.cubic.in(progress);
                      square.style.transform = 'translateY(' + fallAmount*fallProgress + 'px)';
                    },
                    onComplete: function () { quakeTween.start(); }
                  }).start();

                  var quakeTween = new mojs.Tween({
                    onUpdate: function (progress) {
                      var quakeProgress = quakeEasing(progress);
                      // set translateY to the current translateY (fallAmount) 
                      // + (quakeProgress * 20)
                      square.style.transform = 'translateY(' + fallAmount + 20*quakeProgress + 'px)';
                    },
                  });
          """
        }
      </CodeSample>

      <p>
        In codepen above, we have changed the bouncy easing 
        to <span className="highlight">cubic.in</span> to express the gravity force
        that is appied to the rectangle (line 7). After the first tween completes, 
        it launches the second one (line 10) with the quake curve applied to the 
        <span className="highlight">translateY</span> property (line 18).
      </p>

      <em>
        <i>Note</i>: You probably want to add these tweens to a 
        <span className="highlight">timeline</span> for better project organization, it is 
        possible with <span className="highlight">mo· js</span> but was omitted here for clarity's sake.
      </em>

      <p>
        We can even draw a combined version of this two curves <span className="highlight">cubic.in + quake</span> to use it as one property curve:
      </p>

      <EasingObjectGraph
        duration = { 350  }
        delay    = { 2000 }
        onUpdate = { (o)=>
          shift = 180*o.easedP
          mojs.h.style o.objEl,   'transform', "translateY(#{shift}px) translateZ(0)"
          "#{shift.toFixed(0)} px"
        }
        label="translateY"
        background="#F1E2D7"
        path="M0,100 C0,100 35.8588122,105.035225 50,-1.95399252e-14 C50,0.404017439 52.0138856,-7.44383313 53.3295152,0.404017439 C54.6451448,8.25186829 56.6562278,0.404017439 56.6562278,0.404017439 C56.6562278,0.404017439 58.2731357,-5.33408001 60.7348837,0.404017439 C63.1966318,6.14211536 65.3707471,0.404017439 65.3707471,0.404017439 C65.3707471,0.404017439 68.6464714,-10.566858 68.3274876,0.404017439 C68.0085039,11.3748935 72.0566667,0.404017439 72.0566667,0.404017439 C72.0566667,0.404017439 76.3004181,-10.8459823 79.3329648,0.404017439 C82.3655115,11.6540177 85.8881858,0.404017439 85.8881858,0.404017439 C85.8881858,0.404017439 88.3893625,-6.8626772 88.72583,0.404017439 C89.0622975,7.67071265 93.3675599,0.404017439 93.3675599,0.404017439 C93.3675599,0.404017439 95.4462488,-3.7041028 96.2463554,0.404017439 C97.0464626,4.51213815 98.7243519,0.404017439 98.7243519,0.404017439 C98.7243519,0.404017439 99.2796628,-1.28731369 100,0">
        
        <div className="path-easing-rectangle path-easing-rectangle--eased-quake"></div>
      
      </EasingObjectGraph>



      <p>
        I hope you had the <span className="highlight">Aha!</span> moment right now. <br />
        Anyways I will add more use cases just to be sure you got it well.
      </p>

      <h2>More property curves examples</h2>

      <p>
        Pretend you need to animate a character that is angry and arguing to somebody.
        Meanwhile the blame his hand is waving in the air to exaggerate his bad mood.
        We can describe the hand angle property with a path like this:
      </p>

      <EasingObjectGraph
        onUpdate = { (o)=>
          angle = -200*o.easedP
          mojs.h.style o.objEl, 'transform', "rotate(#{angle}deg) translateZ(0)"
          "#{angle.toFixed(0)} deg"
        }
        label="angle"
        background="#F1E2D7"
        path="M0,100 L3.13085938,99.9098435 C11.128418,-42.5703735 24.7357688,10.2827309 24.7357688,10.2827309 C24.7357688,10.2827309 35.4207115,6.37990438 35.420711,19.4955507 C35.420711,19.4955507 35.4207115,28.4642364 38.4679491,20.0448329 C45.9122391,-2.47328083 48.2480469,19.2718256 49.4205542,19.2718262 C49.4205546,6.82379606 55.0592461,-3.56955878 59,15.8223683 C60.6251608,22.53696 56.8918457,-3.39703265 65.4951172,-3.39703265 C68.7340668,-3.59873581 69.730594,6.54639177 70.328125,13.9672245 C70.9301836,21.4442862 74.0961573,26.974048 74.7888322,18.7754178 C75.3742722,5.88443799 81.9388046,2.60654815 84.8170547,9.46624826 C88.6793176,21.7631952 90.7471271,6.55096632 93.7893906,-0.121967559 C95.5135217,-3.90369547 98.2082808,0.193576387 100,0">
        
        <div className="mole-hand"></div>
      
      </EasingObjectGraph>

      <em>
        <i>Note</i>: This path easing is used in the final demo, 
        particularly when mole tries to persuade bullies to stop 
        their knock-a-door-run game(as he dummy thinks).
      </em>

      <p>
        As you can see, the hand is in 0 position at the start, then rises steeply, 
        then twitching up and down the rest of the progress with relatively small
        angle delta. Despite the fact it can look like an easing(it 
        starts at 0 and ends at 1 Y), it is more likely a 
        <span className="highlight">property curve</span> since we are describing 
        how does certain property acts in time. Lets jump to the code:
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var hand = document.querySelector('#js-hand'),
                      handCurve = mojs.easing.path('M0,100 L3.13085938,99.9098435 C11.128418,-42.5703735 24.7357688,10.2827309 24.7357688,10.2827309 C24.7357688,10.2827309 35.4207115,6.37990438 35.420711,19.4955507 C35.420711,19.4955507 35.4207115,28.4642364 38.4679491,20.0448329 C45.9122391,-2.47328083 48.2480469,19.2718256 49.4205542,19.2718262 C49.4205546,6.82379606 55.0592461,-3.56955878 59,15.8223683 C60.6251608,22.53696 56.8918457,-3.39703265 65.4951172,-3.39703265 C68.7340668,-3.59873581 69.730594,6.54639177 70.328125,13.9672245 C70.9301836,21.4442862 74.0961573,26.974048 74.7888322,18.7754178 C75.3742722,5.88443799 81.9388046,2.60654815 84.8170547,9.46624826 C88.6793176,21.7631952 90.7471271,6.55096632 93.7893906,-0.121967559 C95.5135217,-3.90369547 98.2082808,0.193576387 100,0');

                  new Tween({
                    onUpdate: function (progress) {
                      var handProgress = handCurve(progress);
                      square.style.transform = 'rotate(' + -200*handProgress + 'deg)';
                    }
                  }).start();
          """
        }
      </CodeSample>

      <p>
        Now lets add another property curve for scale to imitate squash&stretch of the hand.
        That's how it will look like at it's own:
      </p>

      <EasingObjectGraph
        onUpdate = { (o)=>
          scaleX = 1-o.easedP; scaleY = 1+o.easedP
          mojs.h.style o.objEl, 'transform', "scaleX(#{scaleX}) scaleY(#{scaleY}) translateZ(0)"
          "scaleX(#{scaleX.toFixed(2)}) scaleY(#{scaleY.toFixed(2)})"
        }
        label="scale"
        background="#F1E2D7"
        path="M0,100 C0,100 5.01160836,100.097038 8.74856937,100.270866 C15.1440434,57.219434 23.7860103,98.447299 23.7860103,100.097037 C30.2913574,71.1380541 36.1603623,98.3939125 36.160361,100.162142 C41.9325738,44.182975 49.1344299,98.9199542 49.1344299,100.053418 C53.6287224,80.2298508 59.2720971,99.9303714 59.2720971,99.9303714 C59.2720971,99.9303714 63.6972656,56.5605469 70.2742418,100.003578 C72.7851563,131.47461 74.5979385,101.614397 75,100.097038 C78.8691406,68.734375 82.3889542,100.577847 94.1109085,100.097038 L100,100">
        
        <div className="mole-hand mole-hand--squash"></div>
      
      </EasingObjectGraph>

      <p>
        As you can notice, this property curve represents deviation from 0 
        and stays in range of about <span className="highlight">±.25</span>.
        To make the hand's squash&stretch motion, we can substract curve's value from 1 
        for <span className="highlight">scaleX</span> property and add the value to 
        1 for <span className="highlight">scaleY</span> property respectively.
        Waving and squash&stretch curves together:
      </p>

      <CodeSample pen="8312611e3618e83d4103390afc2c8bef">
        { js: """var hand = document.querySelector('#js-hand'),
                      handCurve = mojs.easing.path('M0,100 L3.13085938,99.9098435 C11.128418,-42.5703735 24.7357688,10.2827309 24.7357688,10.2827309 C24.7357688,10.2827309 35.4207115,6.37990438 35.420711,19.4955507 C35.420711,19.4955507 35.4207115,28.4642364 38.4679491,20.0448329 C45.9122391,-2.47328083 48.2480469,19.2718256 49.4205542,19.2718262 C49.4205546,6.82379606 55.0592461,-3.56955878 59,15.8223683 C60.6251608,22.53696 56.8918457,-3.39703265 65.4951172,-3.39703265 C68.7340668,-3.59873581 69.730594,6.54639177 70.328125,13.9672245 C70.9301836,21.4442862 74.0961573,26.974048 74.7888322,18.7754178 C75.3742722,5.88443799 81.9388046,2.60654815 84.8170547,9.46624826 C88.6793176,21.7631952 90.7471271,6.55096632 93.7893906,-0.121967559 C95.5135217,-3.90369547 98.2082808,0.193576387 100,0'),
                      handStretchCurve = mojs.easing.path('M0,100 L3.13085938,99.9098435 C11.128418,-42.5703735 24.7357688,10.2827309 24.7357688,10.2827309 C24.7357688,10.2827309 35.4207115,6.37990438 35.420711,19.4955507 C35.420711,19.4955507 35.4207115,28.4642364 38.4679491,20.0448329 C45.9122391,-2.47328083 48.2480469,19.2718256 49.4205542,19.2718262 C49.4205546,6.82379606 55.0592461,-3.56955878 59,15.8223683 C60.6251608,22.53696 56.8918457,-3.39703265 65.4951172,-3.39703265 C68.7340668,-3.59873581 69.730594,6.54639177 70.328125,13.9672245 C70.9301836,21.4442862 74.0961573,26.974048 74.7888322,18.7754178 C75.3742722,5.88443799 81.9388046,2.60654815 84.8170547,9.46624826 C88.6793176,21.7631952 90.7471271,6.55096632 93.7893906,-0.121967559 C95.5135217,-3.90369547 98.2082808,0.193576387 100,0');

                  new Tween({
                    onUpdate: function (progress) {
                      var handProgress = handCurve(progress);
                      var stretchProgress = handStretchCurve(progress);
                      
                      square.style.transform = ''
                        // squash&stretch
                        + 'scaleX(' + (1-stretchProgress) + ') scaleY(' + (1+stretchProgress) + ') '
                        // waving
                        + 'rotate(' + -200*handProgress + 'deg)';

                    }
                  }).start();
          """
        }
      </CodeSample>

      <p>
        I hope you have cristal clear understanding now what the property 
        curves are and how to use them. It is definitelly takes some time to wrap 
        head around this notion and start thinking in curves, but it will hundred percent worth your time investment. If you still unconfortable with this idea, feel 
        free to <a href="# link to websites repo / issues">ask me anything</a> by kick offing an issue on the repo. 
        I've build a bit more complicated demo almost entirely on this concept and 
        pushed it to <a href="# link to property curves demo repo">the github repo</a> so you can play with it more. Here <a href="# link to the demo pen">it is on CodePen</a> also!
      </p>

      <h2>Thinking in property curves</h2>

      <p>
        Now when you have some clue what the property curves are, this section will 
        help you to gain some skill how and when to use them. We can use curves in 
        <UniteLink link="https://vimeo.com/111574737">lots of different angles</UniteLink>, 
        but here I will show you how to think in curves when you want to move an object 
        on screen or transform it from one state to another.
      </p>

      <p>
        Consider the <UniteLink link="http://final demo">final demo</UniteLink>, particulary this 
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

          mojs.h.style(@moleEl, 'transform', "skewX(#{75*o.easedP}deg) translateZ(0)");

          "skewX(#{(100*o.easedP).toFixed(2)}deg)"
        }

        label="angle"
        background="#50E3C2"
        path="M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100">
        
        <MoleSample id="js-mole-sample-1" />

      </EasingObjectGraph>
      
      <p>
        Now lets describe hand's curve. We will work 
        with <span className="highlight">rotate</span> property obviously:
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

      <p>
        For the left hand we can use the same 
        <span className="highlight">skew</span> graph for 
        <span className="highlight">translate</span> and <span className="highlight">rotate</span> properties :
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

      <p>
        To implement mouth motion we need to scale it up, and then scale it down with 
        roughly the same cadance:
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

      <p>
        The <span className="highlight">skew</span> graph was added here for 
        the <span className="highlight">translateX</span> property, just to add 
        a small horizontal motion.
      </p>

      <p>
        Now lets add to the exhale motion some twitching to emphasize mole's effort by adding a "noize" curve. We will add this curve for all parts of our character:
      </p>
      
      <ul>
        <li> body: </li>
      </ul>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
          @scopeEl    ?= document.querySelector '#js-mole-sample-5'
          @moleEl     ?= @scopeEl.querySelector '#js-mole'
          @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
          @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
          @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'
          

          @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
          @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
          @mouthEasing ?= mojs.easing.path 'M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934'
          @noizeEasing ?= mojs.easing.path 'M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100'
  
          skewP  = @skewEasing o.p
          angleP = @handAngleEasing o.p
          mouthP = @mouthEasing o.p
          noizeP = @noizeEasing o.p

          mojs.h.style(@moleEl,         'transform', "skewX(#{75*skewP-(5*noizeP)}deg) skewY(#{25*noizeP}deg) translateZ(0)");

          mojs.h.style(@moleHandEl,     'transform', "rotate(#{-200*angleP}deg) translateZ(0)");
          mojs.h.style(@moleHandLeftEl, 'transform', "translate(#{100*skewP}px, #{-80*skewP}px) rotate(#{-110*skewP}deg) translateZ(0)");

          mojs.h.style(@mouthEl, 'transform', "scale(#{mouthP}) translateX(#{-100*skewP}px) translateZ(0)");

          "skewX(#{(75*skewP-(5*noizeP)).toFixed(2)}deg) skewY(#{(25*noizeP).toFixed(2)}deg)"
        }

        label="scale"
        background="#50E3C2"
        path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
        
        <MoleSample id="js-mole-sample-5" />

      </EasingObjectGraph>


      <ul>
        <li> hand: </li>
      </ul>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
          @scopeEl    ?= document.querySelector '#js-mole-sample-6'
          @moleEl     ?= @scopeEl.querySelector '#js-mole'
          @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
          @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
          @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'
          

          @skewEasing ?= mojs.easing.path 'M0,100 C0,100 18.1450901,69.0663515 24.0949898,99.9609384 C30.0448895,130.855525 100,100 100,100'
          @handAngleEasing ?= mojs.easing.path 'M0,100 C0,100 12.0486221,-124.260309 24,99.7583642 C28.9933624,142.723104 100,100 100,100'
          @mouthEasing ?= mojs.easing.path 'M0,0 C0,-145.307194 29.1828098,57.0115012 32.0031223,63.7232245 C86.2226562,57.0115012 100,72.4825934 100,72.4825934'
          @noizeEasing ?= mojs.easing.path 'M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100'
  
          skewP  = @skewEasing o.p
          angleP = @handAngleEasing o.p
          mouthP = @mouthEasing o.p
          noizeP = @noizeEasing o.p

          mojs.h.style(@moleEl,         'transform', "skewX(#{75*skewP-(5*noizeP)}deg) skewY(#{25*noizeP}deg) translateZ(0)");

          mojs.h.style(@moleHandEl,     'transform', "rotate(#{-200*angleP + 30*noizeP}deg) translateZ(0)");
          mojs.h.style(@moleHandLeftEl, 'transform', "translate(#{100*skewP}px, #{-80*skewP}px) rotate(#{-110*skewP}deg) translateZ(0)");

          mojs.h.style(@mouthEl, 'transform', "scale(#{mouthP}) translateX(#{-100*skewP}px) translateZ(0)");

          "skewX(#{(75*skewP-(5*noizeP)).toFixed(2)}deg) skewY(#{(25*noizeP).toFixed(2)}deg)"
        }

        label="scale"
        background="#50E3C2"
        path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
        
        <MoleSample id="js-mole-sample-6" />

      </EasingObjectGraph>


      <ul>
        <li> glasses, mouth and cone: </li>
      </ul>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
          @scopeEl    ?= document.querySelector '#js-mole-sample-7'
          @moleEl     ?= @scopeEl.querySelector '#js-mole'
          @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
          @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
          @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'
          @coneEl     ?= @scopeEl.querySelector '#js-mole-hat-cone'
          @glassesEl  ?= @scopeEl.querySelector '#js-mole-glasses'
          @glassesLeftEl  ?= @scopeEl.querySelector '#js-mole-glasses-left'

          @moleEyeEl ?= @scopeEl.querySelector('#js-mole-eye')
          @moleEyeLashEl ?= @scopeEl.querySelector('#js-mole-eye-lash')
          

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


          "translateY(#{(-40*noizeP).toFixed(2)}px)"
        }

        label="scale"
        background="#50E3C2"
        path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
        
        <MoleSample id="js-mole-sample-7" />

      </EasingObjectGraph>

      <p>
        To emplement toungue's motion we need to wrap it with 
        a <span className="highlight">overflow: hidden;</span> wrapper,
        then apply the very first <span className="highlight">skew</span> graph
        for <span className="highlight">translate</span> property:
      </p>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
          @scopeEl    ?= document.querySelector '#js-mole-sample-8'
          @tongueEl   ?= @scopeEl.querySelector '#js-sample-tongue'

          mojs.h.style(@tongueEl, 'transform', "translateX(#{-550*o.easedP}px)")
          
          "translateX(#{(-550*o.easedP).toFixed(2)}px)"
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
        Now we can add <span className="highlight">noize</span> curve to imitate 
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
          @tonguePathEl.setAttribute('d', "M0 30 Q 20 #{10+(550*o.easedP)}, 30 25 T 50 30");
          
          "M0 30 Q 20 #{10+(550*o.easedP).toFixed(2)}, 30 25 T 50 30"
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
        Now lets add tongue to the entire scene:
      </p>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
          @scopeEl    ?= document.querySelector '#js-mole-sample-10'
          @moleEl     ?= @scopeEl.querySelector '#js-mole'
          @moleHandEl ?= @scopeEl.querySelector '#js-mole-hand'
          @moleHandLeftEl ?= @scopeEl.querySelector '#js-mole-hand-left'
          @mouthEl    ?= @scopeEl.querySelector '#js-mole-mouth'
          @coneEl     ?= @scopeEl.querySelector '#js-mole-hat-cone'
          @glassesEl  ?= @scopeEl.querySelector '#js-mole-glasses'
          @glassesLeftEl  ?= @scopeEl.querySelector '#js-mole-glasses-left'
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
          
          "M0 30 Q 20 #{10+(550*noizeP).toFixed(2)}, 30 25 T 50 30"
        }

        label="path's d attribute"
        background="#50E3C2"
        path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
        
        <MoleSample id="js-mole-sample-10" />

      </EasingObjectGraph>

      <em>
        <i>Note</i>:
        For simplisity's sake we omited the eye motion.
      </em>

      <p>
        The latest touch would be to add <span className="highlight">mo· js'</span> special module type - <span className="highlight">effect generator</span> or <span className="highlight">particle emitter</span>. It is capable of generating different effects in declarative way. This one is called <span className="highlight">Burst</span> and it is out of scope of this tutorial.
      </p>

      <EasingObjectGraph
        duration = { 1800 }
        onUpdate = { (o)->
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
          
          "M0 30 Q 20 #{10+(550*noizeP).toFixed(2)}, 30 25 T 50 30"
        }

        label="path's d attribute"
        background="#50E3C2"
        path="M0,100 L24.2114672,99.7029845 L27.0786839,106.645089 L29.2555809,93.3549108 L32.0340385,103.816964 L35.3459816,94.6015626 L38.3783493,103.092634 L41.0513382,95.9547991 L43.7739944,106.645089 L45.6729927,96.8973214 L50,105.083147 L53.3504448,93.3549108 L57.7360497,103.816964 L60.8616066,95.9547991 L65.0345993,103.092634 L68.6997757,97.5106029 L71.6646194,102.03125 L75.5066986,96.5672433 L78.2949219,102.652344 L81.0313873,96.8973214 L84.0174408,102.328264 L86.0842667,97.7332592 L88.7289352,101.606306 L91.1429977,98.3533763 L94.3822556,101.287388 L97.0809174,98.7254467 L100,100">
        
        <MoleSample id="js-mole-sample-11" />

      </EasingObjectGraph>


      <p>
        That's basically it. We have used 4 property curves to bring our mole to life. 
        I hope you enjoined the process. Thinking in curves could be totally new  
        mindset for you, but it gets very convinient and intuitive when you are 
        using it for a few times.
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
        When you generate an easing function from a SVG path, 
        the <span className="highlight">mojs.easing.path</span> samples 
        it's coordinates' values. 
        The <span className="highlight">precompute</span> option defines how 
        much samples you would like to take from the path on initialization stage 
        in range of <span className="highlight">100 - 10000</span>. More samples, means 
        your result easing function would be more performant on runtime, but it will 
        take longer to take all the samples, so to initialize.
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
        The <span className="highlight">rect</span> option provides 
        to <span className="highlight">mojs.easing.path</span> the rectangle size, 
        the path was drawn in. By default the rectangle 
        is <span className="highlight">100x100</span>, but you can 
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
        much more complex and powerfull easing paths, to descibe some property 
        change in time with a graph.
      </p>

      <p>
        You can also control how fast/precise your custom easing function will be 
        with <span className="highlight">precompute</span> and 
        <span className="highlight">eps</span> options. 
        The <span className="highlight">rect</span> option 
        specifies the rectangle's size the easing path was drawn in.
      </p>

      <p>
        It is worth noting that when you draw your easing path, 
        it must start at 0 and end at 100 
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
        In a short future we are planning to add a page with a searchable list of path easings with live examples and graphs.
        So developers can collaborate and share their easing paths and find ones 
        that suite their current needs.
        <br />
        Bunch of great stuff is comming up on other topics also so stay tuned!
      </p>

      <br />

      <p style= { textAlign: 'center' }>
        <UniteLink link="http://codepen.io/">demo on CodePen</UniteLink> | 
        <UniteLink link="http://github.com/">demo's repo on GitHub</UniteLink> | 
        <UniteLink link="http://github.com/legomushroom/mojs/">mo · js on GitHub</UniteLink>
      </p>

      <p style= { textAlign: 'center' }>
        <br />
        Next: &nbsp;<UniteLink link="/tutorials/mix" isDisabled="true" className="highlight">Easing: Mix tutorial</UniteLink>
      </p>

      <ORXLine className="post__last-orx-line" type="center" />
      <SocialNetworksAbout className="post__social-networks-about" />
      <DisqusComments />

    </div>
