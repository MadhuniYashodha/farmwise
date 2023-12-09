import React from "react";
import { useToggleState } from "../../ToggleState";
import { useNavigate, useParams } from "react-router-dom";
import "../../../../resources/css/FarmerDetails.css";

export default function FarmerDetails() {
  const navigate = useNavigate();
  const { id } = useParams();
  const { isToggled } = useToggleState();
  // Fetch farmer details from the backend 
  const farmerDetails = {
    farmer_name: "John",
    farmer_nic:"200074602641",
    farmer_address: "123 Farmer Street, City",
    farm_name: "AgriFarm",
    farm_address: "123 Farmer Street, City",
    mobile_Number: "9876543210",
    email:"farmer@gmail.com",
    farmer_reg_id:"9999999",
    gs_division:"Moratuwa",
    gs_name:"mm",
    gs_mobile:"0779867656",
    province:"western",
    district:"Colombo",
    city:"Piliyandala",
  };

  return (
    <div id="main" className={isToggled ? "toggled" : ""}>
      <div className="container">
        <h2>Farmer Details</h2>
        <div className="details">
          <div className="detail-item">
            <span className="label">Farmer Name:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.farmer_name}</span>
            </div>
          </div>

          <div className="detail-item">
            <span className="label">Farmer NIC:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.farmer_nic}</span>
            </div>
          </div>

          <div className="detail-item">
            <span className="label">Farmer Address:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.farmer_address}</span>
            </div>
          </div>

          <div className="detail-item">
            <span className="label">Farm Name:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.farm_name}</span>
            </div>
          </div>

          <div className="detail-item">
            <span className="label">Farm Address:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.farm_address}</span>
            </div>
          </div>

          <div className="detail-item">
            <span className="label">Mobile Number:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.mobile_Number}</span>
            </div>
          </div>
          <div className="detail-item">
            <span className="label">Farmer Email:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.email}</span>
            </div>
          </div>

          <div className="detail-item">
            <span className="label">Farmer Registration ID:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.farmer_reg_id}</span>
            </div>
          </div>

          <div className="detail-item">
            <span className="label">GS Division:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.gs_division}</span>
            </div>
          </div>
          <div className="detail-item">
            <span className="label">GS Name:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.gs_name}</span>
            </div>
          </div>
          <div className="detail-item">
            <span className="label">GS Mobile:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.gs_mobile}</span>
            </div>
          </div>
          <div className="detail-item">
            <span className="label">Province:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.province}</span>
            </div>
          </div>
          <div className="detail-item">
            <span className="label">District:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.district}</span>
            </div>
          </div>
          <div className="detail-item">
            <span className="label">City:</span>
          </div>
          <div className="detail-item">
            <div className="box">
              <span className="value">{farmerDetails.city}</span>
            </div>
          </div>
        </div>
        <div className="button-row">
  <button className="accept-button">Accept</button>
  
  <button className="reject-button">Reject</button>
</div>
      </div>
    </div>
  );
}
