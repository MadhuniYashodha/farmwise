var mongoose = require('mongoose');
var bcrypt = require('bcrypt');
require("dotenv").config();
const jwt = require('jsonwebtoken');
const UserRole = require('../enums/UserRole');

const SALT = 10;

var Schema = mongoose.Schema;

var FarmerSchema = new Schema({
    farmer_name: {
        type: String,
        required: [true, 'Name field is required!'],
        maxlength: 100
    },
    farmer_nic: {
        type: String,
        required: [true, 'NIC field is required!'],
        maxlength: 20,
        unique: true
    },
    farmer_address: {
        type: String,
        required: [true, 'Address field is required!'],
        maxlength: 200
    },
    farm_name: {
        type: String,
        required: [true, 'Farm name field is required!'],
        maxlength: 100
    },
    farm_address: {
        type: String,
        required: [true, 'Farm address field is required!'],
        maxlength: 200
    },
    mobile_number: {
        type: String,
        required: [true, 'Mobile number field is required!'],
        maxlength: 200,
        unique: true
    },
    email: {
        type: String,
        required: [true, 'Email field is required!'],
        unique: true,
    },
    farmer_reg_id: {
        type: String,
        required: [true, 'Farmer Registration Id is required!'],
        unique: true,
    },
    gs_division: {
        type: String,
        required: [true, 'GS division field is required!'],
    },
    gs_name: {
        type: String,
        required: [true, 'GS Name field is required!'],
      
    },
    gs_mobile: {
        type: String,
        required: [true, 'Gs mobile number field is required!'],
        maxlength: 200,
    },
    province: {
        type: String,
        required: [true, 'Province field is required!'],
        maxlength: 200
    },
    district: {
        type: String,
        required: [true, 'District field is required!'],
        maxlength: 200
    },
    city: {
        type: String,
        required: [true, 'City field is required!'],
        maxlength: 200
    },
    subscription_id: {
        type: String,
        maxlength: 200,
        default: ''
    },
    subscription_start_date: {
        type: Date,
        maxlength: 200,
        default: ''
    },
    subscription_exp_date: {
        type: Date,
        default: ''
    },
    farmer_approval: {
        type: String,
        default: 'pending'
    },
    created_date: {
        type: Date,
        maxlength: 200,
        default: Date.now
    }
});

// Saving user data
FarmerSchema.pre('save', function (next) {
    var user = this;
    if (user.isModified('password')) {
        //checking if password field is available and modified
        bcrypt.genSalt(SALT, function (err, salt) {
            if (err) return next(err)
        
            bcrypt.hash(user.password, salt, function (err, hash) {
                if (err) return next(err)
                user.password = hash;
                next();
            });
        });
    } else {
        next();
    }
});
     
// For comparing the users entered password with database during login 
FarmerSchema.methods.comparePassword = function (candidatePassword, callBack) {
    bcrypt.compare(candidatePassword, this.password, function (err, isMatch) {
        if (err) return callBack(err);
        callBack(null, isMatch);
    });
};

// For generating token when loggedin
FarmerSchema.methods.generateToken = function (callBack) {
    var user = this;
    var token = jwt.sign(user._id.toHexString(), process.env.SECRETE);
    
    callBack(null, token);
};

// Validating token for auth routes middleware
FarmerSchema.statics.findByToken = function (token, callBack) {
    jwt.verify(token, process.env.SECRETE, function (err, decode) {
        User.findById(decode).then((user) => {
            callBack(null, user);
        }).catch((err) => {
            callBack(err, null);
        });
    });
};

const Farmer = mongoose.model('farmer_details', FarmerSchema);
module.exports = { Farmer }