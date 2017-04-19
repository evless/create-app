#!/bin/bash

echo "\033[1;36m\n Running Create-App from folder => $(cd $(dirname $0) && pwd): \n\033[0m"
path="$(cd $(dirname $0) && pwd)"

echo "\033[1;32m Created:"
# Создаем каталоги
sh $path/scripts/create-app-folders.sh

# Коммон файлы
sh $path/scripts/create-app-common.sh

# Добавляем основные файлы
sh $path/scripts/create-app-config.sh
sh $path/scripts/create-app-client.sh
sh $path/scripts/create-app-server.sh

# Конфиги для сборки
sh $path/scripts/create-app-gulpfile.sh
sh $path/scripts/create-app-webpack.sh

# Таски для галпа
sh $path/scripts/create-app-tasks.sh

echo "
    -> client
        -> app
            -> app.js
        -> public
            -> images
            -> scss
            -> templates
                -> index.html
    -> server
        -> models
        -> routers
        -> middlewares
        -> index.js
    -> config
        -> default.js
    -> tasks
        -> clean.js
        -> client.webpack.dev.js
        -> client.webpack.prod.js
        -> dev.js
        -> help.js
        -> prod.start.js
        -> prod.stop.js
        -> server.start.dev.js
        -> server.start.prod.js
        -> server.start.restart.js
        -> server.stop.prod.js
    -> gulpfile.js
    -> webpack.config.js
    -> README.md
    -> .gitignore
\033[0m
"

# Установка npm пакетов
npm init
sh $path/scripts/install-npm-packages.sh

echo "\033[1;32m\n\n npm packages installed"
echo "\033[1;36m Success! \n\033[0m"
