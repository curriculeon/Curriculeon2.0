---
layout: code-quiz
---


# Quiz

```java
public class StringArrays {
    public static void main(String[] args) {
        String result = "";
        String[] blues = "blue, light-blue, dark-blue, sky-blue, sapphire-blue".split(", ");
        String[] greens = "green, light-green, dark-green, forest-green, emerald-green".split(", ");
        String[] reds = "red, light-red, dark-red, scarlet-red, ruby-red".split(", ");
        String[][] colors = {blues, greens, reds};
        for(String[] colorArray : colors) {
            String baseColorType = colorArray[0];
            result += "\nThe current base color is = " + baseColorType;

            for(String color : colorArray) {
                result += "\n\tThe current color is = " + color;
            }
        }
        System.out.println(result);
    }
}
```




---
#primaryColor: steelblue
#shuffleQuestions: true
shuffleAnswers: false
---

### What is the type of `result`?
- [X] `String`
- [ ] `String[]`
- [ ] `String[][]`

### What is the type of `blues`?
- [ ] `String`
- [X] `String[]`
- [ ] `String[][]`

### What is the type of `colors`?
- [ ] `String`
- [ ] `String[]`
- [X] `String[][]`



### What is the value of `blues`?
- [ ] `"blue, light-blue, dark-blue, sky-blue, sapphire-blue"`
- [ ] `"green, light-green, dark-green, forest-green, emerald-green"`
- [ ] `"red, light-red, dark-red, scarlet-red, ruby-red"`
- [X] `["blue", "light-blue", "dark-blue", "sky-blue", "sapphire-blue"]`
- [ ] `["green", "light-green", "dark-green", "forest-green", "emerald-green"]`
- [ ] `["red", "light-red", "dark-red", "scarlet-red", "ruby-red"]`

### What is the value of `colors[0]`?
- [ ] `"blue, light-blue, dark-blue, sky-blue, sapphire-blue"`
- [ ] `"green, light-green, dark-green, forest-green, emerald-green"`
- [ ] `"red, light-red, dark-red, scarlet-red, ruby-red"`
- [X] `["blue", "light-blue", "dark-blue", "sky-blue", "sapphire-blue"]`
- [ ] `["green", "light-green", "dark-green", "forest-green", "emerald-green"]`
- [ ] `["red", "light-red", "dark-red", "scarlet-red", "ruby-red"]`

### What is the value of `greens`?
- [ ] `"blue, light-blue, dark-blue, sky-blue, sapphire-blue"`
- [ ] `"green, light-green, dark-green, forest-green, emerald-green"`
- [ ] `"red, light-red, dark-red, scarlet-red, ruby-red"`
- [ ] `["blue", "light-blue", "dark-blue", "sky-blue", "sapphire-blue"]`
- [X] `["green", "light-green", "dark-green", "forest-green", "emerald-green"]`
- [ ] `["red", "light-red", "dark-red", "scarlet-red", "ruby-red"]`

### What is the value of `colors[1]`?
- [ ] `"blue, light-blue, dark-blue, sky-blue, sapphire-blue"`
- [ ] `"green, light-green, dark-green, forest-green, emerald-green"`
- [ ] `"red, light-red, dark-red, scarlet-red, ruby-red"`
- [ ] `["blue", "light-blue", "dark-blue", "sky-blue", "sapphire-blue"]`
- [X] `["green", "light-green", "dark-green", "forest-green", "emerald-green"]`
- [ ] `["red", "light-red", "dark-red", "scarlet-red", "ruby-red"]`

### What is the value of `reds`?
- [ ] `"blue, light-blue, dark-blue, sky-blue, sapphire-blue"`
- [ ] `"green, light-green, dark-green, forest-green, emerald-green"`
- [ ] `"red, light-red, dark-red, scarlet-red, ruby-red"`
- [ ] `["blue", "light-blue", "dark-blue", "sky-blue", "sapphire-blue"]`
- [ ] `["green", "light-green", "dark-green", "forest-green", "emerald-green"]`
- [X] `["red", "light-red", "dark-red", "scarlet-red", "ruby-red"]`

### What is the value of `colors[2]`?
- [ ] `"blue, light-blue, dark-blue, sky-blue, sapphire-blue"`
- [ ] `"green, light-green, dark-green, forest-green, emerald-green"`
- [ ] `"red, light-red, dark-red, scarlet-red, ruby-red"`
- [ ] `["blue", "light-blue", "dark-blue", "sky-blue", "sapphire-blue"]`
- [ ] `["green", "light-green", "dark-green", "forest-green", "emerald-green"]`
- [X] `["red", "light-red", "dark-red", "scarlet-red", "ruby-red"]`





### What is the value of `blues[0]`?
- [X] `"blue"`
- [ ] `"green"`
- [ ] `"red"`
- [ ] `["blue"]`
- [ ] `["green"]`
- [ ] `["red"]`

### What is the value of `blues[1]`?
- [X] `"light-blue"`
- [ ] `"light-green"`
- [ ] `"light-red"`


### What is the value of `colors[0][0]`?
- [X] `"blue"`
- [ ] `"green"`
- [ ] `"red"`
- [ ] `["blue"]`
- [ ] `["green"]`
- [ ] `["red"]`


### What is the value of `colors[0][1]`?
- [X] `"light-blue"`
- [ ] `"light-green"`
- [ ] `"light-red"`





### What is the value of `greens[0]`?
- [ ] `"blue"`
- [X] `"green"`
- [ ] `"red"`
- [ ] `["blue"]`
- [ ] `["green"]`
- [ ] `["red"]`

### What is the value of `greens[1]`?
- [ ] `"light-blue"`
- [X] `"light-green"`
- [ ] `"light-red"`

### What is the value of `colors[1][0]`?
- [ ] `"blue"`
- [X] `"green"`
- [ ] `"red"`
- [ ] `["blue"]`
- [ ] `["green"]`
- [ ] `["red"]`


### What is the value of `colors[1][1]`?
- [ ] `"light-blue"`
- [X] `"light-green"`
- [ ] `"light-red"`








### What is the value of `reds[0]`?
- [ ] `"blue"`
- [ ] `"green"`
- [X] `"red"`
- [ ] `["blue"]`
- [ ] `["green"]`
- [ ] `["red"]`

### What is the value of `reds[1]`?
- [ ] `"light-blue"`
- [ ] `"light-green"`
- [X] `"light-red"`


### What is the value of `colors[2][0]`?
- [ ] `"blue"`
- [ ] `"green"`
- [X] `"red"`
- [ ] `["blue"]`
- [ ] `["green"]`
- [ ] `["red"]`


### What is the value of `colors[2][1]`?
- [ ] `"light-blue"`
- [ ] `"light-green"`
- [X] `"light-red"`






### What is the value of `result`?
- [X] 
    ```      
    "The current base color is = blue
        The current color is = blue
        The current color is = light-blue
        The current color is = dark-blue
        The current color is = sky-blue
        The current color is = sapphire-blue
    The current base color is = green
        The current color is = green
        The current color is = light-green
        The current color is = dark-green
        The current color is = forest-green
        The current color is = emerald-green
    The current base color is = red,
        The current color is = red,
        The current color is = light-red,
        The current color is = dark-red,
        The current color is = scarlet-red,
        The current color is = ruby-red"
    ```
- [ ] 
    ```        
    "The current base color is = blue
        The current color is = light-blue
        The current color is = dark-blue
        The current color is = sky-blue
        The current color is = sapphire-blue
    The current base color is = green
        The current color is = light-green
        The current color is = dark-green
        The current color is = forest-green
        The current color is = emerald-green
    The current base color is = red,
        The current color is = light-red,
        The current color is = dark-red,
        The current color is = scarlet-red,
        The current color is = ruby-red"
    ```
- [ ] 
    ```        
    "The current base color is = blue
    The current color is = blue
    The current color is = light-blue
    The current color is = dark-blue
    The current color is = sky-blue
    The current color is = sapphire-blue
    The current base color is = green
    The current color is = green
    The current color is = light-green
    The current color is = dark-green
    The current color is = forest-green
    The current color is = emerald-green
    The current base color is = red,
    The current color is = red,
    The current color is = light-red,
    The current color is = dark-red,
    The current color is = scarlet-red,
    The current color is = ruby-red"
    ```
- [ ]
    ```            
    "The current color is = blue
    The current color is = light-blue
    The current color is = dark-blue
    The current color is = sky-blue
    The current color is = sapphire-blue

    The current color is = green
    The current color is = light-green
    The current color is = dark-green
    The current color is = forest-green
    The current color is = emerald-green

    The current color is = red,
    The current color is = light-red,
    The current color is = dark-red,
    The current color is = scarlet-red,
    The current color is = ruby-red"
    ```