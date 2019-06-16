package com.mumstore.dao;

import com.google.gson.Gson;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mumstore.model.Product;
import com.mumstore.model.User;
import org.bson.Document;

import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    Gson mapper = new Gson();

    public User authenticate(MongoDatabase con, String login, String pass){

        User user;
        BasicDBObject query = new BasicDBObject();
        query.put("email", login);
        MongoCollection<Document> coll = con.getCollection("user");
        MongoCursor cursor = coll.find(query).iterator();

        try {
            while (cursor.hasNext()) {
                user = mapper.fromJson(mapper.toJson(cursor.next()), User.class);
                user.setKey();
                return user;
            }
        } finally {
            cursor.close();
        }

        return null;
    }
}
