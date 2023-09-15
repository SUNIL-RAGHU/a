package com.sunil.Kaiburr.Kaiburr.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunil.Kaiburr.Kaiburr.Exception.ResourceNotFoundException;
import com.sunil.Kaiburr.Kaiburr.Models.Server;
import com.sunil.Kaiburr.Kaiburr.Repository.ServerRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ServerServiceImpl implements ServerService {

    @Autowired
    private ServerRepository serverRepository;

    @Override
    public List<Server> getAllServers() {
        return serverRepository.findAll();
    }

    @Override
    public Optional<Server> getServerById(String id) {
        return serverRepository.findById(id);
    }

    @Override
    public Server createServer(Server server) {
        return serverRepository.save(server);
    }

    @Override
    public void deleteServer(String id) {
        if (serverRepository.existsById(id)) {
            serverRepository.deleteById(id);
        } else {
            throw new ResourceNotFoundException("Server not found with id: " + id);
        }
    }

    @Override
    public List<Server> findServersByName(String name) {
        List<Server> servers = serverRepository.findByNameContains(name);
        if (servers.isEmpty()) {
            throw new ResourceNotFoundException("No servers found with name containing: " + name);
        }
        return servers;
    }
}