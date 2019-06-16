package com.mumstore.controller;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoDatabase;
import com.mumstore.dao.ProductDAO;
import com.mumstore.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/API/product")
public class ProductController extends HttpServlet {


    private ProductDAO dao;
    Gson mapper = new Gson();
    ServletContext sc;

    @Override
    public void init() throws ServletException {
        this.dao = new ProductDAO();
        this.sc = this.getServletContext();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
        req.setAttribute("products",dao.getAllProducts(con));
        if(req.getParameter("id") != null){
            List<Product> products = dao.getProduct(con, "id", req.getParameter("id"));
            out.print(mapper.toJson(products));
        } else if(req.getParameter("type") != null){
            List<Product> products = dao.getProduct(con, "type", req.getParameter("type"));
            out.print(mapper.toJson(products));
        } else {
            List<Product> products = dao.getAllProducts(con);
            out.print(mapper.toJson(products));
        }
    }

}
