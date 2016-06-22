<h2>
  Animation Use Cases
</h2>

<p>
  Animation is another strong use case for the Shapes. You can compose some visual effects to support your main sequences thus enhancing it, giving them more details and depth.

  I've made a little animation demo I've made to illustrate the cases:
</p>

<Pen pen="3fe5eabaf7cfb83142bbd1be3f2f2850" height="500" />

<em>
  You can find the entire source code in <UniteLink link="https://github.com/legomushroom/shape-demo2">this repo</UniteLink> since the codepen code could be unreadable.
</em>

<p>
  The demo itself is a good illustration on how you can use shapes as "main actors" in your scenes becuase it was composed entirely with shapes. But there is few cases besides that that should be discussed.
</p>

<p>
  For instance, you can add the effect of collision of balls with ease:
</p>

<Pen pen="7315f4364360ec87a6655d33782702fe" height="500" />

<p>
  As you would expect, the effect itself was composed with bunch of shapes and swirls:
</p>

<Pen pen="c29f0b2ce24147e4886691b61b31b3fb" height="500"></Pen>

<p>
  The next effect, you can enhance this scene with is the "motion trails":
</p>

<Pen pen="92f9a7b05498b8a0be3734737a9cfc70" height="500"></Pen>

<p>
  Motion trail effect is ususally used to exaggerate velocity of the object that moves. Just a nice subtle details. The effect was composed with 2 shapes:
</p>

<Pen pen="fff0bcc079e0448bd0a72ee311ebadfa" height="500"></Pen>

<p>
  Another effect you can think of will be a "dust trail":
</p>

<Pen pen="6f7b05a45679964ccdf9212fa68075c8" height="500"></Pen>

<p>
  Effect itself was composed from bunch of swirls, first you want to make the swirls move downward somewhere into the ground:
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
  There is the same effect with simple object:
</p>

<Pen pen="633e6aa52d40691cca2f2cda91650bae" height="500"></Pen>

<em>
  Note: Again, this dust effect could be done with just one declarative call by using Burst or Stagger modules that we will discuss shortly, but for now Swirl will do too.
</em>

<p>
  That's would be basically it for animation use cases I'll give you. I hope you've got the idea, nonetheless most of applications are obvious so I won't hang here a lot. Just few gifs for you inspiration:
</p>

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

  <Gif className="gif--50-width" src="/gifs/shape-animation/LingoAsset-20.gif" />

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