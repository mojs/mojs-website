var path    = require('path');
var webpack = require('webpack');

module.exports = {
  watch: true,
  context: __dirname + "/app",
  entry: [
    __dirname + '/app/main.cjsx'
  ],
  module: {
    loaders: [
      { test: /\.(jsx|es6.js|babel.js|babel.jsx|.js)$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        query: {
          presets: [ 'es2015-loose', 'react', 'babel-preset-stage-2' ],
          plugins: [ 'transform-runtime' ]
        }
      },
      { test: /\.coffee$/, exclude: /node_modules/, loaders: ['coffee-loader?bare=true'] },
      { test: /\.cjsx$/, loaders: ['coffee', 'cjsx']},
      { test: /\.jade$/, loaders: ['jade'] },
      { test: /\.styl$/, loader: 'style-loader!css-loader!autoprefixer-loader?browsers=last 4 version!stylus-loader?paths=node_modules/' },
      { test: /\.html$/, loader: 'raw-loader' },
      {
        test: /\.(eot|woff|ttf|svg|png|jpg|wav|mp3)$/,
        loader: 'url-loader?limit=30000&name=[name]-[hash].[ext]',
        // paths: ['/app/css/i/']
      }
    ]
  },
  output: {
    path:     __dirname + '/dist',
    filename: 'main.js',
    publicPath: 'dist/'
  },
  // plugins: [new webpack.optimize.UglifyJsPlugin()],
  // plugins: [],
  resolve: {
    root: [path.resolve('./app/'), path.resolve('./app/css/'), path.resolve('./app/partials/')],
    moduleDirectories: ['node_modules'],
    target: 'node',
    extensions: [
      '', '.js', '.jsx', '.es6', '.es6.js',
      '.babel.jsx', '.babel.js',
      '.styl',   '.jade',
      '.coffee', '.cjsx',
      '.html',
    ]
  }
};
