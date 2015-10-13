var React  = require('react');

module.exports = React.createClass({

  getInitialState () { return {}; },

  componentDidMount () {
    setTimeout(function () {
      this.setState({ isCouldBeRendered: true });
    }.bind(this), this.props.delay || 1000000 )
  },

  render () {
    return <div></div>;
  }
});
