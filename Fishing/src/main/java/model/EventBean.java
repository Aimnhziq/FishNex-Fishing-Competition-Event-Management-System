package model;

import java.sql.Date;
import java.sql.Time;

public class EventBean {
    private int EventID;
    private String EventName;
    private String EventFee;
    private String EventDetail;
    private String EventLocation;
    private java.sql.Date EventDate;
    private Time StartTime;
    private Time EndTime;
    private byte[] EventPicture; // Assuming you'll store the file path
    private String EventPictureBase64;

    // Getters and setters
    public int getEventID() {
        return EventID;
    }

    public void setEventID(int eventID) {
        EventID = eventID;
    }

    public String getEventName() {
        return EventName;
    }

    public void setEventName(String eventName) {
        EventName = eventName;
    }

    public String getEventFee() {
        return EventFee;
    }

    public void setEventFee(String eventFee) {
        EventFee = eventFee;
    }

    public String getEventDetail() {
        return EventDetail;
    }

    public void setEventDetail(String eventDetail) {
        EventDetail = eventDetail;
    }

    public String getEventLocation() {
        return EventLocation;
    }

    public void setEventLocation(String eventLocation) {
       EventLocation = eventLocation;
    }

    public java.sql.Date getEventDate() {
        return EventDate;
    }

    public void setEventDate(java.sql.Date eventDate) {
        EventDate = eventDate;
    }

    public Time getStartTime() {
        return StartTime;
    }

    public void setStartTime(Time startTime) {
        StartTime = startTime;
    }

    public Time getEndTime() {
        return EndTime;
    }

    public void setEndTime(Time endTime) {
        EndTime = endTime;
    }

    public byte[] getEventPicture() {
        return EventPicture;
    }

    public void setEventPicture(byte[] eventPicture) {
        EventPicture = eventPicture;
    }
    
   

    // Getter and setter for eventPictureBase64
    public String getEventPictureBase64() {
        return EventPictureBase64;
    }

    public void setEventPictureBase64(String eventPictureBase64) {
        EventPictureBase64 = eventPictureBase64;
    }
}