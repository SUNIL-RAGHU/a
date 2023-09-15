package com.sunil.Kaiburr.Kaiburr.Repository;

import java.util.List;

import com.sunil.Kaiburr.Kaiburr.Models.Server;

public interface ServerCustomRepository {
    List<Server> findByNameContains(String name);
}