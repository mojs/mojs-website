webpackJsonp([1],{

/***/ 1:
/***/ function(module, exports, __webpack_require__) {

	var FirstBall;

	FirstBall = (function() {
	  function FirstBall(o) {
	    this.o = o != null ? o : {};
	    this.vars();
	    return this.create();
	  }

	  FirstBall.prototype.vars = function() {
	    this.S = this.o.S;
	    this.FALL_EASING = 'cubic.in';
	    return this.RISE_EASING = 'cubic.out';
	  };

	  FirstBall.prototype.create = function() {
	    var ball, ballStart, burst1, burst2, burst3, circle, gooDur, mp, radiusDeltaX, radiusDeltaY, retrunValue, trail1, trail2, trail3, yDelta;
	    radiusDeltaX = {};
	    radiusDeltaY = {};
	    radiusDeltaX[this.o.CIRCLE_RADIUS / 2] = 2 * this.o.CIRCLE_RADIUS;
	    radiusDeltaY[1.5 * this.o.CIRCLE_RADIUS] = this.o.CIRCLE_RADIUS / 2;
	    yDelta = {};
	    yDelta[0] = this.o.CIRCLE_RADIUS;
	    ballStart = -40;
	    trail1 = new mojs.Transit({
	      x: this.o.o2Left,
	      y: ballStart,
	      parent: this.o.ctx,
	      angle: 90,
	      delay: this.o.BALL_1_START * this.S,
	      duration: 600 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowInit: true,
	      isShowEnd: true,
	      strokeDasharray: this.o.TRAIL_DASH,
	      easing: this.FALL_EASING,
	      strokeWidth: 1,
	      opacity: this.o.TRAIL_OPACITY,
	      stroke: this.o.TRAIL_COLOR,
	      radius: {
	        0: 135
	      },
	      shiftY: {
	        0: 135
	      }
	    }).then({
	      opacity: 0,
	      duration: this.o.TRAIL_FADE * this.S,
	      delay: 0,
	      radius: 135,
	      shiftY: 135
	    });
	    trail2 = new mojs.Transit({
	      x: this.o.o2Left,
	      y: this.o.bottomLine - 92,
	      parent: this.o.ctx,
	      delay: (this.o.BALL_1_START + 700) * this.S,
	      duration: 400 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowInit: true,
	      isShowEnd: true,
	      strokeDasharray: this.o.TRAIL_DASH,
	      easing: this.RISE_EASING,
	      strokeWidth: 1,
	      opacity: this.o.TRAIL_OPACITY,
	      stroke: this.o.TRAIL_COLOR,
	      radius: {
	        0: 85
	      },
	      shiftY: {
	        85: 0
	      },
	      angle: 270
	    }).then({
	      opacity: 0,
	      duration: this.o.TRAIL_FADE * this.S,
	      delay: 0,
	      radius: 85,
	      shiftY: 0
	    });
	    trail3 = new mojs.Transit({
	      x: this.o.o2Left,
	      y: this.o.topLine,
	      parent: this.o.ctx,
	      delay: (this.o.BALL_1_START + 1150) * this.S,
	      duration: 375 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowInit: true,
	      isShowEnd: true,
	      strokeDasharray: this.o.TRAIL_DASH,
	      easing: this.FALL_EASING,
	      strokeWidth: 1,
	      opacity: this.o.TRAIL_OPACITY,
	      stroke: this.o.TRAIL_COLOR,
	      radius: {
	        0: 85
	      },
	      shiftY: {
	        0: 85
	      },
	      angle: 90
	    }).then({
	      opacity: 0,
	      duration: this.o.TRAIL_FADE * this.S,
	      delay: 0,
	      radius: 85,
	      shiftY: 85
	    });
	    gooDur = 50;
	    ball = new mojs.Transit({
	      parent: this.o.ctx,
	      type: 'circle',
	      stroke: 'white',
	      strokeWidth: this.STROKE_WIDTH,
	      fill: 'transparent',
	      radiusX: radiusDeltaX,
	      radiusY: radiusDeltaY,
	      isShowInit: true,
	      isShowEnd: true,
	      isRunLess: this.o.IS_RUNLESS,
	      delay: (this.o.BALL_1_START + 600) * this.S,
	      y: yDelta,
	      duration: gooDur * this.S
	    }).then({
	      y: 0,
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: 100 * this.S,
	      delay: 0
	    }).then({
	      radiusX: this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS,
	      duration: 150 * this.S,
	      delay: 0
	    }).then({
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: 150 * this.S,
	      delay: 400 * this.S
	    }).then({
	      y: this.o.CIRCLE_RADIUS,
	      radiusX: 1.5 * this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS / 2,
	      duration: gooDur * this.S,
	      delay: 50 * this.S
	    }).then({
	      y: 0,
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: 150 * this.S,
	      delay: 0 * this.S
	    }).then({
	      y: this.o.CIRCLE_RADIUS,
	      radiusX: 1.5 * this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS / 2,
	      duration: gooDur * this.S,
	      delay: (this.o.BALL_2_ARCDUR - 2 * gooDur) * this.S
	    }).then({
	      y: 0,
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: 150 * this.S,
	      delay: 0
	    }).then({
	      y: this.o.CIRCLE_RADIUS,
	      radiusX: 1.5 * this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS / 2,
	      duration: gooDur * this.S,
	      delay: (this.o.BALL_3_ARCDUR - 2 * gooDur) * this.S
	    }).then({
	      y: 0,
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: 150 * this.S,
	      delay: 0 * this.S
	    }).then({
	      y: this.o.CIRCLE_RADIUS,
	      radiusX: 1.5 * this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS / 2,
	      duration: gooDur * this.S,
	      delay: (this.o.BALL_4_ARCDUR - 2 * gooDur) * this.S
	    }).then({
	      y: 0,
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: 150 * this.S,
	      delay: 0 * this.S
	    }).then({
	      y: this.o.CIRCLE_RADIUS,
	      radiusX: 1.5 * this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS / 2,
	      duration: gooDur * this.S,
	      delay: (this.o.BALL_5_ARCDUR - 2 * gooDur) * this.S
	    }).then({
	      y: 0,
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: 150 * this.S,
	      delay: 0 * this.S
	    }).then({
	      y: this.o.CIRCLE_RADIUS,
	      radiusX: 1.5 * this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS / 2,
	      duration: gooDur * this.S,
	      delay: (this.o.BALL_6_ARCDUR - 2 * gooDur) * this.S
	    }).then({
	      y: 0,
	      radiusX: this.o.CIRCLE_RADIUS / 2,
	      radiusY: 1.5 * this.o.CIRCLE_RADIUS,
	      duration: (this.o.BALL_7_ARCDUR / 3) * this.S,
	      delay: 0
	    }).then({
	      radiusX: this.o.CIRCLE_RADIUS,
	      radiusY: this.o.CIRCLE_RADIUS,
	      duration: (3 * this.o.BALL_7_ARCDUR) * this.S,
	      delay: 0,
	      easing: 'elastic.out'
	    });
	    ball.el.style.opacity = 0;
	    mp = new mojs.MotionPath({
	      path: "M" + this.o.o2Left + "," + ballStart + " L" + this.o.o2Left + ", " + (this.o.bottomLine - this.o.CIRCLE_RADIUS),
	      el: ball.el,
	      duration: 600 * this.S,
	      easing: this.FALL_EASING,
	      delay: this.o.BALL_1_START * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      onUpdate: function(p) {
	        return ball.el.style.opacity = 5 * p;
	      }
	    }).then({
	      isReverse: true,
	      pathStart: .35,
	      easing: this.RISE_EASING,
	      delay: (this.o.DOWN_DUR + gooDur) * this.S,
	      duration: 400 * this.S
	    }).then({
	      isReverse: false,
	      easing: this.FALL_EASING,
	      delay: 0
	    });
	    burst1 = new mojs.Burst({
	      parent: this.o.ctx,
	      x: this.o.o2Left,
	      y: this.o.bottomLineBurst,
	      degree: 180,
	      angle: 90,
	      radius: {
	        10: 25
	      },
	      type: 'line',
	      stroke: this.o.YELLOW,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_1_START + 600) * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          7: 0
	        }
	      },
	      onStart: (function(_this) {
	        return function() {
	          return _this.o.playSound(_this.o.bells1);
	        };
	      })(this)
	    });
	    circle = new mojs.Transit({
	      parent: this.o.ctx,
	      x: this.o.o2Left,
	      y: 55,
	      type: 'circle',
	      radius: 3 * this.o.CIRCLE_RADIUS,
	      fill: 'transparent',
	      strokeWidth: this.o.STROKE_WIDTH,
	      stroke: this.o.PINK,
	      strokeDasharray: '100% 200%',
	      strokeDashoffset: {
	        '100%': '50%'
	      },
	      angle: 180,
	      delay: (this.o.BALL_1_START + 700) * this.S,
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    }).then({
	      strokeDashoffset: '100%',
	      angle: 360,
	      delay: 0
	    });
	    burst2 = new mojs.Burst({
	      parent: this.o.ctx,
	      x: this.o.o2Left,
	      y: this.o.bottomLineBurst,
	      degree: 180,
	      angle: 90,
	      radius: {
	        10: 25
	      },
	      type: 'line',
	      stroke: this.o.CYAN,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_1_START + this.o.BALL_1_ARCDUR - gooDur) * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          7: 0
	        }
	      }
	    });
	    burst3 = new mojs.Burst({
	      parent: this.o.ctx,
	      x: this.o.o2Left + 30,
	      y: this.o.bottomLineBurst + 15,
	      angle: 90,
	      radius: {
	        4: 20
	      },
	      type: 'line',
	      count: 4,
	      degree: 360,
	      stroke: this.o.PINK,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_2_START + 1200) * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    return retrunValue = {
	      tweens: [burst1.tween, burst2.tween, burst3.tween, mp.tween, ball.tween, circle.tween, trail1.tween, trail2.tween, trail3.tween],
	      ball: ball
	    };
	  };

	  return FirstBall;

	})();

	module.exports = FirstBall;


/***/ },

/***/ 131:
/***/ function(module, exports, __webpack_require__) {

	var Ball_1, Ball_2, Ball_3, Ball_4, Ball_5, Ball_6, Ball_7, Howl, Main, mojs,
	  indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

	mojs = __webpack_require__(62);

	Howl = __webpack_require__(311).Howl;

	mojs.isDebug = false;

	Ball_1 = __webpack_require__(1);

	Ball_2 = __webpack_require__(226);

	Ball_3 = __webpack_require__(227);

	Ball_4 = __webpack_require__(228);

	Ball_5 = __webpack_require__(229);

	Ball_6 = __webpack_require__(230);

	Ball_7 = __webpack_require__(231);

	Main = (function() {
	  Main.prototype.CYAN = '#11CDC5';

	  Main.prototype.PINK = '#FC2D79';

	  Main.prototype.YELLOW = '#F9DD5E';

	  Main.prototype.ORANGE = '#FCB635';

	  Main.prototype.WHITE = '#FDFDFD';

	  Main.prototype.S = .7;

	  Main.prototype.DELAY_START = 0;

	  Main.prototype.STROKE_WIDTH = 2;

	  Main.prototype.CIRCLE_RADIUS = 5;

	  Main.prototype.IS_RUNLESS = true;

	  function Main() {
	    this;
	  }

	  Main.prototype.init = function() {
	    this.vars();
	    this.listenSlider();
	    this.createBits();
	    this.createSounds();
	    return this;
	  };

	  Main.prototype.vars = function() {
	    this.slider = document.querySelector('#js-slider');
	    this.ctx = document.querySelector('#js-svg-canvas');
	    this.repeat = document.querySelector('#js-repeat');
	    this.controls = document.querySelector('#js-controls');
	    this.pin = document.querySelector('#js-pin');
	    this.sound = document.querySelector('#js-sound');
	    this.ctxWidth = 480;
	    this.ctxHeight = 400;
	    this.centerX = this.ctxWidth / 2;
	    this.centerY = this.ctxHeight / 2;
	    this.o2Left = 287;
	    this.topLine = 65;
	    this.bottomLine = 240;
	    this.bottomLineBurst = this.bottomLine + 10;
	    this.CHARS_TOP = this.bottomLine - 70;
	    this.CHAR_DUR = 2500;
	    this.DOWN_DUR = 50;
	    this.BALL_1_START = this.DELAY_START;
	    this.BALL_1_ARCDUR = 1600;
	    this.BALL_2_START = this.BALL_1_START + this.BALL_1_ARCDUR;
	    this.BALL_2_ARCDUR = 800;
	    this.BALL_3_START = this.BALL_2_START + this.BALL_2_ARCDUR + 100;
	    this.BALL_3_ARCDUR = 800;
	    this.BALL_4_START = this.BALL_3_START + this.BALL_3_ARCDUR + 100;
	    this.BALL_4_ARCDUR = 800;
	    this.BALL_5_START = this.BALL_4_START + this.BALL_4_ARCDUR + 100;
	    this.BALL_5_ARCDUR = 800;
	    this.BALL_6_START = this.BALL_5_START + this.BALL_5_ARCDUR + 100;
	    this.BALL_6_ARCDUR = 800;
	    this.BALL_7_START = this.BALL_6_START + this.BALL_6_ARCDUR + 100;
	    this.BALL_7_ARCDUR = 600;
	    this.STAGGER_COLORS = [this.PINK, this.CYAN, this.WHITE];
	    this.STAGGER_EASING = 'sin.out';
	    this.BG = '#3a0839';
	    this.TRAIL_DASH = '4 4';
	    this.TRAIL_WIDTH = 1;
	    this.TRAIL_FADE = 400;
	    this.TRAIL_COLOR = 'white';
	    this.TRAIL_OPACITY = .5;
	    this.isIOS = this.isIOSSafari();
	    this.isOn = !this.isIOS;
	    !this.isIOS && this.sound.classList.add('is-on');
	    this.clickHandler = this.isIOS || this.isTouch() ? 'touchstart' : 'click';
	    this.tween = new mojs.Tween({
	      onUpdate: (function(_this) {
	        return function(p) {
	          _this.progress = p;
	          if (_this.tween.state === 'play') {
	            return _this.slider.value = p * 100000;
	          }
	        };
	      })(this),
	      onStart: (function(_this) {
	        return function() {
	          return !_this.isPinned && _this.controls.classList.remove('is-shown');
	        };
	      })(this),
	      onComplete: (function(_this) {
	        return function() {
	          return _this.controls.classList.add('is-shown');
	        };
	      })(this)
	    });
	    return this.clickArea = new mojs.Transit({
	      type: 'circle',
	      fill: this.WHITE,
	      opacity: {
	        .5: 0
	      },
	      isRunLess: true,
	      radius: {
	        0: 25
	      },
	      parent: this.controls,
	      easing: 'cubic.out'
	    });
	  };

	  Main.prototype.isIOSSafari = function() {
	    var userAgent;
	    userAgent = window.navigator.userAgent;
	    return userAgent.match(/iPad/i) || userAgent.match(/iPhone/i);
	  };

	  Main.prototype.isTouch = function() {
	    var isIETouch;
	    isIETouch = navigator.maxTouchPoints > 0 || navigator.msMaxTouchPoints > 0;
	    return indexOf.call(window, 'ontouchstart') >= 0 || isIETouch;
	  };

	  Main.prototype.listenSlider = function() {
	    var controlsStep, it;
	    it = this;
	    this.slider.addEventListener('input', function(e) {
	      if (it.tween.state === 'play') {
	        it.tween.pause();
	        it.bells1.stop();
	      }
	      return it.tween.setProgress(this.value / 100000);
	    });
	    controlsStep = 27;
	    this.addEvent(this.repeat, (function(_this) {
	      return function() {
	        _this.clickArea.run({
	          x: 12,
	          y: 10
	        });
	        _this.bells1.stop();
	        return _this.tween.restart();
	      };
	    })(this));
	    this.addEvent(this.pin, (function(_this) {
	      return function(e) {
	        _this.clickArea.run({
	          x: 12 + 1 * controlsStep,
	          y: 10
	        });
	        _this.pin.classList.toggle('is-pinned');
	        return _this.isPinned = !_this.isPinned;
	      };
	    })(this));
	    return this.addEvent(this.sound, (function(_this) {
	      return function(e) {
	        _this.clickArea.run({
	          x: 12 + 2 * controlsStep,
	          y: 10
	        });
	        if (!_this.isOn) {
	          _this.bells1.play().pos(_this.progress * 5.14858);
	        } else {
	          _this.bells1.stop();
	        }
	        _this.sound.classList.toggle('is-on');
	        return _this.isOn = !_this.isOn;
	      };
	    })(this));
	  };

	  Main.prototype.createBits = function() {
	    this.createBall_1();
	    return this.createBalls();
	  };

	  Main.prototype.createBall_1 = function() {
	    var ball_1;
	    ball_1 = new Ball_1(this);
	    this.tween.add(ball_1.tweens);
	    return this.mainBall = ball_1.ball;
	  };

	  Main.prototype.createBalls = function() {
	    this.tween.add(new Ball_2(this));
	    this.tween.add(new Ball_3(this));
	    this.tween.add(new Ball_4(this));
	    this.tween.add(new Ball_5(this));
	    this.tween.add(new Ball_6(this));
	    return this.tween.add(new Ball_7(this));
	  };

	  Main.prototype.isOpera = function() {
	    var userAgent;
	    userAgent = navigator.userAgent;
	    return /^Opera\//.test(userAgent) || /\x20OPR\//.test(userAgent);
	  };

	  Main.prototype.createSounds = function() {
	    var audio, ext;
	    ext = this.isOpera() ? 'wav' : 'mp3';
	    audio = __webpack_require__(224)("./bells-1-half." + ext);
	    return this.bells1 = new Howl({
	      urls: [audio]
	    });
	  };

	  Main.prototype.run = function() {
	    return setTimeout(((function(_this) {
	      return function() {
	        return _this.tween.start();
	      };
	    })(this)), 500);
	  };

	  Main.prototype.playSound = function(audio) {
	    if (!this.isOn) {
	      return;
	    }
	    return audio.play();
	  };

	  Main.prototype.addEvent = function(el, handler) {
	    return el.addEventListener(this.clickHandler, handler);
	  };

	  return Main;

	})();

	module.exports = Main;


/***/ },

/***/ 204:
/***/ function(module, exports, __webpack_require__) {

	module.exports = "<div id=\"js-controls\" class=\"motion__controls controls\">\n  <div id=\"js-repeat\" title=\"restart\" class=\"controls__repeat\">\n    <svg class=\"motion-demo-icon motion-demo-icon--repeat\">\n      <path d=\"M5.03868442,0.355114828 C5.18894493,0.105224017 5.48268728,-0.0462129771 5.76249569,0.0127011539 C6.07958679,0.0633119511 6.33566986,0.367372131 6.34885061,0.703064059 C6.3544995,0.854105656 6.31684022,1.00672884 6.2403919,1.13483742 C6.01933195,1.49425316 5.79074015,1.84852874 5.56591427,2.2055721 C6.05774441,2.20636289 6.54957455,2.19805956 7.04102809,2.21506162 C9.1710367,2.28741925 11.2053908,3.45779393 12.5065187,5.21216977 C13.1512455,6.0749257 13.6238694,7.08476926 13.8483187,8.15748092 C14.1955372,9.7932377 13.9338053,11.5464273 13.1945537,13.0252116 C12.5558524,14.3055066 11.5661666,15.3968019 10.3610698,16.1006083 C9.29907824,16.7312663 8.06874971,17.0539101 6.8482126,16.9926236 C5.29175475,16.9309417 3.75789246,16.3097732 2.57426144,15.2441787 C1.61093718,14.3830044 0.892398202,13.2347719 0.482288694,11.9805731 C0.139212695,10.9481919 -0.00690529302,9.84938406 0.000249969294,8.75848414 C0.0119243447,8.50226698 0.16030189,8.2606795 0.377595908,8.14403743 C0.630666239,7.99932218 0.966586975,8.04360663 1.17634914,8.25118998 C1.34242654,8.40341777 1.41812169,8.6378881 1.41096642,8.86524129 C1.41849828,9.8181477 1.55105893,10.7777759 1.87266914,11.6721635 C2.24135345,12.7199652 2.88570365,13.6661499 3.73868623,14.3387199 C4.60974527,15.0318506 5.68190484,15.4351554 6.77138768,15.5063268 C7.76257981,15.5818476 8.76958883,15.339074 9.63801172,14.8345476 C11.0483516,14.0247748 12.0930199,12.5566663 12.4473937,10.9118154 C12.6654409,9.91818311 12.6323007,8.86168272 12.3193521,7.89414662 C11.6670935,5.84322314 9.9144308,4.23633033 7.89852979,3.80851094 C7.1287742,3.6376995 6.33830601,3.69859061 5.55762923,3.68910109 C5.78207851,4.03467794 6.0008789,4.38460415 6.22231544,4.73255338 C6.33679964,4.91048197 6.38123759,5.14099833 6.32437208,5.34937247 C6.25846835,5.62733646 6.0219681,5.8483633 5.75232769,5.88908918 C5.49360847,5.93732759 5.21831916,5.81277759 5.06881184,5.58740138 C4.61313461,4.87805943 4.16724879,4.16160033 3.71307793,3.45107219 C3.52591133,3.19287804 3.48712227,2.8208096 3.65809538,2.54245022 C4.1145258,1.81057064 4.58112422,1.08620361 5.03868442,0.355114828 L5.03868442,0.355114828 Z\"></path>\n    </svg>\n  </div>\n  <div id=\"js-pin\" title=\"pin controls\" class=\"controls__pin\">\n    <svg class=\"motion-demo-icon motion-demo-icon-pin\">\n      <path d=\"M10.7772521,0.114644447 C11.0728744,-0.0974931962 11.4818173,0.00537894361 11.7190841,0.254797672 C13.5173892,1.88144866 15.3254311,3.49943828 17.123683,5.12507318 C17.415243,5.36043878 17.4760583,5.8208441 17.232408,6.1107499 C16.8238047,6.61715298 16.360762,7.07648376 15.9372918,7.57143937 C15.7124273,7.81145418 15.4865816,8.12997453 15.1220085,8.13481661 C14.8446178,8.15037293 14.6281468,7.94775192 14.40797,7.81053374 C13.7739209,8.52641555 13.092382,9.21116301 12.5040032,9.96235008 C13.0865761,12.0949108 12.5631712,14.5136636 11.0560428,16.1484857 C10.7885298,16.4691897 10.2707739,16.4484366 9.99238571,16.1532854 C8.74451102,15.0347397 7.50332427,13.9076925 6.25352353,12.7912856 C4.5643298,14.6271997 2.91909329,16.5046221 1.23203863,18.3424618 C0.964849616,18.6499034 0.446769701,18.6424127 0.184002968,18.3342162 C-0.0900583395,18.0632914 -0.0410623576,17.59815 0.219269954,17.3348799 C1.85658474,15.481307 3.54625322,13.6738968 5.16763156,11.8079136 C3.92178943,10.6892615 2.67600055,9.57162543 1.43604308,8.44858935 C1.11324916,8.20059625 1.03340432,7.68820623 1.32744257,7.38750864 C2.79644063,5.7251372 5.15174112,4.93229392 7.33255721,5.32133121 C7.99302501,4.62342366 8.62450902,3.89748742 9.26888063,3.18412128 C9.00910047,2.91346697 8.727899,2.52574468 8.95044304,2.14422651 C9.2094711,1.73939972 9.57684565,1.41855658 9.88475257,1.05192355 C10.1822702,0.739835879 10.4355643,0.381159401 10.7772521,0.114644447 L10.7772521,0.114644447 L10.7772521,0.114644447 Z M10.6161531,2.38806786 C10.7842687,2.60137414 11.0284987,2.80865367 11.0155923,3.10684439 C11.0262732,3.40787448 10.8005566,3.63163179 10.617901,3.84090575 C9.7887392,4.74226115 8.98529936,5.66774064 8.15180619,6.56422861 C7.91869588,6.84135541 7.53556347,6.84207572 7.21315952,6.75708373 C5.70953501,6.43648257 4.08116759,6.8468459 2.90399458,7.83572395 C5.40984448,10.1099846 7.92430838,12.3736049 10.4484558,14.6275478 C11.3112404,13.3566129 11.5451543,11.6947798 11.0721818,10.2340334 C10.9537266,9.91827383 10.9079776,9.53145749 11.169486,9.27118234 C11.9906863,8.33458322 12.8395879,7.42098557 13.6650131,6.48722169 C13.8365384,6.29890873 14.0302666,6.0870167 14.3034325,6.06862515 C14.5995512,6.0215208 14.8313684,6.24473413 15.0612243,6.3916339 C15.2703564,6.18199124 15.4677237,5.96175742 15.6544489,5.73291137 C14.1788222,4.39093938 12.6965075,3.05746897 11.2084147,1.73041468 C11.0002989,1.94000408 10.8018088,2.15825897 10.6161531,2.38806786 L10.6161531,2.38806786 L10.6161531,2.38806786 Z\"></path>\n    </svg>\n  </div>\n  <div id=\"js-sound\" title=\"toggle sound\" class=\"controls__sound\">\n    <svg class=\"motion-demo-icon motion-demo-icon-sound\">\n      <path d=\"M8.73794928,0.348150316 C9.11206309,0.27529234 9.51838182,0.296610044 9.86109583,0.47605654 C10.2191072,0.665217432 10.5062677,0.969062175 10.7198937,1.31068513 C10.7491465,1.3573682 10.7802779,1.41268629 10.8403937,1.42132131 C11.9978922,1.69278473 13.1035944,2.21790185 14.0149936,2.98938685 C14.7361155,3.59491758 15.3281492,4.36073586 15.7033365,5.22882515 C15.9494358,5.79576814 16.1067031,6.40345762 16.1542054,7.02059166 C16.1778223,7.33469049 16.1759437,7.65013854 16.1759437,7.9650469 C16.1821163,9.17907665 16.1746018,10.3931064 16.1791642,11.6068663 C16.1716497,12.0920465 16.1839949,12.6039412 16.4147969,13.0421684 C16.4695452,13.0872324 16.5454952,13.0920896 16.6104417,13.117455 C16.9434943,13.2264721 17.2784254,13.4040297 17.4705815,13.7097634 C17.6031584,13.9437184 17.6587119,14.223547 17.6146985,14.4898834 C17.5159367,15.0257943 17.019981,15.4640215 16.4746443,15.4731962 C14.8845265,15.4972124 13.2941402,15.4702279 11.7040223,15.4904662 C11.3795578,16.3329203 10.6525317,17.0293886 9.76850669,17.2366291 C9.2373939,17.354551 8.66817196,17.3340429 8.15852911,17.1330088 C7.44572691,16.8615454 6.861476,16.2759832 6.58397695,15.5625147 C6.56867961,15.5352604 6.56545912,15.4807518 6.52037223,15.492625 C5.12294712,15.4729264 3.72552201,15.4907361 2.3280969,15.4812915 C2.13218364,15.4767042 1.93600201,15.4845297 1.7406255,15.4694184 C1.41401394,15.440545 1.09384337,15.2883528 0.887463517,15.0282229 C0.66122396,14.7581087 0.578564668,14.3781678 0.660418838,14.036275 C0.727780793,13.7456527 0.906786468,13.4755385 1.16630444,13.3249653 C1.37617316,13.2019163 1.6120742,13.1371536 1.83965562,13.0559305 C1.98350426,12.746419 2.06267469,12.4072247 2.07179941,12.0656017 C2.08468138,10.5010441 2.0667003,8.93648657 2.08468138,7.37192901 C2.09648985,6.29255159 2.44376623,5.22612671 3.03741024,4.32970376 C3.49445171,3.64456895 4.08702222,3.05307012 4.76171528,2.58489017 C5.57945185,2.01848687 6.51205263,1.63422851 7.47524808,1.40189252 C7.75838299,0.922648946 8.18134093,0.479834361 8.73794928,0.348150316 L8.73794928,0.348150316 Z M5.89264468,3.58736194 C5.14575894,4.04609734 4.4949512,4.68104111 4.0778975,5.46008176 C3.7663149,6.03565977 3.57952637,6.68382591 3.56932815,7.34089691 C3.54597958,8.8800891 3.57362214,10.4195511 3.55778805,11.9587433 C3.55215219,12.3659385 3.47781251,12.7677367 3.41984365,13.1698048 C3.35623894,13.4005217 3.23439699,13.6112702 3.09859958,13.8063676 C7.12662983,13.8063676 11.1543917,13.8060978 15.182422,13.8066375 C15.0345477,13.6269211 14.9113639,13.4215696 14.8448071,13.1973289 C14.6166889,12.1152531 14.7119618,11.0034943 14.6963961,9.90657703 C14.6859295,9.01663035 14.7124985,8.12614398 14.6786833,7.23646714 C14.6472836,6.34840937 14.2919559,5.48949479 13.7436672,4.79896309 C13.1089619,3.99995396 12.2337932,3.40926467 11.2794541,3.06656234 C9.5258963,2.43782499 7.48786167,2.60809678 5.89264468,3.58736194 L5.89264468,3.58736194 Z\"></path>\n    </svg>\n  </div>\n  <div class=\"controls__timeline\">\n    <input type=\"range\" min=\"0\" max=\"100000\" value=\"0\" id=\"js-slider\">\n  </div>\n</div>\n<div class=\"motion_scene\">\n  <div id=\"js-svg-canvas\" class=\"svg-canvas\">\n    <svg class=\"svg-canvas__svg\">\n      <path id=\"js-curve-5\" d=\"M89,234.470827 C89,234.470827 209.009766,-25.0815972 240.529297,234.470827\" fill=\"none\"></path>\n      <path id=\"js-curve-5-mask\" d=\"M89,234.470827 C89,234.470827 209.009766,-25.0815972 240.529297,234.470827\" fill=\"none\"></path>\n      <path d=\"M208.222656,234.470827 C109,-17 89,234.470827 89,234.470827\" fill=\"none\" id=\"js-curve-4\"></path>\n      <path d=\"M208.222656,234.470827 C109,-17 89,234.470827 89,234.470827\" fill=\"none\" id=\"js-curve-4-mask\"></path>\n      <path d=\"M357.447266,234.470827 C211.126953,-18.9175695 208,234.470827 208,234.470827\" fill=\"none\" id=\"js-curve-3\"></path>\n      <path d=\"M357.447266,234.470827 C211.126953,-18.9175695 208,234.470827 208,234.470827\" fill=\"none\" id=\"js-curve-3-mask\"></path>\n      <path d=\"M155.219461,234.470827 C256.749214,45.2260249 359.634766,130.155713 357.466797,234.470827\" fill=\"none\" id=\"js-curve-2\"></path>\n      <path d=\"M155.219461,234.470827 C256.749214,45.2260249 359.634766,130.155713 357.466797,234.470827\" fill=\"none\" id=\"js-curve-2-mask\"></path>\n      <path d=\"M287,235.670827 C187.791726,11.4579344 151.764383,181.797782 155.219461,234.670827\" fill=\"none\" id=\"js-curve-1\"></path>\n      <path d=\"M287,235.670827 C187.791726,11.4579344 151.764383,181.797782 155.219461,234.670827\" fill=\"none\" id=\"js-curve-1-mask\"></path>\n      <g id=\"js-i\" transform=\"translate(233.000000, 183.000000)\">\n        <g id=\"js-i-line-3\">\n          <path d=\"M8.31578947,58.8761456 L8.31578947,-150\"></path>\n          <path d=\"M8.31578947,58.8761456 L8.31578947,-150\"></path>\n          <path d=\"M8.31578947,58.8761456 L8.31578947,-150\"></path>\n        </g>\n        <g id=\"js-i-line-2\">\n          <path d=\"M0,29.3193277 L16.2531981,29.3193277\"></path>\n          <path d=\"M0,29.3193277 L16.2531981,29.3193277\"></path>\n          <path d=\"M0,29.3193277 L16.2531981,29.3193277\"></path>\n        </g>\n        <g id=\"js-i-line-1\">\n          <path d=\"M0,24.3193277 L16.2531981,24.3193277\"></path>\n          <path d=\"M0,24.3193277 L16.2531981,24.3193277\"></path>\n          <path d=\"M0,24.3193277 L16.2531981,24.3193277\"></path>\n        </g>\n      </g>\n      <g id=\"js-circles-left\" transform=\"translate(37.000000, 205.000000)\" fill=\"none\">\n        <g id=\"js-circles-left-bottom\">\n          <path d=\"M1.97368421,3.95798319 C3.0637199,3.95798319 3.94736842,3.07195848 3.94736842,1.9789916 C3.94736842,0.886024718 3.0637199,0 1.97368421,0 C0.88364852,0 0,0.886024718 0,1.9789916 C0,3.07195848 0.88364852,3.95798319 1.97368421,3.95798319 Z\"></path>\n          <path d=\"M1.97368421,3.95798319 C3.0637199,3.95798319 3.94736842,3.07195848 3.94736842,1.9789916 C3.94736842,0.886024718 3.0637199,0 1.97368421,0 C0.88364852,0 0,0.886024718 0,1.9789916 C0,3.07195848 0.88364852,3.95798319 1.97368421,3.95798319 Z\"></path>\n          <path d=\"M1.97368421,3.95798319 C3.0637199,3.95798319 3.94736842,3.07195848 3.94736842,1.9789916 C3.94736842,0.886024718 3.0637199,0 1.97368421,0 C0.88364852,0 0,0.886024718 0,1.9789916 C0,3.07195848 0.88364852,3.95798319 1.97368421,3.95798319 Z\"></path>\n        </g>\n        <g id=\"js-circles-left-top\">\n          <path d=\"M1.97368421,18.4705882 C3.0637199,18.4705882 3.94736842,17.5845635 3.94736842,16.4915966 C3.94736842,15.3986298 3.0637199,14.512605 1.97368421,14.512605 C0.88364852,14.512605 0,15.3986298 0,16.4915966 C0,17.5845635 0.88364852,18.4705882 1.97368421,18.4705882 Z\"></path>\n          <path d=\"M1.97368421,18.4705882 C3.0637199,18.4705882 3.94736842,17.5845635 3.94736842,16.4915966 C3.94736842,15.3986298 3.0637199,14.512605 1.97368421,14.512605 C0.88364852,14.512605 0,15.3986298 0,16.4915966 C0,17.5845635 0.88364852,18.4705882 1.97368421,18.4705882 Z\"></path>\n          <path d=\"M1.97368421,18.4705882 C3.0637199,18.4705882 3.94736842,17.5845635 3.94736842,16.4915966 C3.94736842,15.3986298 3.0637199,14.512605 1.97368421,14.512605 C0.88364852,14.512605 0,15.3986298 0,16.4915966 C0,17.5845635 0.88364852,18.4705882 1.97368421,18.4705882 Z\"></path>\n        </g>\n      </g>\n      <g id=\"js-for-the-web\" transform=\"translate(266.000000, 268.000000)\" fill=\"none\">\n        <g>\n          <path d=\"M47.199933,21.4064652 C46.4228812,23.469298 45.4936894,25.4168303 44.7763457,27.5255372 C46.2750047,27.107479 47.7776158,25.5871552 49.3345977,26.2929792 C50.1265058,26.6744015 49.9060309,27.9369898 49.4803943,28.6313376 C49.3293477,27.8845039 49.1159715,26.9390807 48.4479168,26.9513569 C47.1276641,26.9148082 45.8914539,27.7480011 44.6154117,28.1145425 C43.8184838,30.5981526 43.1750107,33.4619597 43.8978497,36.1489187 C44.278142,36.7715267 44.4340916,37.6268092 45.3365512,38.0168502 C46.1764259,37.9339006 46.9409776,37.4312694 47.689973,36.9203425 C47.4601232,37.6946919 47.2673297,38.6291371 46.671576,39.0009088 C46.1071895,39.5199802 45.4549329,39.1056435 44.8724061,38.8865209 C44.3136704,38.4603106 43.9934172,37.6491928 43.6035084,36.8449458 C42.607711,34.2747905 42.9414196,31.3098606 43.4675468,28.6342483 C42.4702566,29.0621887 36.4817031,32.5516439 35.9950349,32.5581432 C36.1264719,32.1480461 36.0427842,31.3858802 36.4601774,31.2686103 C38.8316723,30.167707 41.2217454,29.1352855 43.5980738,28.0552642 C44.1052349,25.9693162 44.6411919,23.8663862 45.5026742,22.0151491 C45.8403575,21.1646812 46.6156949,21.2035143 47.199933,21.4064652 L47.199933,21.4064652 Z\" transform=\"translate(42.929768, 30.268044) rotate(12.000000) translate(-42.929768, -30.268044) \"></path>\n        </g>\n        <g>\n          <path d=\"M53.7681512,18.8002489 C53.9704152,16.831705 53.2126,15.0644131 52.8528913,13.2221109 C52.6861253,12.5781425 52.9249824,11.3595686 53.5818458,11.6080788 C54.1676398,11.790958 54.6267406,12.4592718 54.8488783,13.175622 C55.1105442,14.5714202 55.2777546,18.1510485 55.1142919,19.4410886 C55.0815754,24.4803492 54.9148389,29.5156804 54.7420154,34.5497816 C55.6002612,31.6950341 56.4567983,28.833326 57.5415997,26.1120154 C57.9913576,25.7171917 57.9837084,25.6860327 58.7026512,25.7396848 C59.2371996,26.467899 59.9302753,27.1702645 59.9992337,28.2641587 C60.1586075,30.1387456 60.0019936,32.0222457 60.0003301,33.9006741 C59.9867356,34.776117 60.2787697,35.6240149 60.1842293,36.4996384 C59.4157772,36.4799619 58.4368832,35.8504907 58.4657946,34.6721824 C58.4360445,32.0530999 58.9285445,29.4287482 58.5767197,26.8173488 C57.659958,27.6310069 57.1828586,28.9866662 56.7408909,30.2733484 C55.85306,32.9368869 55.0667334,35.6722068 54.5280521,38.497264 C54.1519564,39.0861057 53.8515377,38.1687059 53.5400299,37.9602172 C53.8883376,36.4098392 53.8000909,34.7778561 53.8448504,33.1810207 C53.9202249,29.2234683 53.922755,25.2639248 53.875418,21.3070333 C53.8744948,21.2298683 53.7677105,19.5634133 53.7681512,18.8002489 L53.7681512,18.8002489 Z\" transform=\"translate(56.502340, 25.133375) rotate(9.000000) translate(-56.502340, -25.133375) \"></path>\n        </g>\n        <g>\n          <path d=\"M69.4390564,31.5364717 C68.2160619,33.1077918 66.6764252,34.4192873 64.9741099,34.3615486 C63.9312239,34.2914372 62.8069986,33.6315652 62.2724832,32.2953244 C61.9209812,31.0910581 62.4613066,29.8290529 62.9812971,28.9093564 C63.8905543,27.416396 65.2617024,26.1007763 66.7170949,26.5296931 C67.3445695,26.6163013 67.7251212,27.3834024 68.1027679,28.0020324 C67.1470312,30.5796573 64.9102005,32.1179838 62.9115777,31.2147841 C63.3705637,33.3923616 65.3401368,32.864464 66.4934118,32.2747034 C67.9255645,31.3302617 69.5843051,30.1961067 70.1478703,27.9360452 C70.6097956,27.2245063 70.4042753,30.4054019 69.4390564,31.5364717 Z M63.2630797,30.2662181 C64.5470786,30.4188135 65.8165526,29.4331297 66.6096108,28.0391502 C66.4934118,27.457638 66.237774,27.2184344 65.8456024,27.3256636 C64.7155671,27.6679722 63.9021742,28.9877162 63.2630797,30.2662181 L63.2630797,30.2662181 Z\" transform=\"translate(66.272103, 30.405402) rotate(12.000000) translate(-66.272103, -30.405402) \"></path>\n        </g>\n        <g>\n          <path d=\"M18.0863969,35.6861072 C18.3603547,35.7251564 18.6210553,35.8103934 18.901844,35.9441553 C19.7502705,36.7107135 20.5177837,37.8986719 20.4090787,39.2750609 C20.1600492,41.5790787 18.6356444,43.0754156 17.1452206,43.9420549 C15.8556503,44.779465 13.8840235,43.4352652 13.77351,41.3676186 C13.8939841,39.8756513 14.3468929,37.8954513 17.160773,36.5089196 C16.5896022,36.9137244 15.238535,36.8163549 13.8766538,37.793744 C14.0165442,37.3851446 13.9142432,36.588107 14.3738037,36.5148734 C16.3269545,35.8663544 17.2661043,35.5691849 18.0863969,35.6861072 L18.0863969,35.6861072 Z M17.7681027,36.8640119 C17.7844742,37.1021798 17.9413073,37.3853125 17.9603892,37.6226013 C16.3972757,37.4271448 14.942588,38.8050722 14.735787,40.8359478 C14.6240521,41.5986362 15.2702986,42.1114609 15.7741606,42.0278484 C17.199115,41.9328387 18.3591139,40.6305445 19.0227076,39.0941193 C19.4057668,38.2793424 19.3602681,37.1046487 18.7538224,36.3553922 C18.3040894,36.2590987 18.0605271,35.9289763 17.1772698,36.5256808 L17.7681027,36.8640119 L17.7681027,36.8640119 Z\" transform=\"translate(17.096451, 39.927876) rotate(7.000000) translate(-17.096451, -39.927876) \"></path>\n        </g>\n        <g>\n          <path d=\"M27.7755497,33.8332077 C26.8120881,35.8464873 26.0157904,38.1381626 26.2319459,40.4716958 C27.3502599,40.5827662 27.9873763,39.4378609 28.530534,38.5211229 C29.2341239,37.2573795 28.8336856,39.7061979 27.1583061,41.5675811 C26.2917819,41.5788007 25.4992556,40.6842607 25.4633725,39.7043166 C25.3898958,37.2586053 26.4352558,35.0022429 26.5506722,32.5831208 C27.073228,32.837235 27.5049772,33.2557356 27.7755497,33.8332077 L27.7755497,33.8332077 Z\" transform=\"translate(27.160586, 37.075403) rotate(7.000000) translate(-27.160586, -37.075403) \"></path>\n        </g>\n        <g>\n          <path d=\"M26.9620686,33.9753287 C26.8541887,34.249968 26.7315871,34.581411 26.4594254,34.6838837 C26.088401,34.7190985 25.6945611,34.5220686 25.4963679,34.155942 C25.1161008,33.5146336 24.8150355,32.8192549 24.4693419,32.1556954 C23.9984099,33.7825905 23.9004203,35.5076611 23.7323891,37.1971168 C23.1608998,37.4644791 22.5425989,36.6828106 22.5658477,36.0414699 C22.5537485,33.8602057 23.0800936,33.7320397 23.2187592,35.8217969 C23.5802229,34.4085684 23.8320527,32.9457654 24.3671098,31.599203 C24.5073158,31.0965049 25.2434211,31.1667455 25.3709726,31.6535368 C25.7051167,32.4028267 25.9938939,33.1810222 26.4070664,33.8810278 C26.5675253,33.6114057 26.7134756,33.3228405 26.7553091,32.9955242 C26.8984679,32.0504159 27.2784914,33.0244691 26.9620686,33.9753287 L26.9620686,33.9753287 Z\" transform=\"translate(24.824880, 34.252422) rotate(7.000000) translate(-24.824880, -34.252422) \"></path>\n        </g>\n        <g>\n          <path d=\"M11.1824053,26.7441775 C12.1122972,26.6490729 13.0892669,27.102763 13.5754554,27.9675721 C14.4031196,29.3758925 13.5204064,29.8261764 13.0956427,28.5078455 C12.7532486,27.4661623 11.6095058,26.9704195 10.6347615,27.1443324 C8.99892925,27.4595638 7.90754182,28.8673805 7.17049522,30.4460472 C6.64286268,31.4839207 7.24098017,37.3982534 7.22603662,38.5654724 C6.83739521,38.3196335 6.27472547,38.0870427 6.2841367,37.5122318 C4.88666801,33.1769491 5.95897672,30.4291719 6.62201294,29.5645051 C7.78627513,28.1420302 9.32950315,26.8421056 11.1824053,26.7441775 L11.1824053,26.7441775 L11.1824053,26.7441775 Z\" transform=\"translate(9.758934, 32.648599) rotate(7.000000) translate(-9.758934, -32.648599) \"></path>\n        </g>\n        <g>\n          <path d=\"M6.36392842,36.8075855 C7.851272,36.2651623 9.35519784,35.7492452 10.9026864,35.4267732 C11.955235,35.2474761 13.175595,35.2412681 14.0457683,35.9982489 C14.5300699,36.4273209 14.9916242,37.2201271 14.4904002,37.8221362 C14.0530727,36.7711371 12.8793088,36.6603778 11.938853,36.7333969 C9.97677383,36.8918457 8.07082223,37.4770553 6.22952153,38.1770711 C6.11030883,39.7978321 8.02937307,47.3283424 8.50094059,48.8662673 C7.94152765,49.0794912 7.49234654,48.5345976 7.22840489,48.0851821 C6.67758441,46.9891905 5.09403049,39.773726 5.14966092,38.5717983 C-0.226075731,40.8097716 -0.645551209,39.8507305 4.82519137,37.446559 C4.99038396,37.3739635 5.94263744,37.0547289 6.36392842,36.8075855 L6.36392842,36.8075855 Z\" transform=\"translate(7.811112, 42.120489) rotate(7.000000) translate(-7.811112, -42.120489) \"></path>\n        </g>\n        <g>\n          <path d=\"M125.68713,7.5434158 C126.656671,6.37239206 128.337933,6.02474439 129.750485,6.49315389 C129.027868,7.36776224 127.97481,7.85080953 127.204987,8.67784505 C125.262275,10.664926 123.315932,12.6629852 121.631038,14.8879303 C123.406713,13.6986093 125.443837,12.5495423 127.658892,12.8605955 C128.780944,12.9411033 130.004671,13.7059282 130.066402,14.9391626 C130.26612,16.6737415 128.991556,18.1155645 127.673417,19.0340862 C125.618137,20.4246769 123.181577,21.3029447 120.701442,21.4200471 C120.098656,21.3724743 119.285259,21.4822577 118.947554,20.8528325 C118.341137,19.8684406 117.418803,19.0267673 117.179142,17.8557436 C117.462378,17.1458105 118.199519,16.8750112 118.845879,16.6115309 C118.508174,17.0945782 118.148682,17.5666471 117.800083,18.0423755 C119.731901,19.1877831 122.113993,18.8913677 124.201954,18.4119799 C126.035729,17.8777003 128.076484,16.9006274 128.780944,14.9757571 C129.140437,13.8340089 127.749673,13.3729183 126.878176,13.5558908 C124.292735,13.7864361 121.580201,15.3563398 120.541667,17.8228086 C119.583021,17.2702317 119.524921,16.0406568 120.084131,15.1587295 C121.565676,12.3629104 123.591906,9.89278218 125.68713,7.5434158 L125.68713,7.5434158 Z\"></path>\n        </g>\n        <g>\n          <path d=\"M104.191997,16.737058 C105.245056,15.5770126 106.799226,14.7755933 108.382445,14.8341444 C109.115955,15.0903059 109.751421,15.6245855 110.198064,16.2613296 C110.027395,17.2676782 109.025174,17.7763416 108.215408,18.2044971 C106.857325,18.9254086 105.324943,19.1669323 103.814349,19.3096508 C104.035854,19.9024816 104.155685,20.6416903 104.791151,20.9417651 C106.040297,21.6041254 107.525473,21.1174187 108.760094,20.6490092 C111.062298,19.6609579 113.288246,18.2959834 114.871466,16.305243 C114.613648,15.8331741 114.359461,15.3574457 114.112537,14.8780578 C114.958616,15.1415382 116.298542,15.7929201 115.724807,16.916371 C114.631804,18.9620031 112.580155,20.2794048 110.62655,21.4028557 C108.858137,22.2957613 106.806488,23.2325803 104.798414,22.6580468 C103.316869,22.1567023 102.873858,20.4001667 102.881121,18.9912787 C102.706821,18.8522196 102.361854,18.5667826 102.187554,18.4277235 C103.287819,18.5192098 103.563793,17.3847805 104.191997,16.737058 L104.191997,16.737058 Z M104.555121,18.2630483 C105.978566,17.6665581 107.532735,17.0920246 108.495013,15.8038985 C106.940844,16.1369084 105.615442,17.1030029 104.555121,18.2630483 L104.555121,18.2630483 Z\"></path>\n        </g>\n        <g>\n          <path d=\"M164.195331,16.9217102 C166.228824,17.1266393 168.491085,17.7194701 169.743861,19.4833246 C170.437428,20.4786948 170.916751,22.1034902 169.703918,22.9158879 C169.391631,20.8482991 167.270989,20.0724959 165.495314,19.7358266 C161.787821,19.0441907 155.139025,19.5125999 152.056105,19.6150648 C148.973185,19.7175296 129.778465,24.529705 119.189777,28.7161149 C118.529514,28.9931112 117.829921,29.2081782 117.200208,29.5549362 C117.06455,29.6296377 114.447784,30.6473256 114.317346,30.7019307 C108.570343,33.1077917 102.931208,35.7704097 97.1045927,37.9781807 C95.4378548,38.5161198 93.6077113,39.3834092 91.8647175,38.6881139 C90.9460144,38.3038717 89.9328993,37.6341925 89.7767561,36.5656334 C89.8094372,35.3763124 90.5247909,34.3480072 91.2292509,33.4477827 C93.190119,31.080119 95.7065664,29.2540539 98.3392134,27.7097663 C97.1191177,25.9678685 96.2803019,23.991766 95.7537725,21.9314961 C94.889538,24.2186518 93.909104,26.4984887 92.4493466,28.4672723 C91.9845483,29.0235086 91.4434939,29.7005067 90.6627779,29.7334417 C89.667819,29.5358315 88.7672721,28.781985 88.4912981,27.7829553 C87.9211939,26.0081225 87.5943825,24.1674195 87.1295842,22.3669705 C84.8164861,25.7885555 83.4148285,29.7188039 81.8533965,33.5136527 C80.1793962,33.7039441 79.0791313,31.4241073 79.5657171,29.9530087 C80.9818996,24.8810121 82.7866245,19.9297774 84.3988938,14.916332 C84.3625814,14.4003497 84.1810196,13.8587512 84.355319,13.3537472 C85.6516706,12.8048298 87.0642219,14.4259658 86.3416057,15.6628596 C84.6240305,20.390868 82.4452882,24.9798173 81.4212793,29.9347114 C83.3058914,26.9266442 84.9363169,23.7209667 87.2312588,20.9983365 C87.9320876,19.9370963 89.8130684,20.6543483 89.8239622,21.8802638 C90.2016108,23.8710042 90.4412725,25.8946795 91.0585828,27.8305282 C91.6577369,27.3255242 92.2314724,26.7656285 92.5582838,26.0373981 C93.5605052,23.951512 94.2685965,21.7302264 94.9185879,19.5126002 C95.3724926,17.9683126 94.5155206,16.252031 95.2744492,14.769954 C96.037009,13.9904914 96.9992868,14.7443379 97.6638032,15.2493419 C97.598441,19.1905686 97.9760896,23.3440435 100.042264,26.7912446 C103.502833,25.140833 107.57345,23.7575612 111.346305,25.1627897 C113.096561,25.7263449 114.240401,27.2303785 115.311616,28.6392664 C116.804055,27.8305276 117.766881,27.4316727 117.963322,27.3514935 C129.236932,22.7500787 140.690623,18.8530044 152.807537,17.3315683 C154.552932,17.1083419 161.177773,16.7240999 164.195331,16.9217102 Z M107.653337,25.8471067 C107.533506,26.9559198 107.181276,28.1562191 106.157267,28.7527094 C104.029362,30.0518138 101.226047,29.7627173 99.0945107,28.6136503 C96.1931522,30.2823591 93.3135811,32.2072294 91.3018757,34.9481568 C90.8152899,35.6544305 90.1652985,36.9023027 91.2038323,37.4402417 C93.0012947,37.996478 94.8169133,37.0962535 96.4981761,36.5253794 C102.551448,34.1284402 108.434053,31.3070049 114.44375,28.7929633 C112.929524,26.582656 110.224253,25.7263449 107.653337,25.8471067 L107.653337,25.8471067 Z M101.291409,27.5853451 C101.258728,27.6914691 101.196997,27.9000577 101.167947,28.0061817 C102.188325,28.7197743 103.506464,29.0893787 104.72656,28.7344121 C105.855874,28.3282133 106.124586,27.0108115 106.498603,26.0154414 C104.715666,26.3447918 102.93636,26.8058824 101.291409,27.5853451 L101.291409,27.5853451 Z\"></path>\n        </g>\n        <g>\n          <polygon transform=\"translate(147.312328, 6.398198) rotate(37.000000) translate(-147.312328, -6.398198) \" points=\"147.312328 8.65051431 144.475229 10.3981979 145.445401 7.50377066 143.312328 5.45392591 146.126489 5.45392588 147.312328 2.39819787 148.423048 5.45392588 151.312328 5.45392591 149.126032 7.50377066 149.784464 10.3981977 \"></polygon>\n        </g>\n      </g>\n    </svg>\n    <svg class=\"svg-canvas__svg\">\n      <g id=\"js-m\" transform=\"translate(83.000000, 184.000000)\" fill=\"none\">\n        <g id=\"js-m-line-2\">\n          <path d=\"M0.0649285567,58.3490973 L0.0649285567,0.607639314 L43.9350714,37.9133678 L43.9350714,47.0178902 L0.0649285567,9.46407539\"></path>\n          <path d=\"M0.0649285567,58.3490973 L0.0649285567,0.607639314 L43.9350714,37.9133678 L43.9350714,47.0178902 L0.0649285567,9.46407539\"></path>\n          <path d=\"M0.0649285567,58.3490973 L0.0649285567,0.607639314 L43.9350714,37.9133678 L43.9350714,47.0178902 L0.0649285567,9.46407539\"></path>\n        </g>\n        <g transform=\"translate(-8.000000, 0.000000)\">\n          <g id=\"js-m-line-1\">\n            <path d=\"M0.0649285567,19.5005026 L21.883712,0.607639314 L21.9123021,58.4931435\"></path>\n            <path d=\"M0.0649285567,19.5005026 L21.883712,0.607639314 L21.9123021,58.4931435\"></path>\n            <path d=\"M0.0649285567,19.5005026 L21.883712,0.607639314 L21.9123021,58.4931435\"></path>\n          </g>\n        </g>\n      </g>\n      <g id=\"js-circles-right\" transform=\"translate(403.000000, 205.000000)\" fill=\"none\">\n        <g id=\"js-circles-right-bottom\">\n          <path d=\"M1.97368421,3.95798319 C3.0637199,3.95798319 3.94736842,3.07195848 3.94736842,1.9789916 C3.94736842,0.886024718 3.0637199,0 1.97368421,0 C0.88364852,0 0,0.886024718 0,1.9789916 C0,3.07195848 0.88364852,3.95798319 1.97368421,3.95798319 Z\"></path>\n          <path d=\"M1.97368421,3.95798319 C3.0637199,3.95798319 3.94736842,3.07195848 3.94736842,1.9789916 C3.94736842,0.886024718 3.0637199,0 1.97368421,0 C0.88364852,0 0,0.886024718 0,1.9789916 C0,3.07195848 0.88364852,3.95798319 1.97368421,3.95798319 Z\"></path>\n          <path d=\"M1.97368421,3.95798319 C3.0637199,3.95798319 3.94736842,3.07195848 3.94736842,1.9789916 C3.94736842,0.886024718 3.0637199,0 1.97368421,0 C0.88364852,0 0,0.886024718 0,1.9789916 C0,3.07195848 0.88364852,3.95798319 1.97368421,3.95798319 Z\"></path>\n        </g>\n        <g id=\"js-circles-right-top\">\n          <path d=\"M1.97368421,18.4705882 C3.0637199,18.4705882 3.94736842,17.5845635 3.94736842,16.4915966 C3.94736842,15.3986298 3.0637199,14.512605 1.97368421,14.512605 C0.88364852,14.512605 0,15.3986298 0,16.4915966 C0,17.5845635 0.88364852,18.4705882 1.97368421,18.4705882 Z\"></path>\n          <path d=\"M1.97368421,18.4705882 C3.0637199,18.4705882 3.94736842,17.5845635 3.94736842,16.4915966 C3.94736842,15.3986298 3.0637199,14.512605 1.97368421,14.512605 C0.88364852,14.512605 0,15.3986298 0,16.4915966 C0,17.5845635 0.88364852,18.4705882 1.97368421,18.4705882 Z\"></path>\n          <path d=\"M1.97368421,18.4705882 C3.0637199,18.4705882 3.94736842,17.5845635 3.94736842,16.4915966 C3.94736842,15.3986298 3.0637199,14.512605 1.97368421,14.512605 C0.88364852,14.512605 0,15.3986298 0,16.4915966 C0,17.5845635 0.88364852,18.4705882 1.97368421,18.4705882 Z\"></path>\n        </g>\n      </g>\n    </svg>\n    <svg class=\"svg-canvas__svg\">\n      <g id=\"js-t\" sketch:type=\"MSLayerGroup\" transform=\"translate(191.000000, 183.000000)\">\n        <g id=\"js-t-line-1\">\n          <path d=\"M17.3157895,60.0150887 L17.3157895,2\"></path>\n          <path d=\"M17.3157895,60.0150887 L17.3157895,2\"></path>\n          <path d=\"M17.3157895,60.0150887 L17.3157895,2\"></path>\n        </g>\n        <g id=\"js-t-line-2\">\n          <path d=\"M0,1.31932773 L32.1182043,1.31932773\"></path>\n          <path d=\"M0,1.31932773 L32.1182043,1.31932773\"></path>\n          <path d=\"M0,1.31932773 L32.1182043,1.31932773\"></path>\n        </g>\n        <g id=\"js-t-line-3\">\n          <path d=\"M0,7.31932773 L32.1182043,7.31932773\"></path>\n          <path d=\"M0,7.31932773 L32.1182043,7.31932773\"></path>\n          <path d=\"M0,7.31932773 L32.1182043,7.31932773\"></path>\n        </g>\n      </g>\n    </svg>\n    <svg class=\"svg-canvas__svg\">\n      <g id=\"n\" transform=\"translate(313.000000, 182.000000)\" stroke1=\"#F6A623\" stroke-width=\"2\" fill=\"none\">\n        <g id=\"js-n-1\">\n          <path d=\"M44.3702971,0 L44.3702971,57.6742056 L0.589583337,1.04713547 L8.953906,1.04713547 L44.3702971,47.0406689\"></path>\n          <path d=\"M44.3702971,0 L44.3702971,57.6742056 L0.589583337,1.04713547 L8.953906,1.04713547 L44.3702971,47.0406689\"></path>\n          <path d=\"M44.3702971,0 L44.3702971,57.6742056 L0.589583337,1.04713547 L8.953906,1.04713547 L44.3702971,47.0406689\"></path>\n        </g>\n        <g id=\"js-n-2\">\n          <path d=\"M44,0.00170809031 L44,56.7160707 L68.8373606,33.1138772\"></path>\n          <path d=\"M44,0.00170809031 L44,56.7160707 L68.8373606,33.1138772\"></path>\n          <path d=\"M44,0.00170809031 L44,56.7160707 L68.8373606,33.1138772\"></path>\n        </g>\n      </g>\n    </svg>\n    <svg class=\"svg-canvas__svg\">\n      <g transform=\"translate(142.000000, 185.000000)\" stroke1=\"#FEFEFE\" stroke-width1=\"2\">\n        <g id=\"js-o1-line-1\">\n          <path d=\"M14.4681748,56.4154786 L14.4681748,10.3704254\"></path>\n          <path d=\"M14.4681748,56.4154786 L14.4681748,10.3704254\"></path>\n          <path d=\"M14.4681748,56.4154786 L14.4681748,10.3704254\"></path>\n        </g>\n        <g id=\"js-o1-line-2\">\n          <path d=\"M0.152385328,1.68975318 L27.8476147,1.68975318\"></path>\n          <path d=\"M0.152385328,1.68975318 L27.8476147,1.68975318\"></path>\n          <path d=\"M0.152385328,1.68975318 L27.8476147,1.68975318\"></path>\n        </g>\n        <g id=\"js-o1-circle\" transform=\"translate(-11.5,8)\">\n          <ellipse></ellipse>\n          <ellipse></ellipse>\n          <ellipse></ellipse>\n        </g>\n      </g>\n    </svg>\n    <svg class=\"svg-canvas__svg\">\n      <g id=\"js-o2\" transform=\"translate(253.000000, 174.000000) rotate(-135, 33, 33)\" stroke1=\"#FEFEFE\" stroke-width=\"2\" fill=\"none\">\n        <path d=\"M16.4498754,17.6682596 L50.4246052,50.5853726 C55.2204437,46.2220917 57.3684211,40.2605437 57.3684211,33.7478992 C57.3684211,20.6322966 46.7646388,10 33.6842105,10 C20.6037822,10 10,20.6322966 10,33.7478992 C10,46.8635017 20.6037822,57.4957983 33.6842105,57.4957983 C40.1148437,57.4957983 45.9468896,54.9260498 50.2146691,50.7548286\"></path>\n        <path d=\"M16.4498754,17.6682596 L50.4246052,50.5853726 C55.2204437,46.2220917 57.3684211,40.2605437 57.3684211,33.7478992 C57.3684211,20.6322966 46.7646388,10 33.6842105,10 C20.6037822,10 10,20.6322966 10,33.7478992 C10,46.8635017 20.6037822,57.4957983 33.6842105,57.4957983 C40.1148437,57.4957983 45.9468896,54.9260498 50.2146691,50.7548286\"></path>\n        <path d=\"M16.4498754,17.6682596 L50.4246052,50.5853726 C55.2204437,46.2220917 57.3684211,40.2605437 57.3684211,33.7478992 C57.3684211,20.6322966 46.7646388,10 33.6842105,10 C20.6037822,10 10,20.6322966 10,33.7478992 C10,46.8635017 20.6037822,57.4957983 33.6842105,57.4957983 C40.1148437,57.4957983 45.9468896,54.9260498 50.2146691,50.7548286\"></path>\n      </g>\n      <g id=\"js-o2-line\" transform=\"translate(274.000000, 239.000000)\" stroke1=\"#FEFEFE\" stroke-width=\"2\">\n        <path d=\"M-7.46069873e-14,1.31932773 L27.6952293,1.31932773\"></path>\n        <path d=\"M-7.46069873e-14,1.31932773 L27.6952293,1.31932773\"></path>\n        <path d=\"M-7.46069873e-14,1.31932773 L27.6952293,1.31932773\"></path>\n      </g>\n      <g id=\"js-aurora\" transform=\"translate(55.000000, 108.000000)\" stroke-dasharray1=\"20,100,40,50\">\n        <path d=\"M0.353515625,152.166016 L105.063979,37.029506\"></path>\n        <path d=\"M45.5726518,130.166016 L163.736714,0.236328125\"></path>\n        <path d=\"M58.0035933,158.166016 L142.529555,65.2237827\"></path>\n      </g>\n    </svg>\n  </div>\n</div>\n"

/***/ },

/***/ 224:
/***/ function(module, exports, __webpack_require__) {

	var map = {
		"./bells-1-half.mp3": 321,
		"./bells-1-half.wav": 322
	};
	function webpackContext(req) {
		return __webpack_require__(webpackContextResolve(req));
	};
	function webpackContextResolve(req) {
		return map[req] || (function() { throw new Error("Cannot find module '" + req + "'.") }());
	};
	webpackContext.keys = function webpackContextKeys() {
		return Object.keys(map);
	};
	webpackContext.resolve = webpackContextResolve;
	module.exports = webpackContext;
	webpackContext.id = 224;


/***/ },

/***/ 226:
/***/ function(module, exports, __webpack_require__) {

	var FirstBall, mojs;

	mojs = __webpack_require__(62);

	FirstBall = (function() {
	  function FirstBall(o) {
	    this.o = o != null ? o : {};
	    this.vars();
	    return this.create();
	  }

	  FirstBall.prototype.vars = function() {
	    this.S = this.o.S;
	    this.path = document.querySelector('#js-curve-1');
	    this.pathMask = document.querySelector('#js-curve-1-mask');
	    this.o2 = document.querySelector('#js-o2');
	    this.o2Line = document.querySelector('#js-o2-line');
	    return this.easing = mojs.easing.bezier(0.240, 0.725, 0.790, 0.395);
	  };

	  FirstBall.prototype.create = function() {
	    var burst, burst2, it, mp, oDelay, oDuration, oEasing, oLineStagger, oStagger, opacityDelta, trail, trailFade, translate, tween;
	    this.o.BALL_2_ARCDUR = 800;
	    trail = new mojs.Transit({
	      bit: this.pathMask,
	      fill: 'transparent',
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '200%': '100%'
	      },
	      strokeWidth: 4 * this.o.TRAIL_WIDTH,
	      stroke: this.o.BG,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: this.o.BALL_2_START * this.S,
	      duration: this.o.BALL_2_ARCDUR * this.S,
	      easing: this.easing,
	      isRunLess: this.o.IS_RUNLESS,
	      strokeLinecap: 'round'
	    });
	    opacityDelta = {};
	    opacityDelta[this.o.TRAIL_OPACITY] = 0;
	    trailFade = new mojs.Transit({
	      bit: this.path,
	      fill: 'transparent',
	      strokeDasharray: this.o.TRAIL_DASH,
	      strokeWidth: this.o.TRAIL_WIDTH,
	      stroke: this.o.TRAIL_COLOR,
	      opacity: opacityDelta,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: (this.o.BALL_2_START + (this.o.BALL_2_ARCDUR / 1.25)) * this.S,
	      duration: this.o.TRAIL_FADE * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    mp = new mojs.MotionPath({
	      path: this.path,
	      el: this.o.mainBall.el,
	      isRunLess: this.o.IS_RUNLESS,
	      delay: this.o.BALL_2_START * this.S,
	      duration: this.o.BALL_2_ARCDUR * this.S,
	      easing: this.easing,
	      isAngle: true,
	      angleOffset: 90
	    });
	    burst = new mojs.Burst({
	      parent: this.o.ctx,
	      x: 155,
	      y: this.o.bottomLineBurst,
	      degree: 180,
	      angle: 90,
	      radius: {
	        10: 25
	      },
	      type: 'line',
	      stroke: this.o.PINK,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_2_START + this.o.BALL_2_ARCDUR) * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          7: 0
	        }
	      }
	    });
	    burst2 = new mojs.Transit({
	      parent: this.o.ctx,
	      x: 310,
	      y: this.o.CHARS_TOP - 10,
	      angle: 90,
	      radius: {
	        5: 6
	      },
	      fill: 'transparent',
	      type: 'circle',
	      stroke: this.o.CYAN,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_2_START + this.o.BALL_2_ARCDUR + 3 * this.o.BALL_3_ARCDUR) * this.S,
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    oDuration = this.o.CHAR_DUR * this.S;
	    oLineStagger = new mojs.Stagger({
	      els: this.o2Line,
	      duration: oDuration,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (this.o.BALL_2_START * this.S) + ", 200)",
	      easing: 'sin.out',
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: {
	        '0 100%': '100% 100%'
	      },
	      strokeDashoffset: {
	        '50%': '200%'
	      }
	    });
	    it = this;
	    translate = "translate(253, 174)";
	    oDelay = (this.o.BALL_2_START + 400) * this.S;
	    oEasing = 'sin.out';
	    oStagger = new mojs.Stagger({
	      els: this.o2,
	      duration: oDuration,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + oDelay + ", 100)",
	      easing: oEasing,
	      stroke: this.o.STAGGER_COLORS
	    });
	    tween = new mojs.Tween;
	    tween.add(new mojs.Timeline({
	      duration: oDuration,
	      delay: oDelay,
	      easing: oEasing,
	      onUpdate: function(p) {
	        var transform;
	        transform = translate + " rotate(" + (-135 * (1 - p)) + ",33,33)";
	        return it.o2.setAttribute('transform', transform);
	      }
	    }));
	    this.o.IS_RUNLESS || tween.start();
	    return [mp.tween, burst.tween, oStagger.tween, oLineStagger.tween, tween, trail.tween, trailFade.tween];
	  };

	  return FirstBall;

	})();

	module.exports = FirstBall;


/***/ },

/***/ 227:
/***/ function(module, exports, __webpack_require__) {

	var FirstBall, mojs;

	mojs = __webpack_require__(62);

	FirstBall = (function() {
	  function FirstBall(o) {
	    this.o = o != null ? o : {};
	    this.vars();
	    return this.create();
	  }

	  FirstBall.prototype.vars = function() {
	    this.S = this.o.S;
	    this.path = document.querySelector('#js-curve-2');
	    this.pathMask = document.querySelector('#js-curve-2-mask');
	    this.o1Line1 = document.querySelector('#js-o1-line-1');
	    this.o1Line2 = document.querySelector('#js-o1-line-2');
	    this.o1circle = document.querySelector('#js-o1-circle');
	    return this.easing = mojs.easing.bezier(0.435, 0.715, 0.635, 0.395);
	  };

	  FirstBall.prototype.create = function() {
	    var burst, burst2, burst3, it, mp, oDelay, oDuration, oEasing, oLine1Stagger, oLine2Stagger, oStagger, opacityDelta, trail, trailFade, translate;
	    opacityDelta = {};
	    opacityDelta[this.o.TRAIL_OPACITY] = 0;
	    trailFade = new mojs.Transit({
	      bit: this.path,
	      fill: 'transparent',
	      strokeDasharray: this.o.TRAIL_DASH,
	      strokeWidth: this.o.TRAIL_WIDTH,
	      stroke: this.o.TRAIL_COLOR,
	      opacity: opacityDelta,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: (this.o.BALL_3_START + (this.o.BALL_3_ARCDUR / 1.25)) * this.S,
	      duration: this.o.TRAIL_FADE * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    trail = new mojs.Transit({
	      bit: this.pathMask,
	      fill: 'transparent',
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '200%': '100%'
	      },
	      strokeWidth: 4 * this.o.TRAIL_WIDTH,
	      stroke: this.o.BG,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: this.o.BALL_3_START * this.S,
	      duration: this.o.BALL_3_ARCDUR * this.S,
	      easing: this.easing,
	      isRunLess: this.o.IS_RUNLESS,
	      strokeLinecap: 'round'
	    });
	    mp = new mojs.MotionPath({
	      path: this.path,
	      el: this.o.mainBall.el,
	      isRunLess: this.o.IS_RUNLESS,
	      delay: this.o.BALL_3_START * this.S,
	      duration: this.o.BALL_3_ARCDUR * this.S,
	      easing: this.easing,
	      isAngle: true,
	      angleOffset: 90
	    });
	    burst = new mojs.Burst({
	      parent: this.o.ctx,
	      x: 358,
	      y: this.o.bottomLineBurst,
	      degree: 180,
	      angle: 90,
	      radius: {
	        10: 25
	      },
	      type: 'line',
	      fill: 'none',
	      stroke: this.o.YELLOW,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_3_START + this.o.BALL_3_ARCDUR) * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          7: 0
	        }
	      }
	    });
	    burst2 = new mojs.Transit({
	      parent: this.o.ctx,
	      x: 125,
	      y: this.o.CHARS_TOP,
	      angle: 90,
	      radius: {
	        5: 6
	      },
	      fill: 'transparent',
	      type: 'circle',
	      stroke: this.o.CYAN,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_3_START + 400) * this.S,
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    burst3 = new mojs.Transit({
	      parent: this.o.ctx,
	      x: 125,
	      y: this.o.bottomLineBurst + 20,
	      angle: 90,
	      radius: {
	        5: 6
	      },
	      fill: 'transparent',
	      type: 'rect',
	      stroke: this.o.ORANGE,
	      strokeWidth: this.o.STROKE_WIDTH - .5,
	      delay: (this.o.BALL_3_START + this.o.BALL_3_ARCDUR + 400) * this.S,
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    oLine1Stagger = new mojs.Stagger({
	      els: this.o1Line1,
	      duration: 1000 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (this.o.BALL_3_START * this.S) + ", 200)",
	      easing: 'sin.out',
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': 0
	      }
	    });
	    oLine2Stagger = new mojs.Stagger({
	      els: this.o1Line2,
	      duration: 1000 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((this.o.BALL_3_START + 800) * this.S) + ", 200)",
	      easing: 'sin.out',
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: {
	        '0 100%': '100% 100%'
	      },
	      strokeDashoffset: {
	        '50%': '200%'
	      }
	    });
	    it = this;
	    translate = "translate(253, 174)";
	    oDuration = 1000 * this.S;
	    oDelay = (this.o.BALL_3_START + 1200) * this.S;
	    oEasing = 'sin.out';
	    oStagger = new mojs.Stagger({
	      type: 'circle',
	      els: this.o1circle,
	      duration: oDuration,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + oDelay + ", 100)",
	      easing: oEasing,
	      stroke: this.o.STAGGER_COLORS,
	      radius: 24,
	      radiusX: {
	        0: 24
	      },
	      strokeDashoffset: 0
	    });
	    return [trailFade.tween, oStagger.tween, oLine1Stagger.tween, burst.tween, oLine2Stagger.tween, mp.tween, trail.tween, trailFade.tween, burst2.tween, burst3.tween];
	  };

	  return FirstBall;

	})();

	module.exports = FirstBall;


/***/ },

/***/ 228:
/***/ function(module, exports, __webpack_require__) {

	var FirstBall, mojs;

	mojs = __webpack_require__(62);

	FirstBall = (function() {
	  function FirstBall(o) {
	    this.o = o != null ? o : {};
	    this.vars();
	    return this.create();
	  }

	  FirstBall.prototype.vars = function() {
	    this.S = this.o.S;
	    this.path = document.querySelector('#js-curve-3');
	    this.pathMask = document.querySelector('#js-curve-3-mask');
	    this.n1 = document.querySelector('#js-n-1');
	    this.n2 = document.querySelector('#js-n-2');
	    return this.easing = mojs.easing.bezier(0.435, 0.715, 0.635, 0.395);
	  };

	  FirstBall.prototype.create = function() {
	    var burst, burst2, it, mp, n1Stagger, n2Stagger, nDelay, nDuration, opacityDelta, shift, trail, trailFade, tween;
	    trail = new mojs.Transit({
	      bit: this.pathMask,
	      fill: 'transparent',
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '200%': '100%'
	      },
	      strokeWidth: 4 * this.o.TRAIL_WIDTH,
	      stroke: this.o.BG,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: this.o.BALL_4_START * this.S,
	      duration: this.o.BALL_4_ARCDUR * this.S,
	      easing: this.easing,
	      isRunLess: this.o.IS_RUNLESS,
	      strokeLinecap: 'round'
	    });
	    opacityDelta = {};
	    opacityDelta[this.o.TRAIL_OPACITY] = 0;
	    trailFade = new mojs.Transit({
	      bit: this.path,
	      fill: 'transparent',
	      strokeDasharray: this.o.TRAIL_DASH,
	      strokeWidth: this.o.TRAIL_WIDTH,
	      stroke: this.o.TRAIL_COLOR,
	      opacity: opacityDelta,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: (this.o.BALL_4_START + (this.o.BALL_4_ARCDUR / 1.25)) * this.S,
	      duration: this.o.TRAIL_FADE * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    mp = new mojs.MotionPath({
	      path: this.path,
	      el: this.o.mainBall.el,
	      isRunLess: this.o.IS_RUNLESS,
	      delay: this.o.BALL_4_START * this.S,
	      duration: this.o.BALL_4_ARCDUR * this.S,
	      easing: this.easing,
	      isAngle: true,
	      angleOffset: 90
	    });
	    burst = new mojs.Burst({
	      parent: this.o.ctx,
	      x: 209,
	      y: this.o.bottomLineBurst,
	      degree: 180,
	      angle: 90,
	      radius: {
	        10: 25
	      },
	      type: 'line',
	      fill: 'none',
	      stroke: this.o.CYAN,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_4_START + this.o.BALL_4_ARCDUR + 10) * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          7: 0
	        }
	      }
	    });
	    burst2 = new mojs.Burst({
	      parent: this.o.ctx,
	      x: 395,
	      y: this.o.CHARS_TOP,
	      count: 3,
	      degree: 220,
	      angle: -50,
	      radius: {
	        4: 20
	      },
	      fill: 'transparent',
	      type: 'line',
	      stroke: this.o.YELLOW,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_4_START + 900) * this.S,
	      duration: 600 * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    nDuration = this.o.CHAR_DUR;
	    nDelay = this.o.BALL_4_START + 200;
	    n1Stagger = new mojs.Stagger({
	      els: this.n1,
	      duration: nDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (nDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '200%'
	      }
	    });
	    n2Stagger = new mojs.Stagger({
	      els: this.n2,
	      duration: nDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (nDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '200%'
	      }
	    });
	    tween = new mojs.Tween;
	    shift = 22.5;
	    it = this;
	    tween.add(new mojs.Timeline({
	      duration: nDuration * this.S,
	      delay: nDelay * this.S,
	      easing: this.o.STAGGER_EASING,
	      onUpdate: function(p) {
	        it.n1.setAttribute('transform', "translate(" + (shift * p) + ")");
	        return it.n2.setAttribute('transform', "translate(" + (-shift * p) + ")");
	      }
	    }));
	    this.o.IS_RUNLESS || tween.start();
	    return [tween, n1Stagger.tween, n2Stagger.tween, burst.tween, mp.tween, trail.tween, trailFade.tween];
	  };

	  return FirstBall;

	})();

	module.exports = FirstBall;


/***/ },

/***/ 229:
/***/ function(module, exports, __webpack_require__) {

	var FirstBall, mojs;

	mojs = __webpack_require__(62);

	FirstBall = (function() {
	  function FirstBall(o) {
	    this.o = o != null ? o : {};
	    this.vars();
	    return this.create();
	  }

	  FirstBall.prototype.vars = function() {
	    this.S = this.o.S;
	    this.path = document.querySelector('#js-curve-4');
	    this.pathMask = document.querySelector('#js-curve-4-mask');
	    this.line1 = document.querySelector('#js-t-line-1');
	    this.line2 = document.querySelector('#js-t-line-2');
	    this.line3 = document.querySelector('#js-t-line-3');
	    return this.easing = mojs.easing.bezier(0.220, 0.665, 0.825, 0.430);
	  };

	  FirstBall.prototype.create = function() {
	    var burst, mp, oBottomStagger, oTopStagger, opacityDelta, t1Stagger, t2Stagger, t3Stagger, tDelay, tDuration, trail, trailFade;
	    trail = new mojs.Transit({
	      bit: this.pathMask,
	      fill: 'transparent',
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '200%': '100%'
	      },
	      strokeWidth: 4 * this.o.TRAIL_WIDTH,
	      stroke: this.o.BG,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: this.o.BALL_5_START * this.S,
	      duration: this.o.BALL_5_ARCDUR * this.S,
	      easing: this.easing,
	      isRunLess: this.o.IS_RUNLESS,
	      strokeLinecap: 'round'
	    });
	    opacityDelta = {};
	    opacityDelta[this.o.TRAIL_OPACITY] = 0;
	    trailFade = new mojs.Transit({
	      bit: this.path,
	      fill: 'transparent',
	      strokeDasharray: this.o.TRAIL_DASH,
	      strokeWidth: this.o.TRAIL_WIDTH,
	      stroke: this.o.TRAIL_COLOR,
	      opacity: opacityDelta,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: (this.o.BALL_5_START + (this.o.BALL_5_ARCDUR / 1.25)) * this.S,
	      duration: this.o.TRAIL_FADE * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    mp = new mojs.MotionPath({
	      path: this.path,
	      el: this.o.mainBall.el,
	      isRunLess: this.o.IS_RUNLESS,
	      delay: this.o.BALL_5_START * this.S,
	      duration: this.o.BALL_5_ARCDUR * this.S,
	      easing: this.easing,
	      isAngle: true,
	      angleOffset: 90
	    });
	    burst = new mojs.Burst({
	      parent: this.o.ctx,
	      x: 89,
	      y: this.o.bottomLineBurst,
	      degree: 180,
	      angle: 90,
	      radius: {
	        10: 25
	      },
	      type: 'line',
	      fill: 'none',
	      stroke: this.o.PINK,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_5_START + this.o.BALL_5_ARCDUR) * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          7: 0
	        }
	      }
	    });
	    tDuration = 1000;
	    tDelay = this.o.BALL_5_START + 200;
	    t1Stagger = new mojs.Stagger({
	      els: this.line1,
	      duration: tDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (tDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': 0
	      }
	    });
	    t2Stagger = new mojs.Stagger({
	      els: this.line2,
	      duration: tDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((tDelay + 100) * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': 0
	      }
	    });
	    t3Stagger = new mojs.Stagger({
	      els: this.line3,
	      duration: tDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((tDelay + 100) * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '200%'
	      }
	    });
	    oTopStagger = new mojs.Stagger({
	      els: '#js-circles-right-top',
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((tDelay + tDuration / 2) * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeWidth: 1.3,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '200%'
	      }
	    });
	    oBottomStagger = new mojs.Stagger({
	      els: '#js-circles-right-bottom',
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((tDelay + tDuration / 2) * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeWidth: 1.3,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '0%'
	      }
	    });
	    return [t1Stagger.tween, t2Stagger.tween, t3Stagger.tween, burst.tween, mp.tween, trail.tween, trailFade.tween, oTopStagger.tween, oBottomStagger.tween];
	  };

	  return FirstBall;

	})();

	module.exports = FirstBall;


/***/ },

/***/ 230:
/***/ function(module, exports, __webpack_require__) {

	var FirstBall, mojs;

	mojs = __webpack_require__(62);

	FirstBall = (function() {
	  function FirstBall(o) {
	    this.o = o != null ? o : {};
	    this.vars();
	    return this.create();
	  }

	  FirstBall.prototype.vars = function() {
	    this.S = this.o.S;
	    this.path = document.querySelector('#js-curve-5');
	    this.pathMask = document.querySelector('#js-curve-5-mask');
	    this.line1 = document.querySelector('#js-m-line-1');
	    this.line2 = document.querySelector('#js-m-line-2');
	    return this.easing = mojs.easing.bezier(0.435, 0.715, 0.635, 0.395);
	  };

	  FirstBall.prototype.create = function() {
	    var burst, forBurst, forDelay, forDuration, forStagger, m1Stagger, m2Stagger, mDelay, mDuration, mp, opacityDelta, shift, trail, trailFade;
	    trail = new mojs.Transit({
	      bit: this.pathMask,
	      fill: 'transparent',
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '200%': '100%'
	      },
	      strokeWidth: 4 * this.o.TRAIL_WIDTH,
	      stroke: this.o.BG,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: this.o.BALL_6_START * this.S,
	      duration: this.o.BALL_6_ARCDUR * this.S,
	      easing: this.easing,
	      isRunLess: this.o.IS_RUNLESS,
	      strokeLinecap: 'round'
	    });
	    opacityDelta = {};
	    opacityDelta[this.o.TRAIL_OPACITY] = 0;
	    trailFade = new mojs.Transit({
	      bit: this.path,
	      fill: 'transparent',
	      strokeDasharray: this.o.TRAIL_DASH,
	      strokeWidth: this.o.TRAIL_WIDTH,
	      stroke: this.o.TRAIL_COLOR,
	      opacity: opacityDelta,
	      isShowInit: true,
	      isShowEnd: true,
	      delay: (this.o.BALL_6_START + (this.o.BALL_6_ARCDUR / 1.25)) * this.S,
	      duration: this.o.TRAIL_FADE * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    });
	    mp = new mojs.MotionPath({
	      path: this.path,
	      el: this.o.mainBall.el,
	      isRunLess: this.o.IS_RUNLESS,
	      delay: this.o.BALL_6_START * this.S,
	      duration: this.o.BALL_6_ARCDUR * this.S,
	      easing: this.easing,
	      isAngle: true,
	      angleOffset: 90
	    });
	    burst = new mojs.Burst({
	      parent: this.o.ctx,
	      x: 240,
	      y: this.o.bottomLineBurst,
	      degree: 180,
	      angle: 90,
	      radius: {
	        10: 25
	      },
	      type: 'line',
	      fill: 'none',
	      stroke: this.o.YELLOW,
	      strokeWidth: this.o.STROKE_WIDTH,
	      delay: (this.o.BALL_6_START + this.o.BALL_6_ARCDUR + 50) * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          7: 0
	        }
	      }
	    });
	    mDuration = 1000;
	    mDelay = this.o.BALL_6_START + 200;
	    m1Stagger = new mojs.Stagger({
	      els: this.line1,
	      duration: mDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (mDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '200%'
	      }
	    });
	    forDelay = mDelay;
	    forDuration = mDuration;
	    forStagger = new mojs.Stagger({
	      els: '#js-for-the-web',
	      duration: forDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (forDelay * this.S) + ", 100)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.WHITE,
	      strokeWidth: .5,
	      strokeDasharray: '',
	      strokeDashoffset: 0,
	      fill: this.o.WHITE,
	      opacity: {
	        0: 1
	      }
	    });
	    forBurst = new mojs.Burst({
	      parent: this.o.ctx,
	      x: 413,
	      y: this.o.bottomLineBurst + 25,
	      angle: 15,
	      radius: {
	        8: 15
	      },
	      type: 'line',
	      fill: 'none',
	      stroke: [this.o.PINK, this.o.CYAN],
	      strokeWidth: 1,
	      delay: (forDelay + forDuration + 300) * this.S,
	      count: 4,
	      isRunLess: this.o.IS_RUNLESS,
	      childOptions: {
	        radius: {
	          'rand(2,4)': 0
	        }
	      }
	    });
	    shift = 15;
	    m2Stagger = new mojs.Stagger({
	      els: this.line2,
	      duration: mDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (mDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '200%'
	      },
	      onUpdate: [
	        ((function(_this) {
	          return function(p) {
	            _this.line1.setAttribute('transform', "translate(" + (shift * p) + ")");
	            return _this.line2.setAttribute('transform', "translate(" + (-shift * p) + ")");
	          };
	        })(this)), null, null
	      ]
	    });
	    return [burst.tween, m1Stagger.tween, m2Stagger.tween, mp.tween, trail.tween, trailFade.tween, forStagger.tween, forBurst.tween];
	  };

	  return FirstBall;

	})();

	module.exports = FirstBall;


/***/ },

/***/ 231:
/***/ function(module, exports, __webpack_require__) {

	var Ball;

	Ball = (function() {
	  function Ball(o) {
	    this.o = o != null ? o : {};
	    this.vars();
	    return this.create();
	  }

	  Ball.prototype.vars = function() {
	    this.S = this.o.S;
	    this.line1 = document.querySelector('#js-i-line-1');
	    this.line2 = document.querySelector('#js-i-line-2');
	    return this.line3 = document.querySelector('#js-i-line-3');
	  };

	  Ball.prototype.create = function() {
	    var auroraStagger, circle, i1Stagger, i2Stagger, i3Stagger, iDelay, iDelay2, iDuration, iDuration2, mp, oBottomStagger, oTopStagger;
	    mp = new mojs.MotionPath({
	      path: "M240.529297,234.470827 L240.529297,57",
	      el: this.o.mainBall.el,
	      isRunLess: this.o.IS_RUNLESS,
	      delay: this.o.BALL_7_START * this.S,
	      easing: 'elastic.out',
	      isAngle: true,
	      angleOffset: 90,
	      pathEnd: .38,
	      duration: 2800 * this.S
	    });
	    iDuration = 800;
	    iDelay2 = this.o.BALL_7_START + 100;
	    iDuration2 = 250;
	    iDelay = iDelay2 + iDuration2;
	    i1Stagger = new mojs.Stagger({
	      els: this.line1,
	      duration: iDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (iDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': 0
	      }
	    });
	    i2Stagger = new mojs.Stagger({
	      els: this.line2,
	      duration: iDuration * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((iDelay + 100) * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': 0
	      }
	    });
	    i3Stagger = new mojs.Stagger({
	      els: this.line3,
	      duration: 2400 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((iDelay2 - 75) * this.S) + ", 25)",
	      easing: 'elastic.out',
	      stroke: this.o.STAGGER_COLORS,
	      strokeDasharray: '100% 120%',
	      strokeDashoffset: {
	        '120%': '71.5%'
	      }
	    });
	    oTopStagger = new mojs.Stagger({
	      els: '#js-circles-left-top',
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (iDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeWidth: 1.3,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '200%'
	      }
	    });
	    oBottomStagger = new mojs.Stagger({
	      els: '#js-circles-left-bottom',
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + (iDelay * this.S) + ", 200)",
	      easing: this.o.STAGGER_EASING,
	      stroke: this.o.STAGGER_COLORS,
	      strokeWidth: 1.3,
	      strokeDasharray: '100%',
	      strokeDashoffset: {
	        '100%': '0%'
	      }
	    });
	    auroraStagger = new mojs.Stagger({
	      els: '#js-aurora',
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS,
	      isShowEnd: true,
	      delay: "stagger(" + ((this.o.DELAY_START + 3000) * this.S) + ", 200)",
	      easing: 'sin.out',
	      stroke: [this.o.YELLOW, this.o.CYAN, this.o.PINK],
	      strokeWidth: {
	        5: 0
	      },
	      strokeDasharray: '20 100 40 50',
	      strokeDashoffset: {
	        0: '100'
	      }
	    });
	    circle = new mojs.Transit({
	      parent: this.o.ctx,
	      x: this.o.o2Left - 46,
	      y: 167,
	      type: 'circle',
	      radius: 3 * this.o.CIRCLE_RADIUS,
	      fill: 'transparent',
	      strokeWidth: this.o.STROKE_WIDTH,
	      stroke: this.o.CYAN,
	      strokeDasharray: '100% 200%',
	      strokeDashoffset: {
	        '100%': '50%'
	      },
	      angle: 180,
	      delay: (this.o.BALL_7_START + this.o.BALL_7_ARCDUR + iDuration2) * this.S,
	      duration: 300 * this.S,
	      isRunLess: this.o.IS_RUNLESS
	    }).then({
	      strokeDashoffset: '100%',
	      angle: 360,
	      delay: 0
	    });
	    return [mp.tween, i1Stagger.tween, i2Stagger.tween, i3Stagger.tween, circle.tween, auroraStagger.tween, oTopStagger.tween, oBottomStagger.tween];
	  };

	  return Ball;

	})();

	module.exports = Ball;


/***/ },

/***/ 311:
/***/ function(module, exports, __webpack_require__) {

	var __WEBPACK_AMD_DEFINE_RESULT__;/*!
	 *  howler.js v1.1.26
	 *  howlerjs.com
	 *
	 *  (c) 2013-2015, James Simpson of GoldFire Studios
	 *  goldfirestudios.com
	 *
	 *  MIT License
	 */

	(function() {
	  // setup
	  var cache = {};

	  // setup the audio context
	  var ctx = null,
	    usingWebAudio = true,
	    noAudio = false;
	  try {
	    if (typeof AudioContext !== 'undefined') {
	      ctx = new AudioContext();
	    } else if (typeof webkitAudioContext !== 'undefined') {
	      ctx = new webkitAudioContext();
	    } else {
	      usingWebAudio = false;
	    }
	  } catch(e) {
	    usingWebAudio = false;
	  }

	  if (!usingWebAudio) {
	    if (typeof Audio !== 'undefined') {
	      try {
	        new Audio();
	      } catch(e) {
	        noAudio = true;
	      }
	    } else {
	      noAudio = true;
	    }
	  }

	  // create a master gain node
	  if (usingWebAudio) {
	    var masterGain = (typeof ctx.createGain === 'undefined') ? ctx.createGainNode() : ctx.createGain();
	    masterGain.gain.value = 1;
	    masterGain.connect(ctx.destination);
	  }

	  // create global controller
	  var HowlerGlobal = function(codecs) {
	    this._volume = 1;
	    this._muted = false;
	    this.usingWebAudio = usingWebAudio;
	    this.ctx = ctx;
	    this.noAudio = noAudio;
	    this._howls = [];
	    this._codecs = codecs;
	    this.iOSAutoEnable = true;
	  };
	  HowlerGlobal.prototype = {
	    /**
	     * Get/set the global volume for all sounds.
	     * @param  {Float} vol Volume from 0.0 to 1.0.
	     * @return {Howler/Float}     Returns self or current volume.
	     */
	    volume: function(vol) {
	      var self = this;

	      // make sure volume is a number
	      vol = parseFloat(vol);

	      if (vol >= 0 && vol <= 1) {
	        self._volume = vol;

	        if (usingWebAudio) {
	          masterGain.gain.value = vol;
	        }

	        // loop through cache and change volume of all nodes that are using HTML5 Audio
	        for (var key in self._howls) {
	          if (self._howls.hasOwnProperty(key) && self._howls[key]._webAudio === false) {
	            // loop through the audio nodes
	            for (var i=0; i<self._howls[key]._audioNode.length; i++) {
	              self._howls[key]._audioNode[i].volume = self._howls[key]._volume * self._volume;
	            }
	          }
	        }

	        return self;
	      }

	      // return the current global volume
	      return (usingWebAudio) ? masterGain.gain.value : self._volume;
	    },

	    /**
	     * Mute all sounds.
	     * @return {Howler}
	     */
	    mute: function() {
	      this._setMuted(true);

	      return this;
	    },

	    /**
	     * Unmute all sounds.
	     * @return {Howler}
	     */
	    unmute: function() {
	      this._setMuted(false);

	      return this;
	    },

	    /**
	     * Handle muting and unmuting globally.
	     * @param  {Boolean} muted Is muted or not.
	     */
	    _setMuted: function(muted) {
	      var self = this;

	      self._muted = muted;

	      if (usingWebAudio) {
	        masterGain.gain.value = muted ? 0 : self._volume;
	      }

	      for (var key in self._howls) {
	        if (self._howls.hasOwnProperty(key) && self._howls[key]._webAudio === false) {
	          // loop through the audio nodes
	          for (var i=0; i<self._howls[key]._audioNode.length; i++) {
	            self._howls[key]._audioNode[i].muted = muted;
	          }
	        }
	      }
	    },

	    /**
	     * Check for codec support.
	     * @param  {String} ext Audio file extention.
	     * @return {Boolean}
	     */
	    codecs: function(ext) {
	      return this._codecs[ext];
	    },

	    /**
	     * iOS will only allow audio to be played after a user interaction.
	     * Attempt to automatically unlock audio on the first user interaction.
	     * Concept from: http://paulbakaus.com/tutorials/html5/web-audio-on-ios/
	     * @return {Howler}
	     */
	    _enableiOSAudio: function() {
	      var self = this;

	      // only run this on iOS if audio isn't already eanbled
	      if (ctx && (self._iOSEnabled || !/iPhone|iPad|iPod/i.test(navigator.userAgent))) {
	        return;
	      }

	      self._iOSEnabled = false;

	      // call this method on touch start to create and play a buffer,
	      // then check if the audio actually played to determine if
	      // audio has now been unlocked on iOS
	      var unlock = function() {
	        // create an empty buffer
	        var buffer = ctx.createBuffer(1, 1, 22050);
	        var source = ctx.createBufferSource();
	        source.buffer = buffer;
	        source.connect(ctx.destination);

	        // play the empty buffer
	        if (typeof source.start === 'undefined') {
	          source.noteOn(0);
	        } else {
	          source.start(0);
	        }

	        // setup a timeout to check that we are unlocked on the next event loop
	        setTimeout(function() {
	          if ((source.playbackState === source.PLAYING_STATE || source.playbackState === source.FINISHED_STATE)) {
	            // update the unlocked state and prevent this check from happening again
	            self._iOSEnabled = true;
	            self.iOSAutoEnable = false;

	            // remove the touch start listener
	            window.removeEventListener('touchstart', unlock, false);
	          }
	        }, 0);
	      };

	      // setup a touch start listener to attempt an unlock in
	      window.addEventListener('touchstart', unlock, false);

	      return self;
	    }
	  };

	  // check for browser codec support
	  var audioTest = null;
	  var codecs = {};
	  if (!noAudio) {
	    audioTest = new Audio();
	    codecs = {
	      mp3: !!audioTest.canPlayType('audio/mpeg;').replace(/^no$/, ''),
	      opus: !!audioTest.canPlayType('audio/ogg; codecs="opus"').replace(/^no$/, ''),
	      ogg: !!audioTest.canPlayType('audio/ogg; codecs="vorbis"').replace(/^no$/, ''),
	      wav: !!audioTest.canPlayType('audio/wav; codecs="1"').replace(/^no$/, ''),
	      aac: !!audioTest.canPlayType('audio/aac;').replace(/^no$/, ''),
	      m4a: !!(audioTest.canPlayType('audio/x-m4a;') || audioTest.canPlayType('audio/m4a;') || audioTest.canPlayType('audio/aac;')).replace(/^no$/, ''),
	      mp4: !!(audioTest.canPlayType('audio/x-mp4;') || audioTest.canPlayType('audio/mp4;') || audioTest.canPlayType('audio/aac;')).replace(/^no$/, ''),
	      weba: !!audioTest.canPlayType('audio/webm; codecs="vorbis"').replace(/^no$/, '')
	    };
	  }

	  // allow access to the global audio controls
	  var Howler = new HowlerGlobal(codecs);

	  // setup the audio object
	  var Howl = function(o) {
	    var self = this;

	    // setup the defaults
	    self._autoplay = o.autoplay || false;
	    self._buffer = o.buffer || false;
	    self._duration = o.duration || 0;
	    self._format = o.format || null;
	    self._loop = o.loop || false;
	    self._loaded = false;
	    self._sprite = o.sprite || {};
	    self._src = o.src || '';
	    self._pos3d = o.pos3d || [0, 0, -0.5];
	    self._volume = o.volume !== undefined ? o.volume : 1;
	    self._urls = o.urls || [];
	    self._rate = o.rate || 1;

	    // allow forcing of a specific panningModel ('equalpower' or 'HRTF'),
	    // if none is specified, defaults to 'equalpower' and switches to 'HRTF'
	    // if 3d sound is used
	    self._model = o.model || null;

	    // setup event functions
	    self._onload = [o.onload || function() {}];
	    self._onloaderror = [o.onloaderror || function() {}];
	    self._onend = [o.onend || function() {}];
	    self._onpause = [o.onpause || function() {}];
	    self._onplay = [o.onplay || function() {}];

	    self._onendTimer = [];

	    // Web Audio or HTML5 Audio?
	    self._webAudio = usingWebAudio && !self._buffer;

	    // check if we need to fall back to HTML5 Audio
	    self._audioNode = [];
	    if (self._webAudio) {
	      self._setupAudioNode();
	    }

	    // automatically try to enable audio on iOS
	    if (typeof ctx !== 'undefined' && ctx && Howler.iOSAutoEnable) {
	      Howler._enableiOSAudio();
	    }

	    // add this to an array of Howl's to allow global control
	    Howler._howls.push(self);

	    // load the track
	    self.load();
	  };

	  // setup all of the methods
	  Howl.prototype = {
	    /**
	     * Load an audio file.
	     * @return {Howl}
	     */
	    load: function() {
	      var self = this,
	        url = null;

	      // if no audio is available, quit immediately
	      if (noAudio) {
	        self.on('loaderror');
	        return;
	      }

	      // loop through source URLs and pick the first one that is compatible
	      for (var i=0; i<self._urls.length; i++) {
	        var ext, urlItem;

	        if (self._format) {
	          // use specified audio format if available
	          ext = self._format;
	        } else {
	          // figure out the filetype (whether an extension or base64 data)
	          urlItem = self._urls[i];
	          ext = /^data:audio\/([^;,]+);/i.exec(urlItem);
	          if (!ext) {
	            ext = /\.([^.]+)$/.exec(urlItem.split('?', 1)[0]);
	          }

	          if (ext) {
	            ext = ext[1].toLowerCase();
	          } else {
	            self.on('loaderror');
	            return;
	          }
	        }

	        if (codecs[ext]) {
	          url = self._urls[i];
	          break;
	        }
	      }

	      if (!url) {
	        self.on('loaderror');
	        return;
	      }

	      self._src = url;

	      if (self._webAudio) {
	        loadBuffer(self, url);
	      } else {
	        var newNode = new Audio();

	        // listen for errors with HTML5 audio (http://dev.w3.org/html5/spec-author-view/spec.html#mediaerror)
	        newNode.addEventListener('error', function () {
	          if (newNode.error && newNode.error.code === 4) {
	            HowlerGlobal.noAudio = true;
	          }

	          self.on('loaderror', {type: newNode.error ? newNode.error.code : 0});
	        }, false);

	        self._audioNode.push(newNode);

	        // setup the new audio node
	        newNode.src = url;
	        newNode._pos = 0;
	        newNode.preload = 'auto';
	        newNode.volume = (Howler._muted) ? 0 : self._volume * Howler.volume();

	        // setup the event listener to start playing the sound
	        // as soon as it has buffered enough
	        var listener = function() {
	          // round up the duration when using HTML5 Audio to account for the lower precision
	          self._duration = Math.ceil(newNode.duration * 10) / 10;

	          // setup a sprite if none is defined
	          if (Object.getOwnPropertyNames(self._sprite).length === 0) {
	            self._sprite = {_default: [0, self._duration * 1000]};
	          }

	          if (!self._loaded) {
	            self._loaded = true;
	            self.on('load');
	          }

	          if (self._autoplay) {
	            self.play();
	          }

	          // clear the event listener
	          newNode.removeEventListener('canplaythrough', listener, false);
	        };
	        newNode.addEventListener('canplaythrough', listener, false);
	        newNode.load();
	      }

	      return self;
	    },

	    /**
	     * Get/set the URLs to be pulled from to play in this source.
	     * @param  {Array} urls  Arry of URLs to load from
	     * @return {Howl}        Returns self or the current URLs
	     */
	    urls: function(urls) {
	      var self = this;

	      if (urls) {
	        self.stop();
	        self._urls = (typeof urls === 'string') ? [urls] : urls;
	        self._loaded = false;
	        self.load();

	        return self;
	      } else {
	        return self._urls;
	      }
	    },

	    /**
	     * Play a sound from the current time (0 by default).
	     * @param  {String}   sprite   (optional) Plays from the specified position in the sound sprite definition.
	     * @param  {Function} callback (optional) Returns the unique playback id for this sound instance.
	     * @return {Howl}
	     */
	    play: function(sprite, callback) {
	      var self = this;

	      // if no sprite was passed but a callback was, update the variables
	      if (typeof sprite === 'function') {
	        callback = sprite;
	      }

	      // use the default sprite if none is passed
	      if (!sprite || typeof sprite === 'function') {
	        sprite = '_default';
	      }

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('load', function() {
	          self.play(sprite, callback);
	        });

	        return self;
	      }

	      // if the sprite doesn't exist, play nothing
	      if (!self._sprite[sprite]) {
	        if (typeof callback === 'function') callback();
	        return self;
	      }

	      // get the node to playback
	      self._inactiveNode(function(node) {
	        // persist the sprite being played
	        node._sprite = sprite;

	        // determine where to start playing from
	        var pos = (node._pos > 0) ? node._pos : self._sprite[sprite][0] / 1000;

	        // determine how long to play for
	        var duration = 0;
	        if (self._webAudio) {
	          duration = self._sprite[sprite][1] / 1000 - node._pos;
	          if (node._pos > 0) {
	            pos = self._sprite[sprite][0] / 1000 + pos;
	          }
	        } else {
	          duration = self._sprite[sprite][1] / 1000 - (pos - self._sprite[sprite][0] / 1000);
	        }

	        // determine if this sound should be looped
	        var loop = !!(self._loop || self._sprite[sprite][2]);

	        // set timer to fire the 'onend' event
	        var soundId = (typeof callback === 'string') ? callback : Math.round(Date.now() * Math.random()) + '',
	          timerId;
	        (function() {
	          var data = {
	            id: soundId,
	            sprite: sprite,
	            loop: loop
	          };
	          timerId = setTimeout(function() {
	            // if looping, restart the track
	            if (!self._webAudio && loop) {
	              self.stop(data.id).play(sprite, data.id);
	            }

	            // set web audio node to paused at end
	            if (self._webAudio && !loop) {
	              self._nodeById(data.id).paused = true;
	              self._nodeById(data.id)._pos = 0;

	              // clear the end timer
	              self._clearEndTimer(data.id);
	            }

	            // end the track if it is HTML audio and a sprite
	            if (!self._webAudio && !loop) {
	              self.stop(data.id);
	            }

	            // fire ended event
	            self.on('end', soundId);
	          }, duration * 1000);

	          // store the reference to the timer
	          self._onendTimer.push({timer: timerId, id: data.id});
	        })();

	        if (self._webAudio) {
	          var loopStart = self._sprite[sprite][0] / 1000,
	            loopEnd = self._sprite[sprite][1] / 1000;

	          // set the play id to this node and load into context
	          node.id = soundId;
	          node.paused = false;
	          refreshBuffer(self, [loop, loopStart, loopEnd], soundId);
	          self._playStart = ctx.currentTime;
	          node.gain.value = self._volume;

	          if (typeof node.bufferSource.start === 'undefined') {
	            loop ? node.bufferSource.noteGrainOn(0, pos, 86400) : node.bufferSource.noteGrainOn(0, pos, duration);
	          } else {
	            loop ? node.bufferSource.start(0, pos, 86400) : node.bufferSource.start(0, pos, duration);
	          }
	        } else {
	          if (node.readyState === 4 || !node.readyState && navigator.isCocoonJS) {
	            node.readyState = 4;
	            node.id = soundId;
	            node.currentTime = pos;
	            node.muted = Howler._muted || node.muted;
	            node.volume = self._volume * Howler.volume();
	            setTimeout(function() { node.play(); }, 0);
	          } else {
	            self._clearEndTimer(soundId);

	            (function(){
	              var sound = self,
	                playSprite = sprite,
	                fn = callback,
	                newNode = node;
	              var listener = function() {
	                sound.play(playSprite, fn);

	                // clear the event listener
	                newNode.removeEventListener('canplaythrough', listener, false);
	              };
	              newNode.addEventListener('canplaythrough', listener, false);
	            })();

	            return self;
	          }
	        }

	        // fire the play event and send the soundId back in the callback
	        self.on('play');
	        if (typeof callback === 'function') callback(soundId);

	        return self;
	      });

	      return self;
	    },

	    /**
	     * Pause playback and save the current position.
	     * @param {String} id (optional) The play instance ID.
	     * @return {Howl}
	     */
	    pause: function(id) {
	      var self = this;

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('play', function() {
	          self.pause(id);
	        });

	        return self;
	      }

	      // clear 'onend' timer
	      self._clearEndTimer(id);

	      var activeNode = (id) ? self._nodeById(id) : self._activeNode();
	      if (activeNode) {
	        activeNode._pos = self.pos(null, id);

	        if (self._webAudio) {
	          // make sure the sound has been created
	          if (!activeNode.bufferSource || activeNode.paused) {
	            return self;
	          }

	          activeNode.paused = true;
	          if (typeof activeNode.bufferSource.stop === 'undefined') {
	            activeNode.bufferSource.noteOff(0);
	          } else {
	            activeNode.bufferSource.stop(0);
	          }
	        } else {
	          activeNode.pause();
	        }
	      }

	      self.on('pause');

	      return self;
	    },

	    /**
	     * Stop playback and reset to start.
	     * @param  {String} id  (optional) The play instance ID.
	     * @return {Howl}
	     */
	    stop: function(id) {
	      var self = this;

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('play', function() {
	          self.stop(id);
	        });

	        return self;
	      }

	      // clear 'onend' timer
	      self._clearEndTimer(id);

	      var activeNode = (id) ? self._nodeById(id) : self._activeNode();
	      if (activeNode) {
	        activeNode._pos = 0;

	        if (self._webAudio) {
	          // make sure the sound has been created
	          if (!activeNode.bufferSource || activeNode.paused) {
	            return self;
	          }

	          activeNode.paused = true;

	          if (typeof activeNode.bufferSource.stop === 'undefined') {
	            activeNode.bufferSource.noteOff(0);
	          } else {
	            activeNode.bufferSource.stop(0);
	          }
	        } else if (!isNaN(activeNode.duration)) {
	          activeNode.pause();
	          activeNode.currentTime = 0;
	        }
	      }

	      return self;
	    },

	    /**
	     * Mute this sound.
	     * @param  {String} id (optional) The play instance ID.
	     * @return {Howl}
	     */
	    mute: function(id) {
	      var self = this;

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('play', function() {
	          self.mute(id);
	        });

	        return self;
	      }

	      var activeNode = (id) ? self._nodeById(id) : self._activeNode();
	      if (activeNode) {
	        if (self._webAudio) {
	          activeNode.gain.value = 0;
	        } else {
	          activeNode.muted = true;
	        }
	      }

	      return self;
	    },

	    /**
	     * Unmute this sound.
	     * @param  {String} id (optional) The play instance ID.
	     * @return {Howl}
	     */
	    unmute: function(id) {
	      var self = this;

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('play', function() {
	          self.unmute(id);
	        });

	        return self;
	      }

	      var activeNode = (id) ? self._nodeById(id) : self._activeNode();
	      if (activeNode) {
	        if (self._webAudio) {
	          activeNode.gain.value = self._volume;
	        } else {
	          activeNode.muted = false;
	        }
	      }

	      return self;
	    },

	    /**
	     * Get/set volume of this sound.
	     * @param  {Float}  vol Volume from 0.0 to 1.0.
	     * @param  {String} id  (optional) The play instance ID.
	     * @return {Howl/Float}     Returns self or current volume.
	     */
	    volume: function(vol, id) {
	      var self = this;

	      // make sure volume is a number
	      vol = parseFloat(vol);

	      if (vol >= 0 && vol <= 1) {
	        self._volume = vol;

	        // if the sound hasn't been loaded, add it to the event queue
	        if (!self._loaded) {
	          self.on('play', function() {
	            self.volume(vol, id);
	          });

	          return self;
	        }

	        var activeNode = (id) ? self._nodeById(id) : self._activeNode();
	        if (activeNode) {
	          if (self._webAudio) {
	            activeNode.gain.value = vol;
	          } else {
	            activeNode.volume = vol * Howler.volume();
	          }
	        }

	        return self;
	      } else {
	        return self._volume;
	      }
	    },

	    /**
	     * Get/set whether to loop the sound.
	     * @param  {Boolean} loop To loop or not to loop, that is the question.
	     * @return {Howl/Boolean}      Returns self or current looping value.
	     */
	    loop: function(loop) {
	      var self = this;

	      if (typeof loop === 'boolean') {
	        self._loop = loop;

	        return self;
	      } else {
	        return self._loop;
	      }
	    },

	    /**
	     * Get/set sound sprite definition.
	     * @param  {Object} sprite Example: {spriteName: [offset, duration, loop]}
	     *                @param {Integer} offset   Where to begin playback in milliseconds
	     *                @param {Integer} duration How long to play in milliseconds
	     *                @param {Boolean} loop     (optional) Set true to loop this sprite
	     * @return {Howl}        Returns current sprite sheet or self.
	     */
	    sprite: function(sprite) {
	      var self = this;

	      if (typeof sprite === 'object') {
	        self._sprite = sprite;

	        return self;
	      } else {
	        return self._sprite;
	      }
	    },

	    /**
	     * Get/set the position of playback.
	     * @param  {Float}  pos The position to move current playback to.
	     * @param  {String} id  (optional) The play instance ID.
	     * @return {Howl/Float}      Returns self or current playback position.
	     */
	    pos: function(pos, id) {
	      var self = this;

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('load', function() {
	          self.pos(pos);
	        });

	        return typeof pos === 'number' ? self : self._pos || 0;
	      }

	      // make sure we are dealing with a number for pos
	      pos = parseFloat(pos);

	      var activeNode = (id) ? self._nodeById(id) : self._activeNode();
	      if (activeNode) {
	        if (pos >= 0) {
	          self.pause(id);
	          activeNode._pos = pos;
	          self.play(activeNode._sprite, id);

	          return self;
	        } else {
	          return self._webAudio ? activeNode._pos + (ctx.currentTime - self._playStart) : activeNode.currentTime;
	        }
	      } else if (pos >= 0) {
	        return self;
	      } else {
	        // find the first inactive node to return the pos for
	        for (var i=0; i<self._audioNode.length; i++) {
	          if (self._audioNode[i].paused && self._audioNode[i].readyState === 4) {
	            return (self._webAudio) ? self._audioNode[i]._pos : self._audioNode[i].currentTime;
	          }
	        }
	      }
	    },

	    /**
	     * Get/set the 3D position of the audio source.
	     * The most common usage is to set the 'x' position
	     * to affect the left/right ear panning. Setting any value higher than
	     * 1.0 will begin to decrease the volume of the sound as it moves further away.
	     * NOTE: This only works with Web Audio API, HTML5 Audio playback
	     * will not be affected.
	     * @param  {Float}  x  The x-position of the playback from -1000.0 to 1000.0
	     * @param  {Float}  y  The y-position of the playback from -1000.0 to 1000.0
	     * @param  {Float}  z  The z-position of the playback from -1000.0 to 1000.0
	     * @param  {String} id (optional) The play instance ID.
	     * @return {Howl/Array}   Returns self or the current 3D position: [x, y, z]
	     */
	    pos3d: function(x, y, z, id) {
	      var self = this;

	      // set a default for the optional 'y' & 'z'
	      y = (typeof y === 'undefined' || !y) ? 0 : y;
	      z = (typeof z === 'undefined' || !z) ? -0.5 : z;

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('play', function() {
	          self.pos3d(x, y, z, id);
	        });

	        return self;
	      }

	      if (x >= 0 || x < 0) {
	        if (self._webAudio) {
	          var activeNode = (id) ? self._nodeById(id) : self._activeNode();
	          if (activeNode) {
	            self._pos3d = [x, y, z];
	            activeNode.panner.setPosition(x, y, z);
	            activeNode.panner.panningModel = self._model || 'HRTF';
	          }
	        }
	      } else {
	        return self._pos3d;
	      }

	      return self;
	    },

	    /**
	     * Fade a currently playing sound between two volumes.
	     * @param  {Number}   from     The volume to fade from (0.0 to 1.0).
	     * @param  {Number}   to       The volume to fade to (0.0 to 1.0).
	     * @param  {Number}   len      Time in milliseconds to fade.
	     * @param  {Function} callback (optional) Fired when the fade is complete.
	     * @param  {String}   id       (optional) The play instance ID.
	     * @return {Howl}
	     */
	    fade: function(from, to, len, callback, id) {
	      var self = this,
	        diff = Math.abs(from - to),
	        dir = from > to ? 'down' : 'up',
	        steps = diff / 0.01,
	        stepTime = len / steps;

	      // if the sound hasn't been loaded, add it to the event queue
	      if (!self._loaded) {
	        self.on('load', function() {
	          self.fade(from, to, len, callback, id);
	        });

	        return self;
	      }

	      // set the volume to the start position
	      self.volume(from, id);

	      for (var i=1; i<=steps; i++) {
	        (function() {
	          var change = self._volume + (dir === 'up' ? 0.01 : -0.01) * i,
	            vol = Math.round(1000 * change) / 1000,
	            toVol = to;

	          setTimeout(function() {
	            self.volume(vol, id);

	            if (vol === toVol) {
	              if (callback) callback();
	            }
	          }, stepTime * i);
	        })();
	      }
	    },

	    /**
	     * [DEPRECATED] Fade in the current sound.
	     * @param  {Float}    to      Volume to fade to (0.0 to 1.0).
	     * @param  {Number}   len     Time in milliseconds to fade.
	     * @param  {Function} callback
	     * @return {Howl}
	     */
	    fadeIn: function(to, len, callback) {
	      return this.volume(0).play().fade(0, to, len, callback);
	    },

	    /**
	     * [DEPRECATED] Fade out the current sound and pause when finished.
	     * @param  {Float}    to       Volume to fade to (0.0 to 1.0).
	     * @param  {Number}   len      Time in milliseconds to fade.
	     * @param  {Function} callback
	     * @param  {String}   id       (optional) The play instance ID.
	     * @return {Howl}
	     */
	    fadeOut: function(to, len, callback, id) {
	      var self = this;

	      return self.fade(self._volume, to, len, function() {
	        if (callback) callback();
	        self.pause(id);

	        // fire ended event
	        self.on('end');
	      }, id);
	    },

	    /**
	     * Get an audio node by ID.
	     * @return {Howl} Audio node.
	     */
	    _nodeById: function(id) {
	      var self = this,
	        node = self._audioNode[0];

	      // find the node with this ID
	      for (var i=0; i<self._audioNode.length; i++) {
	        if (self._audioNode[i].id === id) {
	          node = self._audioNode[i];
	          break;
	        }
	      }

	      return node;
	    },

	    /**
	     * Get the first active audio node.
	     * @return {Howl} Audio node.
	     */
	    _activeNode: function() {
	      var self = this,
	        node = null;

	      // find the first playing node
	      for (var i=0; i<self._audioNode.length; i++) {
	        if (!self._audioNode[i].paused) {
	          node = self._audioNode[i];
	          break;
	        }
	      }

	      // remove excess inactive nodes
	      self._drainPool();

	      return node;
	    },

	    /**
	     * Get the first inactive audio node.
	     * If there is none, create a new one and add it to the pool.
	     * @param  {Function} callback Function to call when the audio node is ready.
	     */
	    _inactiveNode: function(callback) {
	      var self = this,
	        node = null;

	      // find first inactive node to recycle
	      for (var i=0; i<self._audioNode.length; i++) {
	        if (self._audioNode[i].paused && self._audioNode[i].readyState === 4) {
	          // send the node back for use by the new play instance
	          callback(self._audioNode[i]);
	          node = true;
	          break;
	        }
	      }

	      // remove excess inactive nodes
	      self._drainPool();

	      if (node) {
	        return;
	      }

	      // create new node if there are no inactives
	      var newNode;
	      if (self._webAudio) {
	        newNode = self._setupAudioNode();
	        callback(newNode);
	      } else {
	        self.load();
	        newNode = self._audioNode[self._audioNode.length - 1];

	        // listen for the correct load event and fire the callback
	        var listenerEvent = navigator.isCocoonJS ? 'canplaythrough' : 'loadedmetadata';
	        var listener = function() {
	          newNode.removeEventListener(listenerEvent, listener, false);
	          callback(newNode);
	        };
	        newNode.addEventListener(listenerEvent, listener, false);
	      }
	    },

	    /**
	     * If there are more than 5 inactive audio nodes in the pool, clear out the rest.
	     */
	    _drainPool: function() {
	      var self = this,
	        inactive = 0,
	        i;

	      // count the number of inactive nodes
	      for (i=0; i<self._audioNode.length; i++) {
	        if (self._audioNode[i].paused) {
	          inactive++;
	        }
	      }

	      // remove excess inactive nodes
	      for (i=self._audioNode.length-1; i>=0; i--) {
	        if (inactive <= 5) {
	          break;
	        }

	        if (self._audioNode[i].paused) {
	          // disconnect the audio source if using Web Audio
	          if (self._webAudio) {
	            self._audioNode[i].disconnect(0);
	          }

	          inactive--;
	          self._audioNode.splice(i, 1);
	        }
	      }
	    },

	    /**
	     * Clear 'onend' timeout before it ends.
	     * @param  {String} soundId  The play instance ID.
	     */
	    _clearEndTimer: function(soundId) {
	      var self = this,
	        index = 0;

	      // loop through the timers to find the one associated with this sound
	      for (var i=0; i<self._onendTimer.length; i++) {
	        if (self._onendTimer[i].id === soundId) {
	          index = i;
	          break;
	        }
	      }

	      var timer = self._onendTimer[index];
	      if (timer) {
	        clearTimeout(timer.timer);
	        self._onendTimer.splice(index, 1);
	      }
	    },

	    /**
	     * Setup the gain node and panner for a Web Audio instance.
	     * @return {Object} The new audio node.
	     */
	    _setupAudioNode: function() {
	      var self = this,
	        node = self._audioNode,
	        index = self._audioNode.length;

	      // create gain node
	      node[index] = (typeof ctx.createGain === 'undefined') ? ctx.createGainNode() : ctx.createGain();
	      node[index].gain.value = self._volume;
	      node[index].paused = true;
	      node[index]._pos = 0;
	      node[index].readyState = 4;
	      node[index].connect(masterGain);

	      // create the panner
	      node[index].panner = ctx.createPanner();
	      node[index].panner.panningModel = self._model || 'equalpower';
	      node[index].panner.setPosition(self._pos3d[0], self._pos3d[1], self._pos3d[2]);
	      node[index].panner.connect(node[index]);

	      return node[index];
	    },

	    /**
	     * Call/set custom events.
	     * @param  {String}   event Event type.
	     * @param  {Function} fn    Function to call.
	     * @return {Howl}
	     */
	    on: function(event, fn) {
	      var self = this,
	        events = self['_on' + event];

	      if (typeof fn === 'function') {
	        events.push(fn);
	      } else {
	        for (var i=0; i<events.length; i++) {
	          if (fn) {
	            events[i].call(self, fn);
	          } else {
	            events[i].call(self);
	          }
	        }
	      }

	      return self;
	    },

	    /**
	     * Remove a custom event.
	     * @param  {String}   event Event type.
	     * @param  {Function} fn    Listener to remove.
	     * @return {Howl}
	     */
	    off: function(event, fn) {
	      var self = this,
	        events = self['_on' + event],
	        fnString = fn ? fn.toString() : null;

	      if (fnString) {
	        // loop through functions in the event for comparison
	        for (var i=0; i<events.length; i++) {
	          if (fnString === events[i].toString()) {
	            events.splice(i, 1);
	            break;
	          }
	        }
	      } else {
	        self['_on' + event] = [];
	      }

	      return self;
	    },

	    /**
	     * Unload and destroy the current Howl object.
	     * This will immediately stop all play instances attached to this sound.
	     */
	    unload: function() {
	      var self = this;

	      // stop playing any active nodes
	      var nodes = self._audioNode;
	      for (var i=0; i<self._audioNode.length; i++) {
	        // stop the sound if it is currently playing
	        if (!nodes[i].paused) {
	          self.stop(nodes[i].id);
	          self.on('end', nodes[i].id);
	        }

	        if (!self._webAudio) {
	          // remove the source if using HTML5 Audio
	          nodes[i].src = '';
	        } else {
	          // disconnect the output from the master gain
	          nodes[i].disconnect(0);
	        }
	      }

	      // make sure all timeouts are cleared
	      for (i=0; i<self._onendTimer.length; i++) {
	        clearTimeout(self._onendTimer[i].timer);
	      }

	      // remove the reference in the global Howler object
	      var index = Howler._howls.indexOf(self);
	      if (index !== null && index >= 0) {
	        Howler._howls.splice(index, 1);
	      }

	      // delete this sound from the cache
	      delete cache[self._src];
	      self = null;
	    }

	  };

	  // only define these functions when using WebAudio
	  if (usingWebAudio) {

	    /**
	     * Buffer a sound from URL (or from cache) and decode to audio source (Web Audio API).
	     * @param  {Object} obj The Howl object for the sound to load.
	     * @param  {String} url The path to the sound file.
	     */
	    var loadBuffer = function(obj, url) {
	      // check if the buffer has already been cached
	      if (url in cache) {
	        // set the duration from the cache
	        obj._duration = cache[url].duration;

	        // load the sound into this object
	        loadSound(obj);
	        return;
	      }
	      
	      if (/^data:[^;]+;base64,/.test(url)) {
	        // Decode base64 data-URIs because some browsers cannot load data-URIs with XMLHttpRequest.
	        var data = atob(url.split(',')[1]);
	        var dataView = new Uint8Array(data.length);
	        for (var i=0; i<data.length; ++i) {
	          dataView[i] = data.charCodeAt(i);
	        }
	        
	        decodeAudioData(dataView.buffer, obj, url);
	      } else {
	        // load the buffer from the URL
	        var xhr = new XMLHttpRequest();
	        xhr.open('GET', url, true);
	        xhr.responseType = 'arraybuffer';
	        xhr.onload = function() {
	          decodeAudioData(xhr.response, obj, url);
	        };
	        xhr.onerror = function() {
	          // if there is an error, switch the sound to HTML Audio
	          if (obj._webAudio) {
	            obj._buffer = true;
	            obj._webAudio = false;
	            obj._audioNode = [];
	            delete obj._gainNode;
	            delete cache[url];
	            obj.load();
	          }
	        };
	        try {
	          xhr.send();
	        } catch (e) {
	          xhr.onerror();
	        }
	      }
	    };

	    /**
	     * Decode audio data from an array buffer.
	     * @param  {ArrayBuffer} arraybuffer The audio data.
	     * @param  {Object} obj The Howl object for the sound to load.
	     * @param  {String} url The path to the sound file.
	     */
	    var decodeAudioData = function(arraybuffer, obj, url) {
	      // decode the buffer into an audio source
	      ctx.decodeAudioData(
	        arraybuffer,
	        function(buffer) {
	          if (buffer) {
	            cache[url] = buffer;
	            loadSound(obj, buffer);
	          }
	        },
	        function(err) {
	          obj.on('loaderror');
	        }
	      );
	    };

	    /**
	     * Finishes loading the Web Audio API sound and fires the loaded event
	     * @param  {Object}  obj    The Howl object for the sound to load.
	     * @param  {Objecct} buffer The decoded buffer sound source.
	     */
	    var loadSound = function(obj, buffer) {
	      // set the duration
	      obj._duration = (buffer) ? buffer.duration : obj._duration;

	      // setup a sprite if none is defined
	      if (Object.getOwnPropertyNames(obj._sprite).length === 0) {
	        obj._sprite = {_default: [0, obj._duration * 1000]};
	      }

	      // fire the loaded event
	      if (!obj._loaded) {
	        obj._loaded = true;
	        obj.on('load');
	      }

	      if (obj._autoplay) {
	        obj.play();
	      }
	    };

	    /**
	     * Load the sound back into the buffer source.
	     * @param  {Object} obj   The sound to load.
	     * @param  {Array}  loop  Loop boolean, pos, and duration.
	     * @param  {String} id    (optional) The play instance ID.
	     */
	    var refreshBuffer = function(obj, loop, id) {
	      // determine which node to connect to
	      var node = obj._nodeById(id);

	      // setup the buffer source for playback
	      node.bufferSource = ctx.createBufferSource();
	      node.bufferSource.buffer = cache[obj._src];
	      node.bufferSource.connect(node.panner);
	      node.bufferSource.loop = loop[0];
	      if (loop[0]) {
	        node.bufferSource.loopStart = loop[1];
	        node.bufferSource.loopEnd = loop[1] + loop[2];
	      }
	      node.bufferSource.playbackRate.value = obj._rate;
	    };

	  }

	  /**
	   * Add support for AMD (Asynchronous Module Definition) libraries such as require.js.
	   */
	  if (true) {
	    !(__WEBPACK_AMD_DEFINE_RESULT__ = function() {
	      return {
	        Howler: Howler,
	        Howl: Howl
	      };
	    }.call(exports, __webpack_require__, exports, module), __WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
	  }

	  /**
	   * Add support for CommonJS libraries such as browserify.
	   */
	  if (true) {
	    exports.Howler = Howler;
	    exports.Howl = Howl;
	  }

	  // define globally in case AMD is not available or available but not used

	  if (typeof window !== 'undefined') {
	    window.Howler = Howler;
	    window.Howl = Howl;
	  }

	})();


/***/ },

/***/ 321:
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "bells-1-half-e45b50c2940f8d172fd23f0bbb052aaf.mp3"

/***/ },

/***/ 322:
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__.p + "bells-1-half-e11514483e57cf209b142f9d19811557.wav"

/***/ }

});