package com.mumstore.dao;

import com.google.gson.Gson;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mumstore.model.Product;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    Gson mapper = new Gson();

    public List<Product> getAllProducts(MongoDatabase req){

        Product product;
        List<Product> products = new ArrayList<>();
        MongoCollection<Document> coll = req.getCollection("product");
        MongoCursor cursor = coll.find().iterator();
        try {
            while (cursor.hasNext()) {

                product = mapper.fromJson(mapper.toJson(cursor.next()), Product.class);
                products.add(product);
            }

        } finally {
            cursor.close();

        }
        return products;
    }
}
