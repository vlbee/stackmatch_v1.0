const {
    staticHandler,
    jwtHandler,
    listHandler,
    profileDataHandler,
    profileUpdateHandler,
    loginHandler,
    logoutHandler,
    registrationHandler
} = require('./handler');
const { parse } = require('cookie');
const { sign, verify } = require('jsonwebtoken');

const checkJwt = (cookies, url, res) => {
    let { jwt } = parse(cookies)
    verify(jwt, process.env.JWT_SECRET, (err, decoded)=>{
        if (err || !decoded) { //if not logged in
            staticHandler('public/auth.html', res);
        } else {
            staticHandler(url, res);
            
        }
    })
};


const router = (req, res) => {
    const endpoint = req.url;

    if (endpoint === '/') {
        //function to check JWT to see if user is already logged in
        //redirects either to login page or directly to index.html
        if (req.headers.cookie){
            checkJwt(req.headers.cookie, 'public/list.html', res);
        }
        else { //if not logged in
            staticHandler('public/auth.html', res);
        }    
    } else if (endpoint === '/session') {
        jwtHandler(req, res);
    }
    else if (endpoint === '/login') {
        //this comes in from auth.html to authenticate user login
        //this will redirect to index.html if authorised
        loginHandler(req, res);
    } 
    else if (endpoint === '/logout') {
        //this comes in from auth.html to authenticate user login
        //this will redirect to index.html if authorised
        logoutHandler(req, res);
    } else if (endpoint === '/register') {
        //this comes in from auth.html to sign up a user
        //this will redirect to profile.html (editable state)
        console.log("register route reached");
        registrationHandler(req, res);
    }else if (endpoint === '/index') {

        if (req.headers.cookie){
            checkJwt(req.headers.cookie, 'public/list.html', res);
        }
        else{
        staticHandler('public/auth.html', res);             
        }
    }
    else if (endpoint === '/list') {
        listHandler(req, res);
    }
    else if (endpoint === '/profile') {
        staticHandler('public/profile.html', res);
    }
    else if (endpoint === '/profile-data'){
        profileDataHandler(req, res); 
    }
    else if (endpoint === '/profile-update') {
        profileUpdateHandler(req, res);
    }
    else if (endpoint.indexOf('public') !== -1) {
        staticHandler(endpoint, res);
    }
    //TO DO: add paths: create or update profile
    else {
        res.writeHead(404, {
            'Content-Type': 'text/html'
        });
        res.end('<h1>404 page not found</h1>');
    }

}

module.exports = router;