mojs         = require 'mo-js'
{ Howl }     = require 'howler'
mojs.isDebug = false

Ball_1 = require './ball-1'
Ball_2 = require './ball-2'
Ball_3 = require './ball-3'
Ball_4 = require './ball-4'
Ball_5 = require './ball-5'
Ball_6 = require './ball-6'
Ball_7 = require './ball-7'

class Main
  CYAN:           '#11CDC5'
  PINK:           '#FC2D79'
  YELLOW:         '#F9DD5E'
  ORANGE:         '#FCB635'
  WHITE:          '#FDFDFD'
  S:              .7
  # DELAY_START:    1500
  DELAY_START:    0
  STROKE_WIDTH:   2
  CIRCLE_RADIUS:  5
  IS_RUNLESS:     true
  constructor:-> @
    
  init:->
    @vars(); @listenSlider()
    @createBits(); @createSounds()
    @

  vars:->
    @slider   = document.querySelector '#js-slider'
    @ctx      = document.querySelector '#js-svg-canvas'
    @repeat   = document.querySelector '#js-repeat'
    @controls = document.querySelector '#js-controls'
    @pin      = document.querySelector '#js-pin'
    @sound    = document.querySelector '#js-sound'
    @ctxWidth   = 480; @ctxHeight = 400
    @centerX    = @ctxWidth/2; @centerY = @ctxHeight/2
    @o2Left     = 287; @topLine    = 65; @bottomLine = 240
    @bottomLineBurst = @bottomLine + 10
    @CHARS_TOP = @bottomLine - 70
    @CHAR_DUR  = 2500
    @DOWN_DUR  = 50
    @BALL_1_START   = @DELAY_START
    @BALL_1_ARCDUR  = 1600
    @BALL_2_START   = @BALL_1_START + @BALL_1_ARCDUR
    @BALL_2_ARCDUR  = 800
    @BALL_3_START   = @BALL_2_START + @BALL_2_ARCDUR + 100
    @BALL_3_ARCDUR  = 800
    @BALL_4_START   = @BALL_3_START + @BALL_3_ARCDUR + 100
    @BALL_4_ARCDUR  = 800
    @BALL_5_START   = @BALL_4_START + @BALL_4_ARCDUR + 100
    @BALL_5_ARCDUR  = 800
    @BALL_6_START   = @BALL_5_START + @BALL_5_ARCDUR + 100
    @BALL_6_ARCDUR  = 800
    @BALL_7_START   = @BALL_6_START + @BALL_6_ARCDUR + 100
    @BALL_7_ARCDUR  = 600

    @STAGGER_COLORS = [ @PINK, @CYAN, @WHITE ]
    @STAGGER_EASING = 'sin.out'
    @BG = '#3a0839'
    # @BG = 'deeppink'
    @TRAIL_DASH  = '4 4'
    @TRAIL_WIDTH = 1
    @TRAIL_FADE  = 400
    @TRAIL_COLOR   = 'white'
    @TRAIL_OPACITY = .5
    @isIOS = @isIOSSafari()
    @isOn = !@isIOS
    !@isIOS and @sound.classList.add 'is-on'
    @clickHandler = if @isIOS or @isTouch() then 'touchstart' else 'click'

    @tween = new mojs.Tween
      onUpdate:(p)=>
        @progress = p
        @slider.value = p*100000 if @tween.state is 'play'

      onStart:=>    !@isPinned and @controls.classList.remove 'is-shown'
      onComplete:=> @controls.classList.add 'is-shown'

    @clickArea = new mojs.Transit
      type:      'circle'
      fill:      @WHITE
      opacity:   .5: 0
      isRunLess: true
      radius:    0: 25
      parent:    @controls
      easing:   'cubic.out'

  isIOSSafari:->
    userAgent = window.navigator.userAgent
    userAgent.match(/iPad/i) || userAgent.match(/iPhone/i)

  isTouch:->
    isIETouch = navigator.maxTouchPoints > 0 or navigator.msMaxTouchPoints > 0
    'ontouchstart' in window or isIETouch

  listenSlider:->
    it = @
    @slider.addEventListener 'input', (e)->
      if it.tween.state is 'play' then it.tween.pause(); it.bells1.stop()
      it.tween.setProgress (@value/100000)

    controlsStep = 27
    @addEvent @repeat, =>
      @clickArea.run(x: 12, y: 10)
      @bells1.stop(); @tween.restart()
    @addEvent @pin, (e)=>
      @clickArea.run(x: 12+1*controlsStep, y: 10)
      @pin.classList.toggle 'is-pinned'
      @isPinned = !@isPinned
    @addEvent @sound, (e)=>
      @clickArea.run(x: 12+2*controlsStep, y: 10)
      if !@isOn then @bells1.play().pos(@progress*5.14858)
      else @bells1.stop()
      @sound.classList.toggle 'is-on'
      @isOn = !@isOn

  createBits:-> @createBall_1(); @createBalls()
  createBall_1:->
    ball_1 = new Ball_1(@); @tween.add(ball_1.tweens); @mainBall = ball_1.ball
  createBalls:->
    @tween.add new Ball_2 @
    @tween.add new Ball_3 @
    @tween.add new Ball_4 @
    @tween.add new Ball_5 @
    @tween.add new Ball_6 @
    @tween.add new Ball_7 @
  isOpera:->
    userAgent = navigator.userAgent
    /^Opera\//.test(userAgent) or /\x20OPR\//.test(userAgent)
  createSounds:->
    ext = if @isOpera() then 'wav' else 'mp3'
    audio = require "./sounds/bells-1-half.#{ext}"
    @bells1 = new Howl
      urls: [audio]
  run:-> setTimeout (=> @tween.start()), 500
  playSound:(audio)-> return if !@isOn; audio.play()
  addEvent:(el, handler)-> el.addEventListener @clickHandler, handler
  
module.exports = Main
# new Main
