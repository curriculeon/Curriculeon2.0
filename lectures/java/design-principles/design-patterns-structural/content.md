# Design Patterns: Structural Patterns
* _The repository for this application can be found [here](https://github.com/the-quick-demonstrator/design-patterns)_

## Overview
* Building a Number Guess Game
* Building a Console Interface with Facade Design Pattern
* Refactoring Number Gues Game

### Building a Number Guess Game


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./1_facade-design.mp4">
</video>


```java
public class MainApplication {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while(true) {
            System.out.println("Enter a minimum value");
            final String min = scanner.nextLine();
            final Integer minInt = Integer.parseInt(min);
            System.out.println("Enter a maximum value");
            final String max = scanner.nextLine();
            final Integer maxInt = Integer.parseInt(max);
            System.out.println(String.format("Enter a guess between %s and %s", min, max));
            final String guess = scanner.nextLine();
            final Integer guessInt = Integer.parseInt(guess);
            final Integer randomValue = ThreadLocalRandom.current().nextInt(minInt, maxInt);
            if (guessInt > randomValue) {
                System.out.println("Guess a lower value");
            } else if (guessInt < randomValue) {
                System.out.println("Guess a higher value");
            } else {
                System.out.println("You guessed the correct value");
                break;
            }
        }
    }
}
```

### Building a Console Interface with Facade Design Pattern


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./2_facade-design.mp4">
</video>


```java
public class InputOutputFacade {
    private final InputStream in;
    private final PrintStream out;

    public InputOutputFacade() {
        this(System.in, System.out);
    }

    public InputOutputFacade(InputStream in, PrintStream out) {
        this.in = in;
        this.out = out;
    }

    public void print(String valueToBePrinted, Object... optionalStringFormatters) {
        out.printf(valueToBePrinted, optionalStringFormatters);
    }

    public void println(String valueToBePrinted, Object... optionalStringFormatters) {
        this.print(valueToBePrinted + "\n", optionalStringFormatters);
    }

    public String getStringInput(String prompt, Object... optionalStringFormatters) {
        final Scanner scanner = new Scanner(this.in);
        this.println(prompt, optionalStringFormatters);
        final String userInput = scanner.nextLine();
        return userInput;
    }

    public Double getDoubleInput(String prompt, Object... optionalStringFormatters) {
        final String stringInput = this.getStringInput(prompt, optionalStringFormatters);
        try {
            return Double.parseDouble(stringInput);
        } catch(NumberFormatException nfe) { // non-numeric value
            this.println("[ %s ] is an invalid input!", stringInput);
            this.println("Try inputting a numeric value!");
            return getDoubleInput(prompt, optionalStringFormatters); // prompt user again
        }
    }

    public Long getLongInput(String prompt, Object... optionalStringFormatters) {
        final String stringInput = this.getStringInput(prompt, optionalStringFormatters);
        try {
            return Long.parseLong(stringInput);
        } catch(NumberFormatException nfe) { // non-numeric value
            this.println("[ %s ] is an invalid input!", stringInput);
            this.println("Try inputting a integer value!");
            return getLongInput(prompt, optionalStringFormatters); // prompt user again
        }
    }

    public Integer getIntegerInput(String prompt, Object... optionalStringFormatters) {
        return getLongInput(prompt, optionalStringFormatters).intValue();
    }
}
```


### Refactoring Number Guess Game


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./3_facade-design.mp4">
</video>


```java
public class MainApplication {
    public static void main(String[] args) {
        InputOutputFacade io = new InputOutputFacade();
        final Integer minInt = io.getIntegerInput("Enter a minimum value");
        final Integer maxInt = io.getIntegerInput("Enter a maximum value");
        final Integer randomValue = ThreadLocalRandom.current().nextInt(minInt, maxInt);
        while(true) {
            final Integer guessInt = io.getIntegerInput("Enter a guess between %s and %s", minInt, maxInt);
            if (guessInt > randomValue) {
                io.println("Guess a lower value");
            } else if (guessInt < randomValue) {
                io.println("Guess a higher value");
            } else {
                io.println("You guessed the correct value");
                break;
            }
        }
    }
}
```



### Using the Filewriter

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./4_filewriter.mp4">
</video>

```java
public class MainApplication {
    public static void main(String[] args) {
        final InputOutputFacade io = new InputOutputFacade();

        Integer numberOfGuesses = 0;
        final Integer minInt = io.getIntegerInput("Enter a minimum value");
        final Integer maxInt = io.getIntegerInput("Enter a maximum value");
        final Integer randomValue = ThreadLocalRandom.current().nextInt(minInt, maxInt);
        while (true) {
            final Integer guessInt = io.getIntegerInput("Enter a guess between %s and %s", minInt, maxInt);
            numberOfGuesses++;
            if (guessInt > randomValue) {
                io.println("Guess a lower value");
            } else if (guessInt < randomValue) {
                io.println("Guess a higher value");
            } else {
                io.println("You guessed the correct value");
                break;
            }
        }
        io.println("Number of Guesses: %s", numberOfGuesses);


        final String currentProjectDirectory = System.getProperty("user.dir");
        final String resourceDirectoryLocalPath = "/src/main/resources";
        final String resourceDirectory = currentProjectDirectory + resourceDirectoryLocalPath;
        final File file = new File(resourceDirectory);
        final FileWriter fileWriter;
        try {
            fileWriter = new FileWriter(file, true);
            fileWriter.write(numberOfGuesses.toString());
            fileWriter.flush();
            fileWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
```



### Creating a Facade for reading and writing files

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./5_read-write-facade.mp4">
</video>

```java

public class ReadWriteFacade {
    private final File file;

    public ReadWriteFacade(String fileName) {
        this(new File(fileName));
    }

    public ReadWriteFacade(File file) {
        this.file = file;
    }

    public void write(String content, boolean append) {
        final FileWriter fileWriter;
        try {
            fileWriter = new FileWriter(file, append);
            fileWriter.write(content);
            fileWriter.flush();
            fileWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String read() {
        final StringBuilder contents = new StringBuilder();
        try {
            final Scanner scanner = new Scanner(this.file);
            while (scanner.hasNextLine()) {
                final String currentLine = scanner.nextLine();
                contents.append(currentLine);
                contents.append("\n");
            }
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        return contents.toString();
    }

    public List<String> toLines() {
        return Arrays.asList(read().split("\n"));
    }

    public String read(int lineNumber) {
        return toLines().get(lineNumber);
    }

    public void replaceLine(int lineNumber, String contentToBeWritten) {
        final StringBuilder result = new StringBuilder();
        final List<String> lines = this.toLines();
        lines.set(lineNumber, contentToBeWritten);
        lines.forEach(line -> result.append(line).append("\n"));
        this.write(result.toString().replaceAll("$\n", ""), false);
    }

    public void replaceAllOccurrences(String stringToReplace, String replacementString) {
        final String contentToWrite = read().replaceAll(stringToReplace, replacementString);
        this.write(contentToWrite, false);
    }
}
```



### Creating a Resources directory Singleton

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./6_directory-reference.mp4">
</video>

```java
public enum DirectoryReference {
    RESOURCES("/src/main/resources");

    private final String directoryPath;

    DirectoryReference(String localDirectoryPath) {
        final String currentProjectDirectory = System.getProperty("user.dir");
        this.directoryPath = currentProjectDirectory + localDirectoryPath;
    }

    public File getFile(String fileName) {
        final File file = new File(this.directoryPath + fileName);
        file.getParentFile().mkdirs();
        try {
            file.createNewFile();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return file;
    }

    public ReadWriteFacade getReadWriteFacade(String fileName) {
        return new ReadWriteFacade(getFile(fileName));
    }
}
```


### Creating a RepositoryInterface

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./7_repository-interface.mp4">
</video>

```java
public interface RepositoryInterface<
        IdType extends Serializable,
        EntityType extends EntityInterface<IdType>> {
    List<EntityType> findAll();

    EntityType add(EntityType entityType);
    EntityType delete(EntityType entityType);

    EntityType updateById(IdType id, EntityType newData);
    default EntityType deleteById(IdType id) {
        return delete(findById(id));
    }
    default EntityType findById(IdType idOfEntityToFind) {
        return findAll()
                .stream()
                .filter(Objects::nonNull)
                .filter(entity -> entity.getId().equals(idOfEntityToFind))
                .findFirst()
                .orElse(null);
    }
}
```




### Creating an AccountRepository

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./8_account-repository.mp4">
</video>

```java
public class AccountRepository implements RepositoryInterface<Long, AccountEntity> {

    private final ReadWriteFacade rw;

    public AccountRepository() {
        final String fileName = getClass().getSimpleName();
        this.rw = DirectoryReference.RESOURCES.getReadWriteFacade("/" + fileName + ".csv");
    }

    @Override
    public List<AccountEntity> findAll() {
        return rw
                .toLines()
                .stream()
                .map(line -> {
                    try {
                        final String[] fields = line.split(",");
                        final Long id = Long.parseLong(fields[0]);
                        final String name = fields[1];
                        return new AccountEntity(id, name);
                    } catch(Throwable t) {
                        return null;
                    }
                })
                .collect(Collectors.toList());
    }

    @Override
    public AccountEntity add(AccountEntity accountEntity) {
        final Long id = accountEntity.getId();
        if (findById(id) != null) {
            final String errorMessage = "An account entity with an id of %s already exists";
            throw new IllegalArgumentException(String.format(errorMessage, id));
        }
        rw.write(accountEntity.toString(), true);
        return findById(id);
    }

    @Override
    public AccountEntity delete(AccountEntity accountEntity) {
        rw.replaceAllOccurrences(accountEntity.toString(), "");
        return findById(accountEntity.getId());
    }

    @Override
    public AccountEntity updateById(Long id, AccountEntity newData) {
        final AccountEntity accountToDelete = findById(id);
        rw.replaceAllOccurrences(accountToDelete.toString(), newData.toString());
        return findById(id);
    }
}
```

### Testing AccountRepository

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./9_testing-repository.mp4">
</video>

```java
public class AccountRepositoryTest {
    @Test
    public void testAddMethod() {
        // given
        final Long id = 15L;
        final String name = "Leon";
        final AccountEntity account = new AccountEntity(id, name);
        final AccountRepository accountRepository = new AccountRepository();

        // when
        final AccountEntity persistedAccount = accountRepository.add(account);

        // then
        Assert.assertEquals(id, persistedAccount.getId());
        Assert.assertEquals(name, persistedAccount.getName());
    }
}
```


### Abstracting AccountRepository to CsvRepositoryInterface


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./10_csvrepository.mp4">
</video>


```java
public interface CsvRepositoryInterface<
        IdType extends Serializable,
        EntityType extends EntityInterface<IdType>>
        extends RepositoryInterface<IdType, EntityType> {


    EntityType parse(String line);

    default ReadWriteFacade getReadWriteFacade() {
        final String fileName = getClass().getSimpleName();
        return DirectoryReference.RESOURCES.getReadWriteFacade("/" + fileName + ".csv");
    }

    @Override
    default List<EntityType> findAll() {
        return getReadWriteFacade()
                .toLines()
                .stream()
                .map(line -> parse(line) )
                .collect(Collectors.toList());
    }

    @Override
    default EntityType add(EntityType accountEntity) {
        final IdType id = accountEntity.getId();
        if (findById(id) != null) {
            final String errorMessage = "An account entity with an id of %s already exists";
            throw new IllegalArgumentException(String.format(errorMessage, id));
        }
        getReadWriteFacade().write(accountEntity.toString(), true);
        return findById(id);
    }

    @Override
    default EntityType delete(EntityType accountEntity) {
        getReadWriteFacade().replaceAllOccurrences(accountEntity.toString(), "");
        return findById(accountEntity.getId());
    }

    @Override
    default EntityType updateById(IdType id, EntityType newData) {
        final EntityType accountToDelete = findById(id);
        getReadWriteFacade().replaceAllOccurrences(accountToDelete.toString(), newData.toString());
        return findById(id);
    }
}
```





### Creating AnsiColor Class


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./11_ansicode.mp4">
</video>


```java
public enum AnsiCode {
    BLACK(30),
    RED(31),
    GREEN(32),
    YELLOW(33),
    BLUE(34),
    PURPLE(35),
    CYAN(36),
    WHITE(37);

    private final String value;

    AnsiCode(Integer ansiNumber) {
        this.value = "\u001B[" + ansiNumber + "m";
    }

    public String getValue() {
        return value;
    }
}
```




### Packaging Classes

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./12_packaging-utils-and-arcade.mp4">
</video>