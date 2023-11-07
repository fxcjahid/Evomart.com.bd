let mix = require('laravel-mix');
let execSync = require('child_process').execSync;

mix.js(`${__dirname}/Resources/assets/admin/js/invoice.js`, `${__dirname}/Assets/admin/js/invoice.js`);
