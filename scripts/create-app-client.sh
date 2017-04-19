#!/bin/bash

# Создаем файлы для клиента
# app.js
touch client/app/app.js

# index.html
echo \
'
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
        <title>Create App</title>
        <base href="/">
        <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&amp;subset=cyrillic,cyrillic-ext" rel="stylesheet">
    </head>
    <body>
        <div id="body"></div>
    </body>
</html>
' > client/templates/index.html
