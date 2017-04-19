#!/bin/bash

# Создаем каталоги
sh create-app-folders.sh

# Добавляем основные файлы
sh create-app-config.sh
sh create-app-client.sh
sh create-app-server.sh

# Конфиги для сборки
sh create-app-gulpfile.sh
