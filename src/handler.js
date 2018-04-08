const path = require('path');
const fs = require('fs');
const querystring = require('querystring');
const getListData = require('./queries/getListData');
const postProfileData = require('./queries/postProfileData');


const staticHandler = (req, res) => {
  console.log('Static handler reached');
  const extension = req.split('.')[1]; // url or query string?
  const extensionType = {
    html: 'text/html',
    css: 'text/css',
    js: 'application/javascript',
    ico: 'image/x-icon',
    svg: 'image/svg+xml'
  };

  fs.readFile(
    path.join(__dirname, '..', req), 'utf8', (error, file) => {
      if (error) {
        res.writeHead(500, { 'content-type': 'text/plain' });
        res.end('server error');
      } else {
        res.writeHead(200, { 'content-type': extensionType[extension] });
        res.end(file);
      }
    });
};

const listHandler = (req, res) => {
  console.log('List handler reached');
  getListData((error, result) => {
    if (error) {
      res.writeHead(500, 'Content-Type:text/html');
      res.end(
        '<h1>Sorry, there was a problem getting user list information<h1>'
      );
      console.log(error);
    } else {
      let usersListData = JSON.stringify(result);
      res.writeHead(200, { 'content-type': 'application/json' });
      res.end(usersListData);
    }
  });
};

const newProfileHandler = (req, res) => {
  console.log("New profile handler reached");
  let body = '';

  req.on('data', (chunk) => {
    body += chunk;
  })

  req.on('end', () => {
    let values = querystring.parse(body);
    let result = Object.values(values);
    result.pop();// Removes submit button 'submit' valuee from end.

    postProfileData(result, (error, userId) => {
      if (error) {
        console.log("Error:", error);
        res.writeHead(500, { 'Content-Type': 'text/html' });
        res.end('<h1>Sorry there was an error</h1>');
      }
      else {
        // res.writeHead(200, {'Content-Type': 'text/html'}); 
        // res.end('Profile added to the database');
        res.writeHead(303, { 'Location': '/user_profile?id=' + userId });
        res.end(console.log('Successful relocation to new profile'));
      }
    })
  })
}

const profileHandler = (req, res) => {
  console.log("Profile handler reached");

  getProfileData((error, result) => {
    if (error) {
      res.writeHead(500, 'Content-Type:text/html');
      res.end(
        '<h1>Sorry, there was a problem getting profile information<h1>'
      );
      console.log(error);
    } else {
      let profileData = JSON.stringify(result);
      res.writeHead(200, { 'content-type': 'application/json' });
      res.end(profileData);
    }
  });

}


module.exports = { staticHandler, listHandler, newProfileHandler, profileHandler };
