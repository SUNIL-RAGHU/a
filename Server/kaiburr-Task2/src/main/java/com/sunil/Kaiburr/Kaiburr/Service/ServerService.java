package com.sunil.Kaiburr.Kaiburr.Service;

import java.util.List;
import java.util.Optional;

import com.sunil.Kaiburr.Kaiburr.Models.Server;



public interface ServerService {
    List<Server> getAllServers();
    Optional<Server> getServerById(String id);
    Server createServer(Server server);
    void deleteServer(String id);
    List<Server> findServersByName(String name);
}