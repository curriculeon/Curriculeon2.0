---
layout: code-quiz
---


# Quiz

```java
public class StringArrays {
    public static void main(String[] args) {
        String[] stringArray1 = "The quick brown fox jumps".split(" ");
        String[] stringArray2 = new String[]{"The", "Quick", "Brown", "Fox", "Jumps"};
        int numberOfElements = stringArray1.length;
        int lastIndex = numberOfElements - 1;
        int middleIndex = lastIndex / 2;

        String result;
        if(isEqual(stringArray1, stringArray2)) {
            String[] subArray1 = Arrays.copyOfRange(stringArray1, middleIndex, numberOfElements);
            String[] subArray2 = Arrays.copyOfRange(stringArray2, 0, middleIndex);
            String subArray1AsString = Arrays.toString(subArray1);
            String subArray2AsString = Arrays.toString(subArray2);
            result = subArray1AsString + subArray2AsString;
        } else {
            String[] subArray = Arrays.copyOfRange(stringArray1, middleIndex, numberOfElements);
            result = Arrays.toString(subArray);
        }

        System.out.println(result);
    }

    private static boolean isEqual(String[] array1, String[] array2) {
        String array1AsString = Arrays.toString(array1);
        String array2AsString = Arrays.toString(array2);
        boolean areStringsEqual = array1AsString.equalsIgnoreCase(array2AsString);
        return areStringsEqual;
    }
}
```




---
#primaryColor: steelblue
#shuffleQuestions: true
shuffleAnswers: true
---



### What is the value of `stringArray1[0]`?

- [X] `"The"`
- [ ] `"Quick"`
- [ ] `"Jumps"`
- [ ] `"the"`
- [ ] `"quick"`
- [ ] `"jumps"`



### What is the value of `stringArray2[0]`?

- [X] `"The"`
- [ ] `"Quick"`
- [ ] `"Jumps"`
- [ ] `"the"`
- [ ] `"quick"`
- [ ] `"jumps"`



### What is the value of `stringArray1[1]`?

- [ ] `"The"`
- [ ] `"Quick"`
- [ ] `"Jumps"`
- [ ] `"the"`
- [X] `"quick"`
- [ ] `"jumps"`

### What is the value of `stringArray2[1]`?

- [ ] `"The"`
- [X] `"Quick"`
- [ ] `"Jumps"`
- [ ] `"the"`
- [ ] `"quick"`
- [ ] `"jumps"`


### What is the value of `numberOfElements`?
- [X] `5`
- [ ] `4`
- [ ] `2`
- [ ] `2.5`
- [ ] `3`

### What is the value of `lastIndex`?
- [ ] `5`
- [X] `4`
- [ ] `2`
- [ ] `2.5`
- [ ] `3`

### What is the value of `middleIndex`?
- [ ] `5`
- [ ] `4`
- [X] `2`
- [ ] `2.5`
- [ ] `3`


### What is the value of `isEqual(stringArray1, stringArray2)`?
- [X] `true`
- [ ] `false`

### What is the value of `subArray`?
- [ ] `["brown", "fox", "jumps"]`
- [X] `Undefined`; _never declared_
- [ ] `null`; _never assigned_
- [ ] `[]`; _never populated_
- [ ] `""`; _an empty string_



### What is the type of `subArray1`?
- [ ] `String`
- [X] `String[]`
- [ ] `int`
- [ ] `int[]`

### What is the value of `subArray1`?
- [X] `["brown", "fox", "jumps"]`
- [ ] `"[brown, fox, jumps]"`
- [ ] `["The", "quick"]`
- [ ] `"[The, quick]"`

### What is the value of `subArray2`?
- [ ] `["brown", "fox", "jumps"]`
- [ ] `"[brown, fox, jumps]"`
- [X] `["The", "quick"]`
- [ ] `"[The, quick]"`

### What is the type of `subArray1AsString`?
- [X] `String`
- [ ] `String[]`
- [ ] `int`
- [ ] `int[]`

### What is the value of `subArray1AsString`?
- [ ] `["brown", "fox", "jumps"]`
- [X] `"[brown, fox, jumps]"`
- [ ] `["The", "quick"]`
- [ ] `"[The, quick]"`

### What is the value of `subArray2AsString`?
- [ ] `["brown", "fox", "jumps"]`
- [ ] `"[brown, fox, jumps]"`
- [ ] `["The", "quick"]`
- [X] `"[The, quick]"`

### What is the type of `result`?
- [X] `String`
- [ ] `String[]`
- [ ] `int`
- [ ] `int[]`

### What is the value of `result`?
- [X] `"[brown, fox, jumps][The, Quick]"`
- [ ] `"[brown, fox, jumps]", "[The, Quick]"`
- [ ] `["brown", "fox", "jumps"]["The", "Quick"]`
- [ ] `["brown", "fox", "jumps", "The", "Quick"]`
- [ ] `"[brown, fox, jumps, The, Quick]"`
