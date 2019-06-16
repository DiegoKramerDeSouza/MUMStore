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
        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
        String user = req.getParameter("user");
        String pass = req.getParameter("pass");
        User me = dao.authenticate(con, user, pass);

        if(me != null){
            if(me.validate(user, pass)){
                HttpSession session = req.getSession();
                session.setMaxInactiveInterval(60 * 60);
                me.setTotal();

                //System.out.println(mapper.toJson(me.getCart()));
                session.setAttribute("user", user);
                session.setAttribute("cart", me.getCart());
                session.setAttribute("total", me.getTotal());

                Cookie cookie = new Cookie("user", me.getName());
                cookie.setMaxAge(maxAge);
                resp.addCookie(cookie);
                resp.setStatus(1);
                resp.sendRedirect("/");
                return;
            }
        }
        resp.setStatus(0);
        resp.sendRedirect("/");
    }

    private void setCookie(String name, String value, HttpServletResponse resp){
        int lifetime = 30 * 24 * 60 * 60;
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(lifetime);
        resp.addCookie(cookie);
    }
}
