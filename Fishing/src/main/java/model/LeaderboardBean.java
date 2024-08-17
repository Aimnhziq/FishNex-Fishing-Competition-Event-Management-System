package model;

public class LeaderboardBean {
    private int rank;
    private String custName;
    private String catchName;
    private double points;

    // Getters and Setters
    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCatchName() {
        return catchName;
    }

    public void setCatchName(String catchName) {
        this.catchName = catchName;
    }

    public double getPoints() {
        return points;
    }

    public void setPoints(double points) {
        this.points = points;
    }
}