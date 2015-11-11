const express = require('express');
const path = require('path');
const port = process.env.PORT || 8080;
const app = express();

// serve static assets normally
app.use(express.static(__dirname + '/front-end/'));

var rewriteForPath = function (p, url, response) {
  var url = path.parse(path);
  console.log(url);
  response.sendFile(path.resolve(__dirname, 'front-end', 'index.html'))
}

// handle every other route with index.html, which will contain
// a script tag to your application's JavaScript file(s).
app.get('*', function (request, response){
  var url = path.parse(request.url);

  rewriteForPath('dist', request.url, response);

  var url = path.parse(path);
  console.log(url);
  response.sendFile(path.resolve(__dirname, 'front-end', 'index.html'))

  // if (!(url.ext === '.js') ) {
  //   response.sendFile(path.resolve(__dirname, 'front-end', 'index.html'))
  // } else {
  //   if (url.base === 'prism.min.js') {
  //     response.sendFile(path.resolve(__dirname, 'front-end/app/vendor/', path.parse(request.url).base ))
  //   }
  //   if (url.base === 'main.js') {
  //     response.sendFile(path.resolve(__dirname, 'front-end/dist/', path.parse(request.url).base ))
  //   }
  // }
})

app.listen(port)
console.log("server started on port " + port)