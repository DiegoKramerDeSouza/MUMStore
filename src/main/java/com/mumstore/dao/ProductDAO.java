package com.mumstore.dao;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.MongoClientException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mumstore.model.Product;
import org.bson.Document;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ProductDAO {

    Gson mapper = new Gson();

    public List<Product> getAllProducts(MongoDatabase con){

        MongoCollection<Document> coll = con.getCollection("product");
        MongoCursor cursor = coll.find().iterator();
        return computeList(cursor);
    }

    public List<Product> getProduct(MongoDatabase con, String target, String value){

        BasicDBObject query = new BasicDBObject();
        query.put(target, value);
        MongoCollection<Document> coll = con.getCollection("product");
        MongoCursor cursor = coll.find(query).iterator();
        return computeList(cursor);

    }

    private List<Product> computeList(MongoCursor cursor){

        Product product;
        List<Product> products = new ArrayList<>();
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

    public boolean addToCart(MongoDatabase con, List<String> product, String email){

        MongoCollection<Document> coll = con.getCollection("user");
        try{
            Document document = new Document();
            document.put("email", email);

            Document cart = new Document();
            cart.put("cart", product);

            Document update = new Document();
            update.put("$push", cart);
            coll.updateOne(document, update);

        }catch(MongoClientException e){
            return false;
        }
        return true;
    }
}
