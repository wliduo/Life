var gulp = require('gulp');
var minifycss = require('gulp-minify-css');
var uglify = require('gulp-uglify');
var htmlmin = require('gulp-htmlmin');
var htmlclean = require('gulp-htmlclean');
var imagemin = require('gulp-imagemin');

// 压缩html
gulp.task('minify-html', function() {
    return gulp.src('./docs/**/*.html')
        .pipe(htmlclean())
        .pipe(htmlmin({
            removeComments: true,
            minifyJS: true,
            minifyCSS: true,
            minifyURLs: true,
        }))
        .pipe(gulp.dest('./docs'))
});
// 压缩css
gulp.task('minify-css', function() {
    return gulp.src('./docs/**/*.css')
        .pipe(minifycss({
            compatibility: 'ie8'
        }))
        .pipe(gulp.dest('./docs'));
});
// 压缩js
gulp.task('minify-js', function() {
    return gulp.src(['./docs/**/*.js', '!./docs/js/index.js'])
        .pipe(uglify())
        .pipe(gulp.dest('./docs'));
});
// 压缩图片
gulp.task('minify-images', function() {
    return gulp.src('./docs/images/**/*.*')
        .pipe(imagemin(
        [imagemin.gifsicle({'optimizationLevel': 3}), 
        imagemin.jpegtran({'progressive': true}), 
        imagemin.optipng({'optimizationLevel': 7}), 
        imagemin.svgo()],
        {'verbose': true}))
        .pipe(gulp.dest('./docs/images'))
});
// 默认任务
gulp.task('default', [
    'minify-html','minify-css','minify-js','minify-images'
]);