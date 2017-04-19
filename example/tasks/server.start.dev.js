
'use strict';

const config = require('config');
const nodemon = require('gulp-nodemon');

module.exports = {
    name: 'server:start:dev',
    description: 'Запуск сервера в режиме разработки с вотчером\n',
    callback: function(done) {
        nodemon({
            nodeArgs: ['--debug'],
            watch: ['server/*'],
            script:   'server/index.js'
        });
    }
}

