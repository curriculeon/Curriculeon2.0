# Creating an Uber Jar with Maven

## Creating a Shaded JAR
* The goals for the Shade Plugin are bound to the package phase in the build lifecycle.

## Configuring your Shade Plugin
* Add this body to your `pom.xml` to ensure the `mvn package` command will generate an uber jar upon build.
* Execute the command below to skip tests upon packaging.
  * `mvn package -Dmaven.test.skip=true`


```xml
<project>
  ...
  <build>
    <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <version>3.1.1</version>
        <configuration>
          <!-- put your configurations here -->
        </configuration>
        <executions>
          <execution>
            <phase>package</phase>
            <goals>
              <goal>shade</goal>
            </goals>
          </execution>
        </executions>
      </plugin>
    </plugins>
  </build>
  ...
</project>
```


## Creating Uber Jar using Shade plugin
* From the root directory of the project, execute the command below to generate a `.jar` of the project
  * `mvn package`
* Execute the command below to skip tests upon packaging.
  * `mvn package -Dmaven.test.skip=true`


## Checking the contents of a `.jar` File
* Execute the command below to echo the contents of the newly created `.jar` file.
  * `jar tf jar-name`