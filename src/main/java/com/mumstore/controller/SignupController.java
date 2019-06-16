package com.mumstore.controller;

import com.google.gson.Gson;
import com.mongodb.client.MongoDatabase;
import com.mumstore.dao.UserDAO;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addUser")
public class SignupController extends HttpServlet {

    private UserDAO dao;
    private Gson mapper = new Gson();
    private ServletContext sc;

    @Override
    public void init() throws ServletException {
        this.dao = new UserDAO();
        this.sc  = this.getServletContext();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
        PrintWriter out = resp.getWriter();
        String name = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmpassword");
        String address = req.getParameter("address");
        System.out.println(name);
        if((name=="") || (email=="") || (password=="") ||(address=="")){
            out.print("Enter all the fields");
            return;
        }
        else{
            if(isInvalid(password,confirmPassword)){
                resp.sendRedirect("/");
            }
            else{
                out.print("Enter all the fields");
                return;
            }
        }

    }

    public boolean isInvalid(String pass, String confirmPass){
        if(pass.equals(confirmPass)){
            return true;
        }
        return false;
    }
}
