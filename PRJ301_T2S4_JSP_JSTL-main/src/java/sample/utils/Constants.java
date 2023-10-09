/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

/**
 *
 * @author hoang
 */
public class Constants {
    public static String GOOGLE_CLIENT_ID = "438135152455-blfregrglgj23rm6r3u6adqk1b6sl15q.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8084/PRJ301_T2S4_JSP_JSTL/GoogleController";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v2/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";
    
    public static String USERID_REGEX = "^[a-zA-Z0-9]{3,10}$";
    public static String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[a-z])(?=\\S+$).{6,}$";
}
