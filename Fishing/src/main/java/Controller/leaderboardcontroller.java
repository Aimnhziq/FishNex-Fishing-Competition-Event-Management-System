package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LeaderboardBean;

import java.io.IOException;
import java.util.List;

import dao.LeaderboardDAO;

//@WebServlet("/viewleaderboardcontroller")
public class leaderboardcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int eventID = Integer.parseInt(request.getParameter("EventID"));
        System.out.println("leaderboardevent ID : " + eventID);
        LeaderboardDAO leaderboardDAO = new LeaderboardDAO();

        // Update the leaderboard with new points
        leaderboardDAO.updateLeaderboard(eventID);

        // Fetch the updated leaderboard
        List<LeaderboardBean> leaderboard = leaderboardDAO.getLeaderboard(eventID);

        System.out.println("Leaderboard size: " + leaderboard.size());
        request.setAttribute("leaders", leaderboard);
        RequestDispatcher view = request.getRequestDispatcher("leaderboard.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
