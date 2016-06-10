import React from 'react';

class HeftyContent extends React.Component {

  getInitialState () { return {}; }

  componentDidMount () {
    setTimeout(function () {
      this.setState({ isCouldBeRendered: true });
    }.bind(this), this.props.delay || 1000000 )
  }

  render () {
    return (<div></div>);
  }

};

module.exports = HeftyContent;
