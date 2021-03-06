
'use strict';

const NODE_ENV = process.env.NODE_ENV || 'develop';
const config = require('config');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
    context: __dirname + '/client',
    entry: {
        index: './app/index.js',
        vendor: []
    },
    output: {
        path: __dirname + '/build',
        filename: '[name].js'
    },
    resolve: {
        modulesDirectories: ['bower_components', 'node_modules'],
        extenstions: ['']
    },
    resolveLoader: {
        modulesDirectories: ['node_modules'],
        moduleTemplates: ['*-loader'],
        extenstions: ['', '.js']
    },

    plugins: [
        new webpack.NoErrorsPlugin(),
        new HtmlWebpackPlugin({
            template: './templates/index.html',
            showErrors: true,
            chunks: ['vendor', 'index']
        })
    ],
    module: {
        loaders: [
            {
                test: /\.scss$/,
                loaders: ['style', 'css', 'sass']
            },
            {
                test: /\.css$/,
                loaders: ['style', 'css']
            },
            {
                test: /\.html$/,
                loader: 'html'
            },
            {
                test: /.*\.(jsx|js)?$/,
                loader: 'babel',
                exclude: /node_modules/,
                query: {
                    presets: ['es2015', 'stage-0', 'react']
                }
            },
            {
                test: /.*\.(gif|png|jpe?g|svg)$/i,
                loaders: [
                    'file?hash=sha512&digest=hex&name=[hash].[ext]',
                    'image-webpack?{optimizationLevel: 7, interlaced: false, pngquant:{quality: 0-100, speed: 4}, mozjpeg: {quality: 65}}'
                ]
            },
            {
                test: /\.(eot|svg|ttf|woff|woff2)$/,
                loader: 'file'
            }
        ]
    }
}

