#!/bin/bash

# Таски для gulp
# clean
echo \
"
'use strict';

const config = require('config');
const del = require('del');

module.exports = {
    name: 'clean',
    description: 'Очистка папки с билдом\n\n',
    callback: function(done) {
        del(config.buildFolder()).then(() => done());
    }
}
" > tasks/clean.js

# client.webpack.dev
echo \
"
'use strict';

const config = require('config');
const webpack = require('webpack');
const gutil = require('gulp-util');

module.exports = {
    name: 'client:webpack:dev',
    description: 'Собирает клиентскую часть в режиме разработки и запускает вотчер\n',
    callback: function(done) {
        let options = {
            watch: true,
            watchoptions: {
                aggregateTimeout: 100
            }
        };

        webpack(Object.assign(require('../webpack.config'), options), (err, stats) => {
            if (err) throw new gutil.PluginError(\"webpack\", err);
            gutil.log(\"[webpack:build-dev]\", stats.toString({
                chunks: false,
                colors: true
            }));
        });
    }
}
" > tasks/client.webpack.dev.js

# client.webpack.prod
echo \
"
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
            if (err) throw new gutil.PluginError(\"webpack\", err);
            gutil.log(\"[webpack:build-prod]\", stats.toString({
                chunks: false,
                colors: true
            }));
            done();
        });
    }
}
" > client.webpack.prod.js

# dev
echo \
"
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
" > tasks/dev.js

# help
echo \
"
'use strict';

const gutil = require('gulp-util');
const path = require('path');
const fs = require('fs');

module.exports = {
    name: 'help',
    description: 'Выводит список команд\n',
    callback: function(done) {
        let logs = '\u001b[32m\n\n Gulp commands: \n\n\u001b[32m';

        const tasks = fs.readdirSync(path.join(__dirname, '..', 'tasks')).sort();
        tasks.forEach(function(task) {
            let req = require(path.join(__dirname, '..', 'tasks', task));
            logs += \`\u001b[36m \${req.name} \u001b[39m \`;
            logs += req.description;
        });

        gutil.log(logs);
    }
}
" > tasks/help.js

# prod.start
echo \
"
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
" > tasks/prod.start.js

# prod.stop
echo \
"
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
" > tasks/prod.stop.js

# server.start.dev
echo \
"
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
" > tasks/server.start.dev.js

# server.start.prod
echo \
"
'use strict';

const config = require('config');
const exec = require('child_process').exec;

module.exports = {
    name: 'server:start:prod',
    description: 'Запуск сервера в режиме продакшена\n',
    callback: function(done) {
        exec('NODE_ENV=production node_modules/forever/bin/forever start server/index.js --minUptime 1000 --spinSleepTime 1000', (err, stdout, stderr) => {
            console.log(stdout)
            console.log(stderr)
            done(err)
        })
    }
}
" > tasks/server.start.prod.js

# server.start.restart
echo \
"
'use strict';

const config = require('config');
const exec = require('child_process').exec;

module.exports = {
    name: 'server:start:restart',
    description: 'Рестарт сервера\n',
    callback: function(done) {
        exec('node_modules/forever/bin/forever restart server/index.js', (err, stdout, stderr) => {
            console.log(stdout)
            console.log(stderr)
            done(err)
        })
    }
}
" > tasks/server.start.restart.js

# server.stop.prod
echo \
"
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
" > tasks/server.stop.prod.js
