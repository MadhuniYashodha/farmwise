module.exports = function(app) {
    const { Auth } = require("../middleware/auth");

    const AdminController = require("../controllers/AdminController");

    // Dashboard Routes
    app.post("/getDashboardCount", Auth, AdminController.getDashboardCount);
    // app.post("/getPendingFarmer", Auth, AdminController.getPendingFarmer);
    // app.post("/getPendingCultivation", Auth, AdminController.getPendingCultivation);
    // app.post("/getPendingProducts", Auth, AdminController.getPendingProducts);
    // app.post("/getRequestedCultivation", Auth, AdminController.getRequestedCultivation);
    // app.post("/getRequestedProducts", Auth, AdminController.getRequestedProducts);

    // Farmer Routes
    // app.post("/getAllFarmer", Auth, AdminController.getAllFarmer);
    

};