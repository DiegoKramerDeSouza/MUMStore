package com.mumstore.controller;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoDatabase;
import com.mumstore.dao.ProductDAO;
import com.mumstore.model.Product;
import com.mumstore.model.User;
import org.bson.Document;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
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
        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");
        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MongoDatabase con = (MongoDatabase) sc.getAttribute("dbdatabase");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String pic = req.getParameter("pic");
        String desc = req.getParameter("desc");
        String type = req.getParameter("type");
        String qtd = req.getParameter("qtd");
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("user");
        List<String> product = Arrays.asList(name, id, price, pic, desc, type, qtd);
        if(dao.addToCart(con, product, email)){
            String[] list = {name, id, price, pic, desc, type, qtd};
            List<String[]> items = (List<String[]>) session.getAttribute("cart");
            items.add(list);
            Double total = items.stream().mapToDouble(item -> Double.parseDouble(item[2]) * Double.parseDouble(item[6])).sum();
            session.setAttribute("cart", items);
            session.setAttribute("total", total);
            resp.setStatus(1);
            resp.sendRedirect("/checkout");
            return;
        }
        resp.setStatus(0);
        resp.sendRedirect("/product?id=" + id);
    }
}
