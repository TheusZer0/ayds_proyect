//modulo express
const express = require('express');
const app = express();

const express_hdbrs = require('express-handlebars')

//modulo morgan
const morgan = require('morgan');
app.use(morgan('dev'));

// funciones antes de que lleguen a las rutas
app.use(express.json());
app.use(express.urlencoded({extended: false}));

// variables
const port = 8080;
const path = require('path');

// routes
app.use(require('./routes'));
app.use('/links',require('./routes/links'));
app.use(require('./routes/auth'));

//publics
app.use(express.static(path.join(__dirname,'public')));


//app usage
app.set('views',path.join(__dirname, 'views'));
app.engine('.hbs',express_hdbrs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'),'layouts'),
    partialsDir: path.join(app.get('views'),'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

app.listen(8080);
console.log('Server en escucha en el',port);