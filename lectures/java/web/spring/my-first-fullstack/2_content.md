# My First Full Stack Spring Boot / JQuery Application
## Part 2 - Creating a Repository / Config

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./videos/2_spring-jquery.mp4">
</video>


### Create Repository
* [Data Access Objects (DAOs)](https://en.wikipedia.org/wiki/Data_access_object) provide an abstraction for interacting with _datastores_.
* In the Spring framework, _repositories_ act as a specific type of _DAO_ which can access a respective database table.
    * For example, `PersonRepository` can access a respective `PERSON` database table.
* Typically DAOs include an interface that provides
    1. a set of finder methods for retrieving data such as `readById`, `readAll`
    2. and methods to persist and delete data such as `create`, `updateById`, and `deleteById`
* It is customary to have one `Repository` per `model` object.

```java
public interface PersonRepository extends CrudRepository<Person, Long> {
}
```

[<img src="./img/create-repository.gif">](./img/create-repository.gif)




### Prepopulate The Entity

* Populates the `Person` table in H2 with entities before the Web Server begins serving.

```java
@Configuration
public class PersonConfig {
    @Autowired
    private PersonRepository repository;

    @PostConstruct
    public void setup() {
        Person person1 = new Person();
        person1.setFirstName("Leon");
        person1.setLastName("Hunter");

        Person person2 = new Person();
        person2.setFirstName("John");
        person2.setLastName("Doe");

        repository.saveAll(Arrays.asList(
                person1,
                person2
        ));
    }
}
```

[<img src="./img/person-config.gif">](./img/person-config.gif)



* View the newly added records by
    1. restarting the application
    2. navigating to `localhost:8080/h2-console`
    3. Executing query `SELECT * FROM PERSON` in the `H2-Console`



[<img src="./img/view-h2console-entity-populated.gif">](./img/view-h2console-entity-populated.gif)

