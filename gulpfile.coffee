gulp    = require "gulp"

server  = require "browser-sync"
coffee  = require "gulp-coffee"
jade    = require "gulp-jade"
stylus  = require "gulp-stylus"
uglify  = require "gulp-uglify"
concat  = require "gulp-concat"

gulp.task "serve", ->
  server
    notify: no
    server: baseDir: "Galaxy.theme"

gulp.task "views", ->
  gulp
    .src "assets/views/**/*.jade"
    .pipe jade()
    .pipe gulp.dest "Galaxy.theme"

gulp.task "scripts", ->
  gulp
    .src "assets/scripts/**/*.coffee"
    .pipe coffee()
    .pipe uglify()
    .pipe concat "scripts.min.js"
    .pipe gulp.dest "Galaxy.theme"

gulp.task "styles", ->
  gulp
    .src "assets/styles/index.styl"
    .pipe stylus()
    .pipe concat "styles.min.css"
    .pipe gulp.dest "Galaxy.theme"
    .pipe server.reload stream: yes

gulp.task "watch", ["serve", "build"], ->
  gulp.watch "assets/views/**/*.jade", ["views", server.reload]
  gulp.watch "assets/scripts/**/*.coffee", ["scripts", server.reload]
  gulp.watch "assets/styles/**/*.styl", ["styles"]

gulp.task "build", ["views", "scripts", "styles"]
