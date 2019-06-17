package com.mumstore.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
import java.util.stream.Collector;
import java.util.stream.Collectors;

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
        HttpSession session = req.getSession();
        String id = req.getParameter("id");
        String qtd = req.getParameter("qtd");
        String email = (String) session.getAttribute("user");

        if(req.getParameter("remove") != null){
            List<String[]> items = (List<String[]>) session.getAttribute("cart");
            List<String[]> newItems = items.stream().filter(item -> !(item[1].equals(id) && item[6].equals(qtd)))
                                        .collect(Collectors.toList());
            System.out.println(newItems);
            setAttributes(newItems, session);
            dao.removeFromCart(con, newItems, email);
            resp.sendRedirect("/checkout?E=0");
            return;
        }

        String name = req.getParameter("name");
        String price = req.getParameter("price");
        String pic = req.getParameter("pic");
        String desc = req.getParameter("desc");
        String type = req.getParameter("type");

        List<String> product = Arrays.asList(name, id, price, pic, desc, type, qtd);
        if(dao.addToCart(con, product, email) && email != null){
            String[] list = {name, id, price, pic, desc, type, qtd};
            List<String[]> items = (List<String[]>) session.getAttribute("cart");
            items.add(list);
            setAttributes(items, session);

            resp.sendRedirect("/checkout?E=0");
            return;
        }
        resp.sendRedirect("/product?id=" + id + "&E=1");
    }

    private void setAttributes(List<String[]> items, HttpSession session){
        Double total = items.stream().mapToDouble(item -> Double.parseDouble(item[2]) * Double.parseDouble(item[6])).sum();
        session.setAttribute("cart", items);
        session.setAttribute("total", total);
    }
}
