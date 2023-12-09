const { Farmer } = require("../models/FarmerModel");
const { User } = require("../models/UserModel");
const { Investor } = require("../models/InvestorModel");
const { Buyer } = require("../models/BuyerModel");
const { CulProposal } = require("../models/CulProposalModel");
const { ProProposal } = require("../models/ProProposalModel");

exports.getDashboardCount = (req, res) => {
  Farmer.find({ farmer_approval: "pending" })
    .then((pendingdFarmerData) => {
      CulProposal.find({ proposal_status: "pending" })
        .then((pendingCultivationData) => {
          ProProposal.find({ proposal_status: "pending" })
            .then((pendingProductData) => {
              CulProposal.find({
                proposal_status: "approved",
                cultivation_status: "requested",
                proposal_response: "sent",
              })
                .then((requestedCultivationData) => {
                  ProProposal.find({
                    proposal_status: "approved",
                    product_status: "requested",
                    response: "sent",
                  })
                    .then((requestedProductData) => {
                      return res.status(200).json({
                        success: true,
                        message: `Success`,
                        countData: {
                          pendingdFarmerData: pendingdFarmerData.length,
                          pendingCultivationData: pendingCultivationData.length,
                          pendingProductData: pendingProductData.length,
                          requestedCultivationData: requestedCultivationData.length,
                          requestedProductData: requestedProductData.length
                        },
                      });
                    })
                    .catch((err) => {
                      return res.status(500).json({
                        success: true,
                        message: "Something went wrong",
                        data: err,
                      });
                    });
                })
                .catch((err) => {
                  return res.status(500).json({
                    success: true,
                    message: "Something went wrong",
                    data: err,
                  });
                });
            })
            .catch((err) => {
              return res.status(500).json({
                success: true,
                message: "Something went wrong",
                data: err,
              });
            });
        })
        .catch((err) => {
          return res.status(500).json({
            success: true,
            message: "Something went wrong",
            data: err,
          });
        });
    })
    .catch((err) => {
      return res.status(500).json({
        success: true,
        message: "Something went wrong",
        data: err,
      });
    });
};
// exports.getPendingFarmer = (req, res) => {
//   Farmer.find({ farmer_approval: "pending" })
//     .then((data) => {
//       if (!data) {
//         return res
//           .status(404)
//           .json({ success: false, message: "User email not found!" });
//       } else {
//         return res.status(200).json({
//           success: true,
//           message: `Farmers found`,
//           data: data,
//         });
//       }
//     })
//     .catch((err) => {
//       return res.status(500).json({
//         success: true,
//         message: "Something went wrong",
//         data: err,
//       });
//     });
// };
// exports.getPendingCultivation = (req, res) => {
//   CulProposal.find({ proposal_status: "pending" })
//     .then((data) => {
//       if (!data) {
//         return res
//           .status(404)
//           .json({ success: false, message: "Proposals not found!" });
//       } else {
//         return res.status(200).json({
//           success: true,
//           message: `Proposal found`,
//           data: data,
//         });
//       }
//     })
//     .catch((err) => {
//       return res.status(500).json({
//         success: true,
//         message: "Something went wrong",
//         data: err,
//       });
//     });
// };
// exports.getPendingProducts = (req, res) => {
//   ProProposal.find({ proposal_status: "pending" })
//     .then((data) => {
//       if (!data) {
//         return res
//           .status(404)
//           .json({ success: false, message: "Proposals not found!" });
//       } else {
//         return res.status(200).json({
//           success: true,
//           message: `Proposal found`,
//           data: data,
//         });
//       }
//     })
//     .catch((err) => {
//       return res.status(500).json({
//         success: true,
//         message: "Something went wrong",
//         data: err,
//       });
//     });
// };
// exports.getRequestedCultivation = (req, res) => {
//   CulProposal.find({
//     proposal_status: "approved",
//     cultivation_status: "requested",
//     proposal_response: "sent",
//   })
//     .then((data) => {
//       if (!data) {
//         return res
//           .status(404)
//           .json({ success: false, message: "Proposals not found!" });
//       } else {
//         return res.status(200).json({
//           success: true,
//           message: `Proposal found`,
//           data: data,
//         });
//       }
//     })
//     .catch((err) => {
//       return res.status(500).json({
//         success: true,
//         message: "Something went wrong",
//         data: err,
//       });
//     });
// };
// exports.getRequestedProducts = (req, res) => {
//   ProProposal.find({
//     proposal_status: "approved",
//     product_status: "requested",
//     response: "sent",
//   })
//     .then((data) => {
//       if (!data) {
//         return res
//           .status(404)
//           .json({ success: false, message: "Proposals not found!" });
//       } else {
//         return res.status(200).json({
//           success: true,
//           message: `Proposal found`,
//           data: data,
//         });
//       }
//     })
//     .catch((err) => {
//       return res.status(500).json({
//         success: true,
//         message: "Something went wrong",
//         data: err,
//       });
//     });
// };

// Farmer
// exports.getAllFarmer = (req, res) => {
//   Farmer.find()
//     .then((data) => {
//       if (!data) {
//         return res
//           .status(404)
//           .json({ success: false, message: "User email not found!" });
//       } else {
//         return res.status(200).json({
//           success: true,
//           message: `Farmers found`,
//           data: data,
//         });
//       }
//     })
//     .catch((err) => {
//       return res.status(500).json({
//         success: true,
//         message: "Something went wrong",
//         data: err,
//       });
//     });
// };
