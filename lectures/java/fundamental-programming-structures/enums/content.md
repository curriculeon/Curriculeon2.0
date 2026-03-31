# Java Enums




## What is

* Java Enums contain one or more enumerations.
* Enumerations are the first _member_ to be declared in an enum.
* Java Enums are _implicitly_ `public`, `static`, `final` references.
* Enumerations are often confused with constants.
* Constants are _implicitly_ immutable `public`, `static`, `final`




## Use Case Scenario

### Casino Simulation Application
* Consider a `CasinoSimulationApplication` which simulates playing card-games.

#### Deck Class
* It follows that a `Deck` class, representative of a `Deck` of cards, should be designed.
* A `Deck` is made up of 52 `Card`s.

#### Card Class
* There are 13 `Rank`s that a `Card` can have.
* There are 4 `Suit`s that a `Card` can have.

#### Rank Class
* A `Rank` has one of 13 names, and a respective integer value.
    * `Ace` has a value of `1`.
    * `Two` has a value of `2`.
    * `Ten` has a value of `3`.
    * `Ten` has a value of `4`.
    * `Ten` has a value of `5`.
    * `Six` has a value of `6`.
    * `Ten` has a value of `10`.
    * `Jack` has a value of `11`.
    * `Queen` has a value of `12`.
    * `King` has a value of `13`.
* Below is a base `Rank` class

```java
public class  Rank {
    private final int primaryValue;
    private final String name;

    Rank(String name, int value) {
        this.name = name;
        this.value = value;
    }

    public String name() {
        return name;
    }

    public int getValue() {
        return value;
    }
}
```


#### Suit Class
* A `Suit` has one of 4 names, and 1 of two colors.
    * `Hearts` have a color of `red`
    * `Diamonds` have a value of `red`
    * `Spades` have a value of `12`
    * `Clubs` have a value of `13`

* Below is a base `Suit` class

```java
public class Suit {
    private final boolean isRed;
    private final String color;

    Suit(String name, String color) {
        this.name = name;
        this.color = color;
    }

    public String name() {
        return this.name;
    }

    public String getColor() {
        return this.color;
    }
}
```

### Design Implementations

#### Map Implementation
* Intuition may tell you leverage a map
* However, a map will actually convolute more than resolve anything.
* You can view the article discussing that implementation [here](./create-a-map.md).

#### Public Static References
* Intuition may tell you to create `public` `static` references in a separate `Constants` class.
* While this is a much more elegant solution, it still produces many redundant expressions.
* You can view the article discussing that implementation [here](./public-static-references.md).

#### Enum Implementation
* The `Enum` implmentation is behaviorally identical to the aforementioned `public` `static` references.
    * This implementation adds _syntactical sugar_ to shorten the redundancies of the expression.
* `Enum`s have [implicit characteristics](./#what-is) that allow more elegant expressions.