package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import dao.EventDAO;
import model.EventBean;

/*@WebServlet("/updateeventcontroller")*/
@MultipartConfig
public class updateeventcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EventDAO dao;

    public updateeventcontroller() {
        super();
        dao = new EventDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventID = Integer.parseInt(request.getParameter("EventID"));
        request.setAttribute("c", EventDAO.getEventByID(eventID));
        RequestDispatcher view = request.getRequestDispatcher("updateevent.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventBean event = new EventBean();
        event.setEventID(Integer.parseInt(request.getParameter("EventID")));
        event.setEventName(request.getParameter("EventName"));
        event.setEventFee(request.getParameter("EventFee"));
        event.setEventDetail(request.getParameter("EventDetail"));
        event.setEventLocation(request.getParameter("EventLocation"));

        Part filePart = request.getPart("EventPicture");
        if (filePart != null && filePart.getSize() > 0) {
            // Convert Part to byte[]
            byte[] imageData = inputStreamToByteArray(filePart.getInputStream());
            event.setEventPicture(imageData);
        }
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
       
        

        dao.updateEvent(event);
        
        
        int eventID = Integer.parseInt(request.getParameter("EventID"));
        request.setAttribute("event", EventDAO.getEventByID(eventID));
        response.sendRedirect("listeventcontroller");
    }
    
    private byte[] inputStreamToByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        return buffer.toByteArray();
    }
}
