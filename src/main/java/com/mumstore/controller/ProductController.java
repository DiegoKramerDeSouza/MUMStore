package com.mumstore.controller;

import com.google.gson.Gson;
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
        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
        List<Product> products = dao.getAllProducts(con);
        //System.out.println(products.get(0).getId());
        PrintWriter out = resp.getWriter();
        out.print(mapper.toJson(products));
    }

}
