const express = require('express');
const path = require('path');
const port = process.env.PORT || 8080;
const app = express();

// serve static assets normally
app.use(express.static(__dirname + '/front-end/'))

// handle every other route with index.html, which will contain
// a script tag to your application's JavaScript file(s).
app.get('*', function (request, response){
  var url = path.parse(request.url);
  if (!url.base.match(/\.js/)) {
    response.sendFile(path.resolve(__dirname, 'front-end', 'index.html'))
  } else {
    if (url.base === 'prism.min.js') {
      response.sendFile(path.resolve(__dirname, 'front-end/app/vendor/', path.parse(request.url).base ))
    } else {
      response.sendFile(path.resolve(__dirname, 'front-end/dist/', path.parse(request.url).base ))
    }
  }
})

app.listen(port)
console.log("server started on port " + port)