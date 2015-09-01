React       = require 'react'
{PrismCode} = require 'react-prism'
Tapable     = require 'react-tappable'
require '../css/partials/api-demo.styl'

module.exports = React.createClass
  getInitialState:-> @state = shown: 'code'
  showResult:-> @setState(shown: 'result') if @state.shown is 'code'
  showCode:-> @setState shown: 'code'if @state.shown is 'result'
  runBurst:->
    if !@burst?
      @burst = new mojs.Burst
        parent:       document.querySelector('#js-burst-container')
        shape:        'circle'
        fill:         ['deeppink', 'cyan', 'orange']
        x: '50%',     y: '50%'
        isRunLess:    true
    @burst.run()

  render:->
    mainClass = if @state.shown is 'result' then 'is-result' else ''
    codeBtnClass = if @state.shown is 'code' then 'is-active' else ''
    resultBtnClass = if @state.shown is 'result' then 'is-active' else ''
    <div className="api-demo #{mainClass} [ grid grid--sliced grid--gutter-x2 ]">
      <div>
        <div className="grid-bit grid-bit--8-12">
          <div className="code-block api-demo__code">
            <div className="code-block__header">Declarative API demo:</div>
            <div className="code-block__body">
              <pre>
                <PrismCode className="language-javascript api-demo__code api-demo__code--normal">
                  { """var burst = new Burst({
                        shape:      'circle',
                        fill:         [ 'deeppink', 'cyan', 'orange' ],
                        x: '50%',   y: '50%'
                    });
                    """}
                </PrismCode>
                <PrismCode className="language-javascript api-demo__code api-demo__code--mobile">
                  { """var burst = new Burst({
                        shape:   'circle',
                        fill:      [ 'deeppink',
                                     'cyan',
                                     'orange' ],
                        x: '50%',   y: '50%'
                    });
                    """}
                </PrismCode>
              </pre>
            </div>
          </div>
        </div>
        <div className="grid-bit grid-bit--4-12">
          <div className="code-block api-demo__result">
            <div className="code-block__header">Result (Tap):</div>
            <Tapable className="code-block__body" id="js-burst-container" onTap=@runBurst>
              <pre>
                <PrismCode className="language-markup">
                  {"""\n\n\n\n\n\n"""}
                </PrismCode>
              </pre>
            </Tapable>
          </div>
        </div>
      </div>

      <div className="api-demo__buttons">
        <Tapable className="api-demo__button api-demo__button--code #{codeBtnClass}" onTap=@showCode>Code</Tapable>
        <Tapable className="api-demo__button api-demo__button--result #{resultBtnClass}" onTap=@showResult >Result</Tapable>
      </div>
      
      <div className="api-demo__more code-block__footer">
        See more <a href="#">tutorials</a> or <a href="#">docs</a>. Inspire at <a href="#">demos</a>.
      </div>

    </div>