#!/bin/bash

# Создаем конфиг для сервера и остальной ереси
echo \
"const path = require('path');

module.exports = {
    port: 5555,
    root: process.cwd(),
    buildFolderName: 'build',
    html: {
        index: 'index.html',
    },
    buildFolder: function() {
        return path.join(this.root, this.buildFolderName);
    },
    dateFormat: 'DD.MM.YYYY',
    crypto: {
        keys: 'HELLO',
        hash: {
            length: 128,
            iterations: process.env.NODE_ENV == 'production' ? 12000 : 1
        }
    },
};" > config/default.js
