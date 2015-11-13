var React = require('react');

var Sticky = React.createClass({

  getDefaultProps: function() {
    return {
      type: React.DOM.div,
      className: '',
      stickyClass: 'sticky',
      stickyStyle: {
        position: 'fixed',
        top: 0,
        left: 0,
        right: 0
      },
      topOffset: 0,
      onStickyStateChange: function () {}
    };
  },

  getInitialState: function() {
    return {
      events: ['load', 'scroll', 'resize', 'touchmove', 'touchend'],
      style: {}
    };
  },

  _getScrollY: function () {
    return (window.pageYOffset != null) ? window.pageYOffset : document.scrollTop;
  },

  top: function() {
    return top;
  },

  shouldBeSticky: function() {
    var shouldBeSticky = this._getScrollY() >= this._offsetTop + this.props.topOffset;
    return shouldBeSticky;
  },

  handleTick: function() {
    if (this.hasUnhandledEvent || this.hasTouchEvent) {
      var isSticky = this.state.isSticky;
      var shouldBeSticky = this.shouldBeSticky();
      if (isSticky !== shouldBeSticky) {
        var nextState = { isSticky: shouldBeSticky };
        if (shouldBeSticky) {
          nextState.style = this.props.stickyStyle;
          nextState.className = this.props.className + ' ' + this.props.stickyClass;
        } else {
          nextState.style = {};
          nextState.className = this.props.className;
        }
        this.setState(nextState);
        this.props.onStickyStateChange(shouldBeSticky);
      }
      this.hasUnhandledEvent = false;
    }
    this.tick();
  },

  handleEvent: function(event) {
    switch (event.type) {
      case 'touchmove':
        this.hasTouchEvent = true;
        break;
      case 'touchend':
        this.hasTouchEvent = false;
        break;
      default:
        this.hasUnhandledEvent = true;
    }
  },

  componentDidMount: function() {
    this._offsetTop = this.getDOMNode().offsetTop;
    this.state.events.forEach(function(type) {
      window.addEventListener(type, this.handleEvent);
    }, this);
    this.tick();
  },

  componentWillUnmount: function() {
    this.state.events.forEach(function(type) {
      window.removeEventListener(type, this.handleEvent);
    }, this);
    this.cancel();
  },

  isModernBrowser: function() {
    return requestAnimationFrame && cancelAnimationFrame;
  },

  cancel: function() {
    var cancel = this.isModernBrowser() ? cancelAnimationFrame : clearTimeout;
    cancel(this.currentTick);
  },

  tick: function () {
    var next = this.isModernBrowser() ? requestAnimationFrame : setTimeout;
    this.currentTick = next(this.handleTick, 1000 / 60);
  },

  render: function() {
    return this.props.type({
      style: this.state.style,
      className: this.state.className
    }, this.props.children);
  }
});

module.exports = Sticky;