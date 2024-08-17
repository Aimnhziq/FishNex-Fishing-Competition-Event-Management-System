package model;

public class EventdetailBean {
	private int EventdetailID;
	private int CustID;
	private int EventID;
	private String CustName;
	private String EventName;
	 private int CustReceipt;
	 
	 public int getEventdetailID() {
		  return EventdetailID;
		 }
		 public void setEventdetailID(int eventdetailID) {
		  EventdetailID = eventdetailID;
		 }
	 
	 public int getCustID() {
	  return CustID;
	 }
	 public void setCustID(int custID) {
	  CustID = custID;
	 }
	 public int getEventID() {
		  return EventID;
		 }
	 public void setEventID(int eventID) {
		  EventID = eventID;
		 }
		 
	 public String getCustName() {
		  return CustName;
		   }
	 public void setCustName(String custName) {
		  CustName = custName;
	      }
	 
	 public String getEventName() {
		  return EventName;
		   }
	 public void setEventName(String eventName) {
		  EventName = eventName;
	      }
	 public int getCustReceipt() {
	  return CustReceipt;
	 }
	 public void setCustReceipt(int custReceipt) {
	  CustReceipt = custReceipt;
	 }
}
