
'use strict';

const config = require('config');
const webpack = require('webpack');
const gutil = require('gulp-util');

module.exports = {
    name: 'client:webpack:prod',
    description: 'Собирает клиентскую часть в для продакшн\n\n',
    callback: function(done) {
        let options = {

        };

        webpack(Object.assign(require('../webpack.config'), options), (err, stats) => {
            if (err) throw new gutil.PluginError("webpack", err);
            gutil.log("[webpack:build-prod]", stats.toString({
                chunks: false,
                colors: true
            }));
            done();
        });
    }
}

