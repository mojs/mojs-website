var path = require('path');

module.exports = {
  watch: true,
  context: __dirname + "/app",
  entry: [
    __dirname + '/app/main.cjsx'
  ],
  module: {
    loaders: [
      { test: /\.(jsx|es6)$/, exclude: /node_modules/, loaders: ['6to5-loader?optional=coreAliasing'] },
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
  resolve: {
    root: [path.resolve('./app/'), path.resolve('./app/css/'), path.resolve('./app/partials/')],
    moduleDirectories: ['node_modules'],
    extensions: [
      '', '.js', '.jsx', '.es6',
      '.styl',   '.jade',
      '.coffee', '.cjsx',
      '.html',
    ]
  }
};
