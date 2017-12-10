/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.com.iu.scse.sample.sampleservlet;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author junnguyen
 */
public class CookieService {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public CookieService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public void storeCookieName(String firstName, String lastName) {
        Cookie c = new Cookie("myName", firstName + " " + lastName);
        c.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(c);

    }

    public String getCookieName() {

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("myName")) {
                    return cookie.getValue();
                    
                }
            }
        }

        return null;
    }

}
