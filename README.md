## Shell скрипт для создания папки с основной конфигурацией

- Выкачиваем скрипт
- Переходим в нужную папку
- Делаем npm init
- Выполняем create-app.sh
- Получаем готовую структуру с установленными пакетами

## Пакеты входящие в проект
- gulp
- sass
- mongoose
- nodemon
- babel
- forever
- koa@1
- webpack@1
- Все подходящие для сборки пакеты

## Структура

```
client/
    app/
        app.js
    public/
        images/
        scss/
        templates/
            index.html
server/
    models/
    routers/
    middlewares/
    index.js
config/
    default.js
tasks/
    clean.js
    client.webpack.dev.js
    client.webpack.prod.js
    dev.js
    help.js
    prod.start.js
    prod.stop.js
    server.start.dev.js
    server.start.prod.js
    server.start.restart.js
    server.stop.prod.js
gulpfile.js
webpack.config.js
.gitignore
README.md
```
