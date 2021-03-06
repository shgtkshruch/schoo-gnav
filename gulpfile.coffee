'use strict'

gulp = require 'gulp'
$ = require('gulp-load-plugins')()
browserSync = require 'browser-sync'
path = require 'path'
ghpages = require 'gh-pages'

config =
  src: 'src'
  dest: 'dist'

gulp.task 'browser-sync', ->
  browserSync
    watchOptions:
      debounceDelay: 0
    server:
      baseDir: config.dest
      routes:
        '/bower_components': 'bower_components'
    notify: false
    reloadDelay: 0
    browser: 'Google Chrome Canary'

gulp.task 'jade', ->
  gulp.src config.src + '/index.jade'
    .pipe $.plumber()
    .pipe $.changed config.dest,
      extension: '.jade'
    .pipe $.jade
      pretty: true
    .pipe gulp.dest config.dest
    .pipe browserSync.reload
      stream: true

gulp.task 'sass', ->
    $.rubySass config.src + '/styles/style.scss'
    .on 'error', (err) ->
      console.error 'Error!', err.message
    .pipe $.autoprefixer 'last 2 version', 'ie 9', 'ie 8'
    .pipe gulp.dest config.dest + '/styles'
    .pipe browserSync.reload
      stream: true

gulp.task 'coffee', ->
  gulp.src config.src + '/scripts/*.coffee'
    .pipe $.plumber()
    .pipe $.changed config.dest,
      extension: '.js'
    .pipe $.coffee()
    .pipe gulp.dest config.dest + '/scripts'
    .pipe browserSync.reload
      stream: true

gulp.task 'image', ->
  gulp.src config.src + '/images/*'
    .pipe $.imagemin
      progressive: true
      interlaced: true
    .pipe gulp.dest config.dest + '/images'

gulp.task 'publish', ->
  ghpages.publish path.join __dirname, config.dest

gulp.task 'default', ['build', 'browser-sync'], ->
  gulp.watch config.src + '/**/*.jade', ['jade']
  gulp.watch config.src + '/styles/*.scss', ['sass']
  gulp.watch config.src + '/scripts/*.coffee', ['coffee']
  gulp.watch config.src + '/images/*', ['image']

gulp.task 'build', ['jade', 'sass', 'coffee', 'image']
