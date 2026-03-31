# Door to Freedom



-
## Location
* You are a prisoner in a room with
    * 2 indistinguishable doors
        * One of the doors will lead you to certain freedom.
        * One of the doors will lead you to certain doom.
    * 2 indistinguishable robot-guards guarding the door
        * One of the guards always tells the truth.
        * One of the guards always tells lies.






-
## Objective
* You must enter one of these doors, but you can only ask a single question to a single guard.
    * the question cannot contain any of the following _conjunctions_:
        * `for`, `and`, `nor`, `but`, `or`, `yet`, `so`
    * the question _should_ contain several _helping verbs_ such as:
        * `Am`, `is`, `are`, `was` `were`, `being`, `been`, `be`
        * `Have`, `has`, `had`, `do`, `does`, `did`, `will`, `would`, `shall`, `should`.
        * `may`, `might`, `must`, `can`, `could`


-
## Begin Solving
* **What question must you ask to ensure that you are lead to certain freedom**?






-
-
## How to solve
* To answer this question, you must have a decent understanding of _langauge_ and _grammar_
* We must first establish 5 parts of speech: `noun`, `verb`, `helping verb`, `predicate`, `subject`


-
## Nouns
* A _noun_ is a word used to identify a class of people, places, or things.
* the _subject_ of a sentence is always a _noun_.



-
## Verbs
* A _verb_ is used to describe an action, state, or occurrence
* The _main part_ of the predicate.


-
## Helping Verbs
* A _helping verb_ is a verb that is used to help better describe another verb.
* A _helping verb_ is an _inflected form_ of the phrase `to have` or `to be`
* The _form_ of _inflection_ of a verb is dependent on the _tense_ of the verb.
    * `past tense` - He _rowed_ the boat.
    * `past participle` - He _has rowed_ the boat.
    * `present participle` -  He _is rowing_ the boat.





-
-
## Predicates
* part of speech that says what a subject _is doing_.
    * We `are questioning`.
    * He `is baffled`.
    * They `were asking`.
    * He `has answered`.
<br>
<img src="./subject-predicate.jpg">



-
## Predicates in Programming
* Any _function_, _method_, or _operation_ that is prefixed with a _helping verb_ implies a `true` or `false` _return type_.
* Consider the implications of the namings of the following operations:
    * `isFreedom()`
    * `hasLied()`
    * `canTellTheTruth()`
    * `wasCorrectDoor()`





-
## Nesting Predicates
* A predicate can be _nested_ in another predicate to make a single complete sentence without run-on.
* Consider how much _truth_ can be derived from each of these single questions:
    * Will Peter `be running` around the park Brian `is camping` in if Stewie `is going` to the store?
    * Could Martin `be telling` the truth about the things Luther `was saying` about the `dialogue had` by Malcolm?
    * If you `were to ask` your mother `should you drive` to the grocery store, `would she say` yes?













-
-
# Solution


-
## Question to Freedom

```
"If I were to ask the other guard,
    'Does the right door lead to freedom?'
what would the other guard say?"
```



-
## Each Respective Reponse
* If you ask the liar what the truther would say, then the liar will lie about it and make it a lie.
* If you ask the truther what the liar would say, then the truther will tell the truth about the liar; making their response a lie anyway.




-
## Both Responses
* In both cases, the information being communicated is a lie.
* A lie about the truth, or the truth about a lie is ultimately just a lie.





-
## Conjecture
* Therefore, whichever door they say the other one would select, must be the opposite door of what you should select.
* The truther would say "The liar would tell you to take the left door to freedom"
    * Which means you should take the right
* The liar would say "The truther would tell you to take the left door to freedom"
    * Which also means you should take the right door.