var React     = require('react');
var UniteLink = require('partials/unite-link');
var Resizable = require('react-component-resizable');
require('css/partials/more.styl');

module.exports = React.createClass({
  getInitialState: function () {
    return { isOpen: false, contentHeight: 0 };
  },

  _onTap: function () { this.setState({ isOpen: !this.state.isOpen }); },

  componentDidMount: function () {
    this.innerConentEl = this.refs['inner-content'].getDOMNode();
    this._getInnerHeight();
  },

  _getInnerHeight: function () {
    var height = this.innerConentEl.offsetHeight;
    if (height !== this.state.contentHeight) {
      this.setState({ contentHeight: height });
    }
  },

  render: function () {
    var className = 'more ';
    className += this.state.isOpen ? 'is-open' : '';
    var height = this.state.isOpen ? this.state.contentHeight : 0;
    var style  = { height: `${height}px` };

    return (
      <div className = { `${className} ${this.props.className || ''}` } >
        <UniteLink className="more__header" onTap = { this._onTap }>
          { this.props.label || 'more' }
          <div className="more__arrow"></div>
        </UniteLink>
        <div className="more__content" style = { style } >
          <Resizable className="more__content-inner cf" ref="inner-content" onResize = { this._getInnerHeight }>
            { this.props.children }
          </Resizable>
        </div>
      </div>
    );
  }
});
  