var express = require('express');
var loginRouter = express.Router();
var logoutRouter = express.Router();
var signupRouter = express.Router();
var homeRouter = express.Router();

var flash = require('flash');
var authMiddleware = require('./middlewares/auth');

homeRouter.get('/admin',authMiddleware.hasAuthAdmin, (req, res) => {
    var db = require('../../lib/database')();
    db.query(`SELECT * FROM post`, (err, results, fields) => {
        if (err) throw err;
        return res.render(__dirname + '/views/index1',{post: results});
        
    });
    
});
homeRouter.get('/bloodbank',authMiddleware.hasAuthBloodBank, (req, res) => {
    var db = require('../../lib/database')();
    db.query(`SELECT * FROM post`, (err, results, fields) => {
        if (err) throw err;
        return res.render(__dirname + '/views/index2',{post: results});
        
    });
     
 });
 homeRouter.get('/member',authMiddleware.hasAuthMember, (req, res) => {
     console.log(req.session)
    var db = require('../../lib/database')();
    db.query(`SELECT * FROM post`, (err, results, fields) => {
        if (err) throw err;
        return res.render(__dirname + '/views/index3',{post: results});
        
    });
     
     
 });
loginRouter.get('/',authMiddleware.noAuthed, (req, res) => {
        title: 'Log In' 
        res.sendFile(__dirname + '/views/loginNew.html', req.query);
    });
loginRouter.post('/',(req, res) => {
        var db = require('../../lib/database')();
        
        db.query(`SELECT * FROM tblaccounts WHERE strACCOUNT_EMAIL="${req.body.email}"`, (err, results, fields) => {
            if (err) throw err;
            if (results.length === 0) return res.redirect('/login?incorrect');

            var user = results[0];

            if (user.strACCOUNT_PASSWORD !== req.body.password) {
                console.log('error');
                req.flash('error', 'Error password or user account.');
                console.log(req.flash('error', 'Error password or user account.'));
                return res.redirect('/login?incorrect');
            }
            delete user.password;

            req.session.user = user;
            if(req.session.user.intACCOUNTTYPE_ID==1){
                req.session.admin=user;
                req.flash('success', 'Welcome ADMIN!');
                return res.redirect('/home/admin')
            }
            else if(req.session.user.intACCOUNTTYPE_ID==2){
                req.session.bloodbank=user;
                return res.redirect('/home/bloodbank')
            }  
            else{
                req.session.member=user;
                return res.redirect('/home/member')
            } 
        });
    });
signupRouter.get('/', (req, res) => {
        res.sendFile(__dirname + '/views/signup1.html')
    });

logoutRouter.get('/', (req, res) => {
    req.session.destroy(err => {
        if (err) throw err;
        res.redirect('/login');
    });
});
signupRouter.post('/', (req,res) => {
    console.log('signup POST');
    var db = require('../../lib/database')();
    db.query(`INSERT INTO \`tblaccounts\` ( \`strACCOUNT_EMAIL\`, \`strACCOUNT_PASSWORD\`,\`intACCOUNTTYPE_ID\`)
    VALUES( "${req.body.email}", "${req.body.password}", 3);`, (err,results,fields) =>{
    var x= results;
    req.session.signup=x;
    console.log(req.session);
    if (err) throw err;
        db.query(`INSERT INTO \`tblperson\` (\`strPERSON_FN\`, \`strPERSON_MN\`, \`strPERSON_LN\`, \`dtmPERSON_BDAY\`, \`strPERSON_CONTACTNO\`, \`strPERSON_ADDRESS\`, \`intACCOUNT_ID\`, \`bool_ISBENEFICIARY\`)
        VALUES("${req.body.fname}", "${req.body.mname}", "${req.body.lname}", "${req.body.date}",  "${req.body.contactnum}",  "${req.body.address}", "${req.session.signup.insertId}", "1");`, (err,results,fields) =>{
        if (err) throw err;
            db.query(`INSERT INTO \`tblbeneficiary\` (\`intACCOUNT_ID\`)
            VALUES("${req.session.signup.insertId}");`, (err,results,fields) =>{
            if (err) console.log(err);
            return res.redirect('/login?signupSuccess');
            });
        });
    });
});

exports.home = homeRouter;
exports.login = loginRouter;
exports.logout = logoutRouter;
exports.signup = signupRouter;
