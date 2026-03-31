---
layout: code-quiz
---


# Quiz

```java
public class StringArrays {
    public static void main(String[] args) {
        String[] stringArray = "The quick brown fox".split(" ");

        int numberOfElements = stringArray.length;
        int lastIndex = numberOfElements - 1;
        int middleIndex = lastIndex / 2;

        String middleElement = stringArray[middleIndex];
        String[] middleElementStrings = middleElement.split("");
        char[] middleElementChars = middleElement.toCharArray();
        String middleElementStringsAsString = Arrays.toString(middleElementStrings);
        String middleElementCharsAsString = Arrays.toString(middleElementChars);
        boolean areSameValue = middleElementStringsAsString.equals(middleElementCharsAsString);

        System.out.println(areSameValue);
    }
}
```




---
#primaryColor: steelblue
#shuffleQuestions: true
shuffleAnswers: true
---



### What is the value of `stringArray[0]`?

- [X] `"The"`
- [ ] `"Quick"`
- [ ] `"Jumps"`
- [ ] `"the"`
- [ ] `"quick"`
- [ ] `"jumps"`




### What is the value of `stringArray[1]`?

- [ ] `"The"`
- [ ] `"Quick"`
- [ ] `"Jumps"`
- [ ] `"the"`
- [X] `"quick"`
- [ ] `"jumps"`

### What is the value of `numberOfElements`?
- [ ] `1.5`
- [X] `4`
- [ ] `2`
- [ ] `1`
- [ ] `3`

### What is the value of `lastIndex`?
- [ ] `1.5`
- [ ] `4`
- [ ] `2`
- [ ] `1`
- [X] `3`

### What is the value of `middleIndex`?
- [ ] `1.5`
- [ ] `4`
- [ ] `2`
- [X] `1`
- [ ] `3`


### What is the value of `middleElement`?
- [X] `"quick"`
- [ ] `["q", "u", "i", "c", "k"]`
- [ ] `['q', 'u', 'i', 'c', 'k']`
- [ ] `"[q, u, i, c, k]"`
- [ ] `true`
- [ ] `false`

### What is the value of `middleElementStrings`?
- [ ] `"quick"`
- [X] `["q", "u", "i", "c", "k"]`
- [ ] `['q', 'u', 'i', 'c', 'k']`
- [ ] `"[q, u, i, c, k]"`
- [ ] `true`
- [ ] `false`

### What is the value of `middleElementChars`?
- [ ] `"quick"`
- [ ] `["q", "u", "i", "c", "k"]`
- [X] `['q', 'u', 'i', 'c', 'k']`
- [ ] `"[q, u, i, c, k]"`
- [ ] `true`
- [ ] `false`

### What is the value of `middleElementCharsAsString`?
- [ ] `"quick"`
- [ ] `["q", "u", "i", "c", "k"]`
- [ ] `['q', 'u', 'i', 'c', 'k']`
- [X] `"[q, u, i, c, k]"`
- [ ] `true`
- [ ] `false`

### What is the value of `areSameValue`?
- [X] `true`
- [ ] `false`