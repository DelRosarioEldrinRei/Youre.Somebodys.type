var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM tblperson WHERE intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('member/profile/views/profile', { tblperson: results});
    });
});
router.get('/:id', authMiddleware.hasAuthMember, (req, res) => {
    db.query(`SELECT * FROM tblperson WHERE intACCOUNT_ID=${req.session.member.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('member/profile/views/editprofile', { tblperson: results});
    });
});
router.put('/:id', authMiddleware.hasAuthMember, (req, res) => {
    console.log('here');
    const queryString = `UPDATE tblperson SET
    strPERSON_FN = "${req.body.fn}",
    strPERSON_MN = "${req.body.mn}",
    strPERSON_LN = "${req.body.ln}",
    strPERSON_ADDRESS = "${req.body.address}",
    dtmPERSON_BDAY = "${req.body.date}",
    strPERSON_CONTACTNO = ${req.body.contact}
    WHERE intPERSON_ID=${req.params.id}`;

    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/member/profile');
    });
}); 
module.exports = router;
