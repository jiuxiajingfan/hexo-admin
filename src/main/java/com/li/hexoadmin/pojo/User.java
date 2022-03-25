package com.li.hexoadmin.pojo;

public class User {
    private int UserID;
    private String UserName;
    private String UserPWD;

    public User() {
    }

    public User(int userID, String userName, String userPWD) {
        UserID = userID;
        UserName = userName;
        UserPWD = userPWD;
    }

    public void setUserID(int userID) {
        UserID = userID;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public void setUserPWD(String userPWD) {
        UserPWD = userPWD;
    }

}
