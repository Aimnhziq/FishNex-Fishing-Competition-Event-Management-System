package model;

public class CatchBean {
	 private int CatchID;
	 private int CustID;
	 private String CustName;
	 private String CatchName;
	 private double CatchWeight;
	 private double CatchLength;
	 private int EventID;
	 private int EventdetailID;
	 
	 public int getCatchID() {
	  return CatchID;
	 }
	 public void setCatchID(int catchID) {
	  CatchID = catchID;
	 }
	 public int getCustID() {
	  return CustID;
	 }
	 public void setCustID(int custID) {
	  CustID = custID;
	 }
	 public String getCustName() {
	  return CustName;
	 }
	 public void setCustName(String custName) {
	  CustName = custName;
	 }
	 public String getCatchName() {
	  return CatchName;
	 }
	 public void setCatchName(String catchName) {
	  CatchName = catchName;
	 }
	 public double getCatchWeight() {
	  return CatchWeight;
	 }
	 public void setCatchWeight(double catchWeight) {
	  CatchWeight = catchWeight;
	 }
	 public double getCatchLength() {
	  return CatchLength;
	 }
	 public void setCatchLength(double catchLength) {
	  CatchLength = catchLength;
	 }
	 
	 public int getEventID() {
	        return EventID;
	 }

	 public void setEventID(int eventdetailID) {
	        EventID = eventdetailID;
	 }
	 public int getEventdetailID() {
	        return EventdetailID;
	 }

	 public void setEventdetailID(int eventdetailID) {
	        EventdetailID = eventdetailID;
	 }
	 
	 
}
