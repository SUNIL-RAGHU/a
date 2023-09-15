package com.sunil.Kaiburr.Kaiburr.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.sunil.Kaiburr.Kaiburr.Exception.ResourceNotFoundException;
import com.sunil.Kaiburr.Kaiburr.Models.Server;
import com.sunil.Kaiburr.Kaiburr.Service.ServerService;

import java.util.List;

@RestController
@RequestMapping("/servers")
public class ServerController {

    @Autowired
    private ServerService serverService;

    @GetMapping("/get")
    public ResponseEntity<List<Server>> getAllServers() {
        List<Server> servers = serverService.getAllServers();
        return new ResponseEntity<>(servers, HttpStatus.OK);
    }

    @GetMapping("/get/{id}")
    public ResponseEntity<Server> getServerById(@PathVariable String id) {
        return serverService.getServerById(id)
                .map(server -> new ResponseEntity<>(server, HttpStatus.OK))
                .orElseThrow(() -> new ResourceNotFoundException("Server not found with id: " + id));
    }

    @PostMapping("/create")
   public ResponseEntity<Server> createServer(@RequestBody Server server) {
        Server createdServer = serverService.createServer(server);
        return new ResponseEntity<>(createdServer, HttpStatus.CREATED);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteServer(@PathVariable String id) {
        serverService.deleteServer(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/findByName")
    public ResponseEntity<List<Server>> findServersByName(@RequestParam String name) {
        List<Server> servers = serverService.findServersByName(name);
        return new ResponseEntity<>(servers, HttpStatus.OK);
    }
}
