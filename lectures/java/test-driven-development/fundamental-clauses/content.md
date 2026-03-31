# Test Driven Development<br>The 3 Fundamental Test Clauses












### Fundamental Clauses
* There exists an _inferrable_
* _given_,
* _when_,
*  and _then_
* clause for every test.



#### Fundamental Clauses: _given_
* The _given_ clause declares, initializes, and instantiates all _known_ variable values.
* The _given_ clause of a test sets the state of the "environment" for the entity that needs to be tested.
* The expected output is always _given_ prior to testing. (How else could one test?)
* An object must set its _state_ for the respective test
    * A `Person` must `setName` before attempting to `getName`
    * An `Inventory` must `add` items before attempting to `get` an item
    * A `Game` must have a `Player` before attempting to `play`




#### Fundamental Clauses: _given_
#### Example 1
* A `Person` must `setName` before attempting to `getName`

```java
@Test
public void testGetName() {
    // given
    Person person = new Person();
    String expectedName = "Leon";
    person.setName(expectedName);
}
```


#### Fundamental Clauses: _given_
#### Example 2
* An `Inventory` must `add` items before attempting to `get` an item

```java
@Test
public void testGetItem() {
    // given
    Inventory inventory = new Inventory();
    String expectedItem = "Milk";
    inventory.add(expectedItem)
}
```



#### Fundamental Clauses: _given_
#### Example 3
* A `Game` must `add` a `Player` before attempting to `play`
```java
@Test
public void testGetWinner() {
    // given
    Game game = new Game();
    Player expectedWinner = new Player();
    game.add(player);
    game.play();
}
```











#### Fundamental Clauses: _when_
* _when_ clause invokes the method to be tested
* _when_ clause stores output of method invokation.
    * `void` methods should change state of an object.
    * output should be retrieved by supplementary method-invokation followed by the invokation of the method to be tested.
    * by convention, the output of the method invokation is stored in a variable named `actual`.



#### Fundamental Clauses: _when_
* In simple test-classes, test-methods are named after the method to be tested in the _when_ clause.
    * The `getName` method of a `Person` class is tested by `testGetName` method of a `PersonTest` class.
    * The `get` method of an `Inventory` class is tested by `testGet` method of a `InventoryTest` class.
    * The `play` method of a `Game` class is tested by `testPlay` method of a `GameTest` class.





#### Fundamental Clauses: _when_
#### Example 1


```java
@Test
public void testGetName() {
    // given
    Person person = new Person();
    String expectedName = "Leon";
    person.setName(expectedName);

    // when
    String actualName = person.getName();
}
```


#### Fundamental Clauses: _when_
#### Example 2

```java
@Test
public void testGetItem() {
    // given
    Inventory inventory = new Inventory();
    String expectedItem = "Milk";
    inventory.add(expectedItem)

    // when
    String expectedItem = inventory.get(0);
}
```



#### Fundamental Clauses: _when_
#### Example 3

```java
@Test
public void testGetWinner() {
    // given
    Game game = new Game();
    Player expectedWinner = new Player();
    game.add(player);
    game.play();

    // when
    Player actualWinner = game.getWinner()
}
```
















#### Fundamental Clauses: _then_
* _then_ clause will `assert` something to be `true` regarding the output of the method being tested
    * If these assertions fail, then we will be pointed to the defect in the code.
    * If these assertions pass, then we know our implementation works as expected.
* Simple test cases typically `assert` the `expected` output to be equal to the `actual` output.






#### Fundamental Clauses: _then_
#### Example 1


```java
@Test
public void testGetName() {
    // given
    Person person = new Person();
    String expectedName = "Leon";
    person.setName(expectedName);

    // when
    String actualName = person.getName();

    // then
    Assert.assertEquals(expectedName, actualName);
}
```


#### Fundamental Clauses: _then_
#### Example 2

```java
@Test
public void testGetItem() {
    // given
    Inventory inventory = new Inventory();
    String expectedItem = "Milk";
    inventory.add(expectedItem)

    // when
    String actualItem = inventory.get(0);

    // then
    Assert.assertEquals(expectedItem, actualItem);
}
```



#### Fundamental Clauses: _then_
#### Example 3

```java
@Test
public void testGetWinner() {
    // given
    Game game = new Game();
    Player expectedWinner = new Player();
    game.add(player);
    game.play();

    // when
    Player actualWinner = game.getWinner()

    // then
    Assert.assertEquals(expectedWinner, actualWinner)
}
```








