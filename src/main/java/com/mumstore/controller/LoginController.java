package com.mumstore.controller;

import com.google.gson.Gson;
import com.mongodb.client.MongoDatabase;
import com.mumstore.dao.UserDAO;
import com.mumstore.model.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/auth")
public class LoginController extends HttpServlet {

    private UserDAO dao;
    private Gson mapper = new Gson();
    private ServletContext sc;
    private int maxAge = 30 * 24 * 60 * 60;


    @Override
    public void init() throws ServletException {
        this.dao = new UserDAO();
        this.sc = this.getServletContext();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key = req.getParameter("key");
        String email = req.getParameter("user");
        if(key != null){
            MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
            User me = dao.authenticate(con, email);
            HttpSession session = req.getSession();
            if(me != null){
                String item = me.getKey() + "";
                if(item.equals(key)){
                    prepareSession(resp, session, me, email);
                    return;
                }
            }
            resp.sendRedirect("/");
        } else {
            auth(req, resp, email);
        }
    }

    private void auth(HttpServletRequest req, HttpServletResponse resp, String email)  throws ServletException, IOException {

        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
        String pass = req.getParameter("pass");
        User me = dao.authenticate(con, email);
        HttpSession session = req.getSession();
        if(me != null){
            if(me.validate(email, pass)){
                prepareSession(resp, session, me, email);
                return;
            }
        }
        resp.sendRedirect("/?E=10");
    }

    private void prepareSession(HttpServletResponse resp, HttpSession session, User me, String email) throws ServletException, IOException{
        session.setMaxInactiveInterval(60 * 60);
        me.setTotal();
        session.setAttribute("user", email);
        session.setAttribute("address", me.getAddress());
        session.setAttribute("cart", me.getCart());
        session.setAttribute("total", me.getTotal());

        Cookie cookie = new Cookie("user", me.getName());
        cookie.setMaxAge(maxAge);
        resp.addCookie(cookie);
        cookie = new Cookie("mail", me.getEmail());
        cookie.setMaxAge(maxAge);
        resp.addCookie(cookie);
        cookie = new Cookie("holder", me.getKey() + "");
        cookie.setMaxAge(maxAge);
        resp.addCookie(cookie);
        resp.sendRedirect("/");
    }


}
