package com.mycompany.simplerest.controllers;

import com.mycompany.simplerest.entities.Product;
import com.mycompany.simplerest.entities.Worker;
import java.util.ArrayList;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import repositories.WorkerRepository;

@Path("workers") // o que vai acessar na URL
public class WorkerController {

    private static WorkerRepository _repository = new WorkerRepository();

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response get() {
        return Response.ok(this._repository.getAll()).build();
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response create(Worker worker) {
        this._repository.save(worker);
        return Response.ok(worker).build();
    }
    
    @GET
    @Path("{id}")
    public Response show(@PathParam("id")String id) {
        Worker worker = this._repository.findById(id);

        return Response.ok(worker).build();
    }
}
