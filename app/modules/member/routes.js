var router = require('express').Router();


// var authMiddleware = require('../auth/middlewares/auth');
// router.use(authMiddleware.hasAuthAdmin);
router.use('/bloodstock', require('./bloodstock/routes'));
// router.use('/event', require('./event/routes'));
router.use('/profile', require('./profile/routes'));
router.use('/post', require('./post/routes'));
router.use('/reservation', require('./reservation/routes'));
router.use('/respond', require('./respond/routes'));
router.use('/respondents', require('./respondents/routes'));
router.use('/changepass', require('./changepass/routes'));
exports.member = router;