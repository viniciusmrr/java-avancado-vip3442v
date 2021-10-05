package repositories;

import com.mycompany.simplerest.entities.Product;
import com.mycompany.simplerest.entities.Worker;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

public class WorkerRepository {

    private HashMap<String, Worker> repository = new HashMap<>();

    public void save(Worker worker) {
        if (worker.getId() == null) {
            worker.setId(UUID.randomUUID().toString());
        }
        this.repository.put(worker.getId(), worker);
    }

    public List<Worker> getAll() {
        return new ArrayList(this.repository.values());
    }

    public Worker findById(String id) {
        return this.repository.get(id);
    }

    public void delete(Worker worker) {
        this.repository.remove(worker.getId());
    }

}
