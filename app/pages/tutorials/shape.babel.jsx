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
          <div className="post__description"> This post is Shape and ShapeSwirl. Modules that help you to bootsrap motion effects with declarative calls.</div>
          <ORXLine className="post__orx-line" />

          <h2>UI Use Cases</h2>

          <p>
            UI is another common use case for shapes. You can enhance UI motion with shapes, add effects or even implode them and use as part of UIs.
          </p>

          <p>
            Usually motion in UIs helps the user to catch a clue about position, purpose and intention of the UI element. The next demo illustrates how the shapes can be used to appeal user attention, saying "hey, you can close me right here" message:
          </p>

          <Pen pen="3e7e766d0d5eaa3fa953c56c394bc1b5" height="500"></Pen>

          <p>
            You can add more effects to the button to fit the mood of your current UIs:
          </p>

          <Pen pen="97d57587438de4d1e8592304a961be84" height="500"></Pen>

          <p>
            If user will click the close button, we can add a "bubble" fade effect to keep the vibes:
          </p>

          <Pen pen="181b4ba2ebb5a05d755647e9144a50d8" height="500"></Pen>

          <p>
            This is the entire experience (click the close button):
          </p>

          <Pen pen="3c49de2d7d0ca3e92bf5db5bf7a2687d" height="500"></Pen>

          <p>
            That's the exact same effect I've used in `Bubble Layout` demo a while ago, when was trying to convey the bubble interface (click on any circle to see the close button):
          </p>

          <Pen pen="yNOage" height="500"></Pen>

          <p>
            In the `Bubble Layout` demo you can notice two more effects that were made with shapes, - one is the subtle white ripple that spreads out when you click on any bubble, the second is the white collision effect right under the project image box when it jumps over the screen:
          </p>

          <Pen pen="e5fe8c0a9a0a2b387cfa2858ea7e2046" height="500"></Pen>

          <p>
            Also, since the shapes are tuneable, you can add effects to you UI regarding user interactions:
          </p>

          <Pen pen="a46534d118a64d2450e6a0e8e93541fd" height="500"></Pen>

          <p>
            Ok. Let's do another demo with shapes regarding UI. This time we will have a plus button, it shows up from bottom left, when it stops - it scales down and up imitating press motion, concurrent rotation imitates "let's go" gesture, inviting user to follow up with a click:
          </p>

          <Pen pen="1f6cce8046f76ca43aca3a5ac681b97c" height="500"></Pen>

          <p>
            We can expand the effect even more to appeal even more attention and add some playfull experience:
          </p>

          <Pen pen="51350c86ef0e0fb722e034006fcafb8f" height="500"></Pen>

          <p>
            If user doesn't click the button, let's add the callout vibration motion, mimicing incoming call:
          </p>

          <Pen pen="9935b7cec036eae2ddb762213ceae6d4" height="500"></Pen>

          <p>
            After user will click the button, we will show the quiz modal with two the most valiable questions we have ever had:
          </p>

          <Pen pen="2c95e0397b0d20eb4fbc952e3c5f0fe0" height="500"></Pen>

          <p>
            We have few effects here that composed with shapes - ripple inside a modal, few details in the top and bottom right corners. Also arrow of the modal and modal itself are nothing than just plain mojs shape. 
          </p>

          <p>
            Ok, now when the user hovers over the button, we need to show some tension, expressing that something is going to happen if he proceeds with a click (hover over buttons to see):
          </p>

          <Pen pen="ad612440c8b08d0b506e0a8cb4152b9c" height="500"></Pen>

          <p>
            Note how the modal inflates and gets bigger - the extend parts are nothing than plain shapes of `curve`, that just get scaled on user's iteraction (hover over buttons to see):
          </p>

          <Pen pen="4b54df04faa5b6c885a7b0222c842b5d" height="500"></Pen>

          <p>
            If the user leaves the button with his pointer, we need to show the tension relief, just few swirls would do here:
          </p>

          <Pen pen="" height="500"></Pen>

          <p>
            If user proceeds with the button click, we will blow up the modal as a consequqnce of modal's tension:
          </p>

          <Pen pen="" height="500"></Pen>

          <p>There are few gifs for you inspiration over the UI's shape application.</p>

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

          <h2>Recap</h2>

          <p>
            This tutorial describes how you can use shapes to enhance your animations, motion graphics sequences and UIs. You create a shape with a declarative call right there where you want it, without any bootstrapping. The `then` method allows you to chain the states of the shapes. You can `tune` shapes afterwards or re`generate` all random properties. Shapes obey the `tweenable` interface thus you have tween properties, callbacks and public method that any `tween` has.
          </p>

          <p>
            Need to admit that this post was written as an introduction to more complex and mature module that is called `Burst`, it was important to introduce base concepts and API's syntax here, so now you are ready to the meet the `Burst`!
          </p>

          <h2>Thank yous</h2>

          <p></p>

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