# Mockito


### What is Mockito?
* Mockito is a popular Java library used for testing.
* It allows developers to create mock objects, which can be used to simulate the behavior of real objects in a controlled manner.
* In other words, it allows developers to simulate the behavior of certain objects and verify that their code is working as expected.
* This is especially useful when testing code that relies on external resources, such as databases or web services.


### Using Mockito with the PersonController class
* Consider the following 3 classes: `Person`, `PersonService`, and `PersonController`.

#### Person
* The `Person` class is a simple Java object (POJO) that represents a row in a database table.
* It is used as a model object in this Representational State Transfer (REST) API example.
* It is serialized and deserialized as a JSON object when being transferred over the network.
    * In this way, the `Person` class plays a crucial role in the flow of data between the server and the client in a REST API.
    * When a client makes a request to `create`, `read`, `update`, or `delete` a person in the database, the `Person` class is used to represent the relevant data that is being manipulated.
    * The `Person` class also serves as a way to map the data in the database rows to a more usable form in the application code.


```java
@Entity
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    String firstName;
    String lastName;

    public Person() {

    }

    public Person(Long id, String firstName, String lastName) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public boolean equals(Object obj) {
        return this.toString().equals(Objects.requireNonNull(obj).toString());
    }

    @Override
    public String toString() {
        try {
            return new ObjectMapper().writeValueAsString(this);
        } catch (JsonProcessingException e) {
            return "Person{" +
                    "id=" + id +
                    ", firstName='" + firstName + '\'' +
                    ", lastName='" + lastName + '\'' +
                    '}';
        }
    }
}
```

#### PersonService
* The `PersonService` class is responsible for providing business logic and handling data persistence for the `Person` entity.
* The `PersonService` class is used in the methods of the PersonController class to handle the methods for creating, retrieving, updating, and deleting Person objects.

```java

@Service
public class PersonService {
    private PersonRepository repository;

    @Autowired
    public PersonService(PersonRepository repository) {
        this.repository = repository;
    }

    public Person create(Person person) {
        Person personCreated = repository.save(person);
        return personCreated;
    }

    public Person read(Long id) {
        Optional<Person> potentialPerson = repository.findById(id);
        Person person = potentialPerson.get();
        return person;
    }

    public Person update(Long id, Person person) {
        Person personInDataBase = read(id);
        String newFirstName = person.getFirstName();
        String newLastName = person.getLastName();

        personInDataBase.setFirstName(newFirstName);
        personInDataBase.setLastName(newLastName);
        repository.save(personInDataBase);
        return personInDataBase;
    }

    public Person delete(Long id) {
        Person person = read(id);
        repository.delete(person);
        return person;
    }

    public List<Person> readAll() {
        List<Person> personList = new ArrayList<>();
        repository.findAll().forEach(personList::add);
        return personList;
    }
}
```


#### PersonController
* The `PersonController` class is a Spring `RestController` that provides endpoints for creating, retrieving, updating, and deleting `Person` objects.

```java

@CrossOrigin(origins = "*")
@RequestMapping(value = "/person-controller")
@RestController
public class PersonController {
    private PersonService service;

    @Autowired
    public PersonController(PersonService service) {
        this.service = service;
    }


    @RequestMapping(path = "/create", method = RequestMethod.POST)
    public ResponseEntity<Person> create(@RequestBody Person person) {
        Person responseBody = service.create(person);
        ResponseEntity responseEntity = new ResponseEntity<>(responseBody, HttpStatus.OK);
        return responseEntity;
    }


    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public ResponseEntity<Person> read(@PathVariable Long id) {
        Person responseBody = service.read(id);
        ResponseEntity responseEntity = new ResponseEntity<>(responseBody, HttpStatus.OK);
        return responseEntity;
    }

    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    public ResponseEntity<Person> update(@PathVariable Long id, @RequestBody Person person) {
        Person responseBody = service.update(id, person);
        ResponseEntity responseEntity = new ResponseEntity<>(responseBody, HttpStatus.OK);
        return responseEntity;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Person> delete(@PathVariable Long id) {
        Person responseBody = service.delete(id);
        ResponseEntity responseEntity = new ResponseEntity<>(responseBody, HttpStatus.OK);
        return responseEntity;
    }


    @RequestMapping(value = "/read-all", method = RequestMethod.GET)
    public ResponseEntity<List<Person>> readAll() {
        List<Person> responseBody = service.readAll();
        ResponseEntity responseEntity = new ResponseEntity<>(responseBody, HttpStatus.OK);
        return responseEntity;
    }
}
```


### Using Mockito with the PersonController and Person classes
* In the example provided, we have a `PersonController` class with a `create` method that accepts a Person object and returns a `ResponseEntity` object.
* The `Person` class has several properties, including `id`, `firstName`, and `lastName`.
* To test the `create` method using Mockito, we can create a mock `PersonService` object and use it to control the behavior of the `create` method.
* For example, we can use Mockito's `when` method to specify that when the `create` method is called with a specific `Person` object, it should return a predetermined `Person` object:

```java
@Test
public void testCreate() {
    // Given: Create mock PersonService
    PersonService service = mock(PersonService.class);
    PersonController controller = new PersonController(mockService);
    Person expected = new Person(1L, "John", "Doe");
    // Given: Stub create method to return predetermined Person object
    when(mockService.create(any(Person.class))).thenReturn(expected);
    // Given: Instantiate PersonController using mock PersonService

    // When: Invoke create method on PersonController
    ResponseEntity<Person> response = controller.create(new Person());

    // Then: Assert that response contains expected Person object and HTTP status code
    assertEquals(expected, response.getBody());
    assertEquals(HttpStatus.OK, response.getStatusCode());
}
```

* This test case creates a new `PersonController` object with the mock `PersonService` and calls the `create` method with a `Person` object with a `firstName` of "John" and a `lastName` of "Doe".
* It then verifies that the `HttpStatus` of the response is `OK` and that the `Person` object in the response body is the same as the one we specified in the mock `PersonService`.