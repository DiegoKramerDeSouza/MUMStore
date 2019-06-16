package com.mumstore.controller;

import com.google.gson.Gson;
import com.mongodb.client.MongoDatabase;
import com.mumstore.dao.UserDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class registerController extends HttpServlet {

    private UserDAO dao;
    private Gson mapper = new Gson();
    private ServletContext sc;

    @Override
    public void init() throws ServletException {
        this.dao = new UserDAO();
        this.sc = this.getServletContext();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
        String user = req.getParameter("fullName");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String confirm = req.getParameter("confirmPassword");
        String address = req.getParameter("address");
        if(validate(user, email, pass, confirm, address)){

        }
        

    }

    private boolean validate(String user, String email, String pass, String confirm, String address){
        if(user == null || (email == null || (pass == null || (confirm == null || (address == null)))))
            return false;
        if(!user.matches("^.{3,50}$")) return false;
        if(!email.matches("^.+@\\w+\\.\\w+$")) return false;
        if(!pass.matches("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,})")) return false;
        if(!pass.equals(confirm)) return false;
        if(!pass.matches(".{8,}")) return false;

        return true;
    }
}
