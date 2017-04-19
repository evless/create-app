
'use strict';

const gutil = require('gulp-util');
const sequence = require('gulp-sequence');

module.exports = {
    name: 'prod:start',
    description: 'Production cборка, включает сборку статики, сервера, запуск БД\n',
    callback: function(done) {
        sequence('clean', 'client:webpack:prod', 'db:start', 'server:start:prod', () => {
            done();
        });
    }
}

