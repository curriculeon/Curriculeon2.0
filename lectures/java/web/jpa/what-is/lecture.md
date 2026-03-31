# JPA


## What is JPA?
* Abstraction above JDBC that makes it possible model databases as objects.
* Has two main purposes:
	1. ability to map objects to relational database.
	2. ability to query these mapped objects.

-
## What does JPA do?
* Maps an entity to an already existing table using sets of annotation.
* Generates SQL statements and executes them using JDBC onto the underlying database.
* Brings easy mechanism for mapping objects to relational databases thanks to meta data
* Manages lifecycle of persistent objects
* Features include
	* `EntityManager` API to perform CRUD and database-related operations
	* Java Persistence Query Language, an object-oriented query language

-
## JPA Implementations
* JPA has 3 implementations
	* EclipseLink
	* Hibernate
	* Apache Open JPA

-
-
## JPA Inheritance
* JPA has 3 strategies for modeling inheritance
	* `table-per-concrete-class`
	* `single-table-per-class`
	* `joined-subclass`

* JPA inheritance ensures that common fields within a hierarchy (i.e. `Id`) are abstracted into the superclass; Subclasses refer to the superclass's `Id` field.


-
## JPA Inheritance - Table Per Concrete Class
* `table-per-concrete-class`
  * all columns on root entity must be mapped to columns on child entity
  * no shared table
  * no shared column
  * no discriminator column

-
## JPA Inheritance - Single Table Per Class
* `single-table-per-class`
  * default inheritance strategy.
  * requires all child fields are nullable.
  * introduces redundancies.

-
## JPA Inheritance - Joined Subclass
* `joined-subclass`
  * all columns on root entity must will be mapped to columns on child entity via join statements of two tables modeling each of entity's fields separately.






-
-
## The JPA API


-
### Annotations
* After annotating each entity properly, JPA offers the ability to query them and their relationships in an object oriented way, without having to use the underlying database foreign keys and columns.


-
-
#### `@Entity`
* Annotates class signature
* **Description:**
	* Allows the persistence provider to recognize it as a persistence class.
	* An object representative of a snap shot of data from a database.
	* By default, maps this entity to a table whose name is the name of the annotated class. Can be rerouted via the `@Table` annotation

-
#### `@Entity`
* **Pre-requesites for use:**
	* An interface cannot be an entity.
	* An enum cannot be an entity.
	* The class can be abstract or concrete.
	* The class must define a no-arg constructor.
	* Each `Entity` must be annotated with a respective `ID`.


-
#### `@Id`
* Annotates field declarations
* **Description:**
	* Denotes the primary key for this `Entity`.
	* Can be generated manually by application or by automatically by the persistence provider.
* **Pre-requisites for use:**
	* Class must be annotated with `@Entity`

	
-
-
#### `Table(name = "TABLE_NAME")`
* Annotates class signatures
* **Description:**
	* Routes this entity to a table whose name is the specified value.
* **Pre-requesites for use:**
	* Class must be annotated with `@Entity`.



-
#### `Table(name = "TABLE_NAME")`
* **Required Attributes:**
  * `name` - specifies the name of the table to route this entity to.
* **Optional Attributes:**
  * `catalog` - respective named collection of schemas in an SQL-environment. 
  * `schema`- used to differentiate one set of tables from another

	
-
#### `@GeneratedValue(strategy = GenerationType.${ENUM_VALUE})`
* Annotates `Id` fields.
* Specifies how the persistence provider will generate this value.
* **Pre-requesites for use:**
	* Field must be annotated with `@Id`.
* **Generation Types:**
	* `GenerationType.SEQUENCE`
	* `GenerationType.TABLE`
	* `GenerationType.AUTO`
	* `GenerationType.IDENTITY`



-
#### `@GeneratedValue(strategy = GenerationType.TABLE)`
* `GenerationType.AUTO`
	* default value when no strategy specified.
	* Provider does generation of a key automatically.
	* Provider selects an appropriate strategy for a particular database.



-
#### `@GeneratedValue(strategy = GenerationType.SEQUENCE)`
* `GenerationType.SEQUENCE`
	* specifies the use of database SQL sequence



-
#### `@GeneratedValue(strategy = GenerationType.SEQUENCE)`
* `GenerationType.IDENTITY`
	* uses a database identity column




-
#### `@GeneratedValue(strategy = GenerationType.SEQUENCE)`
* `GenerationType.TABLE`
	* instructs provider to store the sequence name and its current value in a table, increasing the value of each time a new instance of the entity is persisted.




-
#### `@DiscriminatorColumn`
* **Description:**
	* Allows the provider to know which row belongs to which entity.
	* Used as part of JPA's inheritance-modeling strategy.
	* Declared by the superclass.
* **Attributes:**
	* `discriminatorType = DiscriminatorType.ENUM_VALUE`
	* `name = "COLUMN_NAME"`
	* `columnDefinition = "TINYINT(1)"`
	

-
#### `@Column(name = "COLUMN_NAME")`
* **Description:**
	* This annotation reroutes the mapping of this field to a column with the specified name.
	* By defualt in JPA, fields map to a column whose name is the name of the instance variable. (i.e. - `firstName` field maps to `firstName` column).

-
#### `@Column(name = "COLUMN_NAME")`
* **Attributes:**
	* **Required:**
		* `name` - specifies the column name to route this field  to.
	* **Optional:**
		* `length` - specify the length of characters this `String` field can hold.
		* `nullable` - can be null.
* **Pre-requesites for use:**
	* Class must be annotated with `@Entity`.
	* Must annotate a `getter`, or field declaration.
	
	
	
-
#### `@Temporal(TemporalType.ENUM_VALUE)`
* Annotates a field / instance variable
* Specifies has to represent this `Temporal` java object in the database.
* **Valid arguments:**
	* `TemporalType.DATE` - least precision
	* `TemporalType.TIME` - higher precision
	* `TemporalType.TIMESTAMP` - highest precision
* **Pre-requesites for use:**
	* Class must be annotated with `@Entity`.
	* Field must be of a java `Temporal` type: `Date`, `LocalDate`, `TimeStamp`, etc.


-
#### `@Transient`
* Ensures JPA does not map this attribute.

#### `@Enumerated(EnumType.HOW_TO_PERSIST)`
* `EnumType.ORDINAL` - Instructs JPA to map this enumeration's `ordinal()` value to a respective `integer` value in the database.
* `EnumType.STRING` Instructs JPA to map this enumeration's `name()` value to a respective `varchar` in the database.




-
-
#### Cardinal Relationships
* `OneToOne`
* `@OneToMany`
* `@ManyToMany`
* `@ManyToOne`

* **Optional Attributes:**
 	* `cascade = ALL`
	* `cascade = {PERSIST, REMOVE, MERGE}`
		* if `EntityManager` invokes `persist`,`remove`, or `merge` on this entity, then its composite `cascaded` members be affected by the same method invokation.


-
-
## Frequently Asked Questions (FAQs)

-
### What is a discriminator column?
* Always in the table of the base entity.

-
### What is a cascading event?
* Process whereby something information is successively passed on

-
### What is fetching?
* The mechanism by which a client gets from one side of a relationship to another.
	* eager fetch - immediately
	* lazy fetch - defferered


-
### What is a Join Table?
* A join is a view of two tables linked by two foreign keys referring to each other's primary key.

-
### What is a Database Catalog?
* [Catalogs](https://stackoverflow.com/questions/7022755/whats-the-difference-between-a-catalog-and-a-schema-in-a-relational-database) are named collections of schemas in an SQL-environment. 




-
### How is type-conversion handled between platforms?
* JDBC rules apply for mapping Java primitives through relational data-types.
	* `String` is mapped to `VARCHAR(255)`.
	* `Long` is mapped to `BIGINT`.
	* `Boolean` is mapped to `SMALLINT`
	* `Enum` is mapped to `INTEGER`



-
### What is Configuration by Exception?
* Unless specified differently, the JPA provider should apply default rules.
	* Having to supply a configuration is an exception to the rule.
* An entity's instance variables also become persistent following default mapping, also called `configuration by exception`.
* **Other aliases for this phrase:**
	* Programming by exception
	* Convention over configuration


-
### What is an `Entity`?
* An entity is object which lives shortly in-memory, and persistently in a database.
* An entity is denoted using the `@Entity` annotation on a respective class signature.
* Entity's can be configured via `@Entity` annotation or `XML` configuration.]
	* **XML configuration takes precedence!**
* An entity consists of metadata.
* An entity has some metadata that describes its relationship with an underlying database

-
### What is `MetaData`?
* Metadata is information that is held as a description of stored data.
* Additional metadata can be specified using annotations to further describe relationships.
	* Examples: `@Table`, `@Id`, `@GeneratedValue`

-
### What is an example of `MetaDta`?
* To denote an entity is stored in a table, (e.g. a table named `people`), annotate the class signature with `@Table` (e.g. `@Table(name = "people")`
	* For example, given a Table of `Person` objects named `People`, one expects a `Person` entity with an annotated class signature of

```java
@Entity
@Table(name = "people")
public class Person { ... }
```



-
-
### What is an `EntityManager` ?
* The centralized service to manipulate instance of entity.
* Provides a `CRUD` API to create, find, remove, and synchronize objects with the database.
	* does **not** make use of an explicit `update` method as its synchronization should automatically update the state of a managed entity.
* Can be obtained through `EntityManagerFactory`

	```java
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("persistenceUnitName")
	EntityManager em = emf.createEntityManager();
	```
	


-
### What is an `EntityManager` ?
* Can perform basic query operations given a unique identifier.

```java
Long id = 0;
Person person = em.find(Person.class, id);
```


-
### What is an `EntityManager` ?
* Can perform JPQL querys

	```java
	String jpql = "SELECT person FROM people ORDER BY person.name";
	Query query = em.createQuery(jpql);
	query.executeUpdate();
	```

-
### What is an `EntityManager` ?
* Can perform a `merge`
	* Merge takes a detached object and returns a managed entity.

	```java
	Person managedEntity = em.merge(new Person())
	```

-
### What is an `EntityManager` ?
* Can perform a `persist`
	* Entities are not persisted until an `EntityManager` explicitly persists the object.
	* When an object is persisted, it is manageable by the `EntityManager` and eligible to be inserted into the database upon committing the transaction.

	```java
	em.persist(new Person())
	```


-
-
### What is an `EntityTransaction`?
* An abstraction that is used to group together a series of operations.
	* Ensures all operations succeed, or none of them are executed.
* Can be obtained from `EntityManager`

	```java
	EntityTransaction et = em.getTransaction();
	```

* Begins and commits transactions performed by `EntityManager`
	
	```java
	et.begin(); // begin a set of operations; a transaction

	em.merge(entity); // begin managing entity
	em.persist(entity); // begin persisting entity
	
	et.commit(); // execute all operations since transaction began
	```

-
### What is a `Managed Entity`?


-
### What is a `Query`?
* A query is a statement which describes a selection of entities from a database.
* Queries allow a client to search,  sort, aggregate, and analyze data.

-
### What is a `Service Object`?
* An application's business logic or individual functions are modularized and presented as services for consumer/client applications.
* Defines `CRUD` operations

-
### What is `CRUD`?
* `CRUD` is an interface which ensures an object can
	* `create` persist new entities into a database.
	* `read` entities into an application from a database.
	* `update` entities in a database.
	* `delete` entities from a database.


-
-
### What is `Java Persistence Query Language` (`JPQL`)?
* object oriented language for querying from relation database.
* retrieve an entity by any criteria.
* mocks SQL syntax, but rather than retrieving rows, it retrieve collections of entities.
* query is executed on underlying database with `SQL` and `JDBC` calls and the entity instances are the attributes set and are returned to the application.



-
### What is `Java Persistence Query Language` (`JPQL`)?
* Java Persistence Query Language is a platform-independent object-oriented query language
* JPQL is used to make queries against entities stored in a relational database

-
### How does `JPQL` translate to `SQL`?

* **JQL Syntax:**

```SQL
SELECT		i
FROM		Item i
WHERE		i.unitCost > 100.00
ORDER BY	i.title;
```


* **SQL Syntax:**

```SQL
SELECT		*
FROM		item
WHERE		unit_cost > 100.00
ORDER BY	title;
```

* Notice that JPQL uses the dot-notation to express reference to the _item's attribute_ as opposed to SQL using the _table's column-name_.
* JPQL manipulates objects and attributes, not tables and columns.



-
### What is `Persistence`?
* Persisting an entity is the operation of taking a transient object and storing its state to the database.
* This is typically done by an intermediate service object which references an `EntityManager`.

-
### What is a `Persistence Context`?
* A managed set of entity instances is called a persistence context.
* Is configured by a persistence unit
* Can have several persistence units.
* A first level cache.



-
### What is a `Persistence Unit`?

* Bridge between persistence context and database.
* Named configuration of this set of entities.
* Ensures entites are persisting as configured
	* i.e. - ensure instances to be persisted have non-repeating ids within this context




-
### How is a `Persistent Unit` expressed?
* an xml file called `persistence.xml`
	* `persistence-unit` tag has a `name` attribute.
	* `class` tag must be embedded within `persistence-unit`
		* wraps around class-paths of classes to be persisted.
	* `property` tag tells persistence context:
		* which JDBC driver to use
		* where the database is located
		* username
		* password
		* a property with a name prefixed with `javax.persistence.` is _portable_; it will be interpreted by all JPA provider implementations.