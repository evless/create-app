
'use strict';

const gutil = require('gulp-util');
const sequence = require('gulp-sequence');

module.exports = {
    name: 'dev',
    description: 'Developers сборка, включает в себя сборку статики, сервера и навешивания на них вотчеров\n',
    callback: function(done) {
        sequence('clean', ['server:start:dev', 'client:webpack:dev'], () => {
            done();
        });
    }
}

