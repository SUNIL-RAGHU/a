package com.sunil.Kaiburr.Kaiburr.Repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.sunil.Kaiburr.Kaiburr.Models.Server;



import java.util.List;

public interface ServerRepository extends MongoRepository<Server, String>, ServerCustomRepository {
    List<Server> findByNameContains(String name);
}