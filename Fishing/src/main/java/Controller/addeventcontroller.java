package Controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.InputStream;
import jakarta.servlet.http.Part;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.ByteArrayOutputStream;



import dao.EventDAO;
import model.EventBean;


@MultipartConfig
public class addeventcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventDAO dao;

    public addeventcontroller() {
        super();
        dao = new EventDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EventBean event = new EventBean();
        event.setEventName(request.getParameter("EventName"));
        event.setEventFee(request.getParameter("EventFee"));
        event.setEventDetail(request.getParameter("EventDetail"));
        event.setEventLocation(request.getParameter("EventLocation"));
        
     // Parsing eventDate from String to Date
        try {
            String eventDateString = request.getParameter("EventDate");
            if (eventDateString != null && !eventDateString.isEmpty()) {
                Date eventDate = Date.valueOf(eventDateString);
                event.setEventDate(eventDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Parsing startTime and endTime from String to Time
        try {
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
            String startTimeString = request.getParameter("StartTime");
            String endTimeString = request.getParameter("EndTime");
            if (startTimeString != null && endTimeString != null && !startTimeString.isEmpty() && !endTimeString.isEmpty()) {
                Time startTime = new Time(timeFormat.parse(startTimeString).getTime());
                Time endTime = new Time(timeFormat.parse(endTimeString).getTime());
                event.setStartTime(startTime);
                event.setEndTime(endTime);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
     // Handle file upload
        Part filePart = request.getPart("EventPicture");
        byte[] imageData = null;
        if (filePart != null && filePart.getSize() > 0) {
            try (InputStream is = filePart.getInputStream()) {
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = is.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                imageData = outputStream.toByteArray();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        dao.addEvent(event, imageData);

        // Forward to a success page or redirect to a different page
        request.setAttribute("event", EventDAO.getAllEvent());
        response.sendRedirect("listeventcontroller");
    }
    
    
}
