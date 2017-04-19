#!/bin/bash

# Ключевой файл для сервера
echo \
"
'use strict';

const config = require('config');
const path = require('path');
const fs = require('fs');
const thunkify = require('thunkify');
const read = thunkify(fs.readFile);

const app = require('koa')();
const kstatis = require('koa-static');

// Коннект к базе
const mongoose = require('mongoose');
mongoose.connect(`mongodb://IP/DBNAME`);

app.keys = [config.crypto.keys]

// Распаковка мидлваров
const middlewares = fs.readdirSync(path.join(__dirname, 'middlewares')).sort();
middlewares.forEach(function(middleware) {
    app.use(require('./middlewares/' + middleware));
});

// Распаковка роутинга
const routers = fs.readdirSync(path.join(__dirname, 'routers')).sort();
routers.forEach(function(routers) {
    app.use(require('./routers/' + routers));
});

// Указание статики
app.use(kstatis(config.buildFolder()));
app.use(function *(next) {
    let html = yield read(path.join(config.buildFolder(), config.html.index));
    this.type = 'text/html';
    this.body = html;
});

// Запуск сервера
app.listen(config.port);
" > server/index.js
