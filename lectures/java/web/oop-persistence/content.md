# Mechanisms for Storing and Manipulating Data


-
## Relational Database Paradigm
* A database stores data in tables.
* Tables store data in rows and columns.
	* Each row represents a single entity in a table.
	* Each column represents a single property of an entity.
	* Each table is defined by a [schema](https://en.wikipedia.org/wiki/Database_schema)
	* Each table must specify a column or group of columns called the [primary key](https://en.wikipedia.org/wiki/Primary_key).
		* ensures each row has a unique way to be identified


-
## Object Oriented Paradigm
* An application stores data in Lists.
* Lists store data in Objects.
	* A single object in a list is a [transient](https://en.wikipedia.org/wiki/Transient_(computer_programming)) instance.
	* Each instance has a value associated with each of their properties.
	* Each instance is defined by a [class](https://en.wikipedia.org/wiki/Class_(computer_programming))
	* Each instance can be uniquely identified by their [memory address](https://en.wikipedia.org/wiki/Memory_address).


-
### OOP Relationships
* Associations between objects cause one object to cause another to perform an action its behalf; these associations have `multiplicity` which is composed of `cardinality` and `direction`.
* `object oriented cardinality` - models the aspect of how many entities exist on each side of the relationship; denoted by a range of numbers (i.e. `0..1`)
	* View [PluralSight's tutorial on cardinality](https://app.pluralsight.com/player?course=java-persistence-api-21&author=antonio-goncalves&name=java-persistence-api-21-m4-relinh&clip=2&mode=live)
	* `one-to-one`
	* `one-to-many`
	* `many-to-one`
	* `many-to-many`
* `object oriented direction` - models the fact that an object refers to another object
	* `unidirection` - `A` can reference `B`, `B` cannot reference `A`  .
	* `bidirectional` `A` and `B` can refer to `B` and `A` respectively.
	* 


-
## Object Relational Mapping
* ORMs delegate tools the task of mapping between objects and table.
* In Java EE, the framework is called Java Persistence API or JPA.
* Objects have transient state
	* Only available when the JVM is running.
	* Objects need to be persisted sometimes.
* Relational Databases are a component which store State
* The framework for implementing
