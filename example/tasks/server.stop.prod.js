
'use strict';

const config = require('config');
const exec = require('child_process').exec;

module.exports = {
    name: 'server:stop:prod',
    description: 'Останавливает сервер\n',
    callback: function(done) {
        exec('node_modules/forever/bin/forever stop server/index.js', (err, stdout, stderr) => {
            console.log(stdout)
            console.log(stderr)
            done(err)
        });
    }
}

