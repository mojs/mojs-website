React  = require 'react'

module.exports = React.createClass
  render:->
    <div id="disqus_thread" className="post__comments"></div>

  componentDidMount:->
    return
    disqus_shortname = 'mo-js'
    dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
    dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
    (document.getElementsByTagName('head')[0] or document.getElementsByTagName('body')[0]).appendChild(dsq);
