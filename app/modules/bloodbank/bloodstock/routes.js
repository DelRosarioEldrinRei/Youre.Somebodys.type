var router = require('express').Router();
var db = require('../../../lib/database')();

var authMiddleware = require('../../auth/middlewares/auth');

router.get('/', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log(req.session.bloodbank.intACCOUNT_ID);
    db.query(`SELECT * FROM stocks WHERE intACCOUNT_ID=${req.session.bloodbank.intACCOUNT_ID}`, (err, results, fields) => {
        if (err) throw err;
        return res.render('bloodbank/bloodstock/views/stock1', { stocks: results});
    });
});
router.get('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    console.log('here');
    db.query(`SELECT * FROM stocks WHERE intBLOODSTOCK_ID=${req.params.id}`, (err, results, fields) => {
        if (err) throw err;
        res.render('bloodbank/bloodstock/views/bloodstock', { stocks: results[0] });
    });
});
router.post('/:id', authMiddleware.hasAuthBloodBank, (req, res) => {
    const queryString = `UPDATE tblbloodstock SET
    strBLOODSTOCK_AP = "${req.body.ap}",
    strBLOODSTOCK_AN = "${req.body.an}",
    strBLOODSTOCK_BP = "${req.body.bp}",
    strBLOODSTOCK_BN = "${req.body.bn}",
    strBLOODSTOCK_ABP = "${req.body.abp}",
    strBLOODSTOCK_ABN = "${req.body.abn}",
    strBLOODSTOCK_OP = "${req.body.op}",
    strBLOODSTOCK_ON = "${req.body.on}",
    dblBLOODSTOCK_PRICE = "${req.body.price}"
    WHERE intBLOODSTOCK_ID=${req.params.id}`;

    db.query(queryString, (err, results, fields) => {
        if (err) throw err;
        res.redirect('/bloodbank/bloodstock');
    });
    
});
module.exports = router;