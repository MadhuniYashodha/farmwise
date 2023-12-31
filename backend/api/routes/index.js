var express = require('express');
var router = express.Router();

router.get('/', function(req, res){    
    res.json({ message: "Welcome to API!" });
});

require('./AuthRoutes')(router);
require('./BuyerRoutes')(router);
require('./FarmerRoutes')(router);
require('./InvestorRoutes')(router);
require('./AdminRoutes')(router);
module.exports.router = router;