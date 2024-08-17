package model;

public class CalenderBean {
    private int eventId;
    private String eventName;
    private double eventFee;
    private String eventDetail;
    private String eventLocation;
    private String eventDate;
    
    // Getters and setters for all fields
    // Add constructors if needed
    
    // Example of getters and setters
    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

	public double getEventFee() {
		return eventFee;
	}

	public void setEventFee(double eventFee) {
		this.eventFee = eventFee;
	}

	public String getEventDetail() {
		return eventDetail;
	}

	public void setEventDetail(String eventDetail) {
		this.eventDetail = eventDetail;
	}

	public String getEventLocation() {
		return eventLocation;
	}

	public void setEventLocation(String eventLocation) {
		this.eventLocation = eventLocation;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

    // Other getters and setters omitted for brevity
}
