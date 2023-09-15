package com.sunil.Kaiburr.Kaiburr.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.sunil.Kaiburr.Kaiburr.Models.Server;
import com.sunil.Kaiburr.Kaiburr.Repository.ServerCustomRepository;

import java.util.List;

import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

@Repository
public class ServerCustomRepositoryImpl implements ServerCustomRepository {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public List<Server> findByNameContains(String name) {
        return mongoTemplate.find(
                query(where("name").regex(name, "i")),
                Server.class
        );
    }
}
