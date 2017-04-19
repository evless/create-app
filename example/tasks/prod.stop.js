
'use strict';

const gutil = require('gulp-util');
const sequence = require('gulp-sequence');

module.exports = {
    name: 'prod:stop',
    description: 'Production cборка, останавливает сервер и БД\n\n',
    callback: function(done) {
        sequence('clean', 'db:stop', 'server:stop:prod', () => {
            done();
        });
    }
}

