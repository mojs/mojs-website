import React        from 'react';
import HeftyContent from './hefty-content';
import PostImage    from './post-image';

require('../css/partials/gif.styl');

const Gif = React.createClass({
  getInitialState: function () { return { isHidden: true }; },

  _showImage () { this.setState({ isHidden: false }); },
  _hideImage () { this.setState({ isHidden: true }); },

  render: function () {
    const p = this.props;

    const minHeight = ( p.minHeight != null ) ? p.minHeight : 350;
    const minWidth  = ( p.minWidth != null )  ? p.minWidth  : 350;

    return (
      <HeftyContent
        label = { 'tap to see the gif' }
        onShow = {this._showImage}
        onHide = {this._hideImage}
        minHeight = {minHeight}
        minWidth  = {minWidth}
        className = { `gif ${p.className || ''}` } >
          { (this.state.isHidden) ? null : <PostImage src = { p.src } /> }
      </HeftyContent>
    );
  }
});

export default Gif;
