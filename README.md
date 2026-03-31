* Welcome to the root of the Curriculum online resources assets 
* Site is hosted at the link below are hosted at the link below
    * [https://curriculeon.github.io/Curriculeon/](https://curriculeon.github.io/Curriculeon/)


# Development Notes

## Viewing the application locally

### Installing Jekyll
* Ensure Ruby is installed.
    * `ruby -v`
* Ensure Gem is installed.
    * `gem -v`
* Install Jekyll.
    * `gem install jekyll bundler`
* Ensure Jekyll was installed successfully.
    * `jekyll -v`

### Running Application

* From the root directory of the project execute the commands below
    * `bundle install`
    * `bundle update --bundler`
    * `bundle update faraday`
    * `bundle exec jekyll serve --watch`
* The application should serve on [`localhost:4000`](http://localhost:4000/) by default.

* Execute the command below to kill anything running on [`localhost:4000`](http://localhost:4000/)

```bash
kill -kill `lsof -t -i tcp:4000`
```

<hr/><hr/>

## Topic and Lecture Naming
* Topics and lectures should be named after the respective topic they present.
* Topics and lectures **should not** be named after a particular date, time, cohort, or any other temporal entity.
    * This prevents easy programmatic reuse of content.

## Slide Style
* Please ensure that lecture slides are written in a manner that allows any technically competent person to give the presentation.
* Slides should not include personalized notes
* Slides should not enforce a particular presentation-style

<hr/><hr/>

## Theme Editing

### Reveal Theme Editing
* Theme editing should take place by modifying or adding to the `/resources/revealjs/css` directory.


### Jekyll Theme Editing
* Theme editing should take place by creating a `name-of-theme.html` in the `/layouts` directory.
* _Jekyll liquid themes_ can be injected by declaring them at the top of a respective `.md` file as demonstrated below.


```jekyll
---
name-of-theme.html
---

## Welcome to my markdown example
Below is an example of a list within the example
* This is is the first list-item in the example
* This is is the last list-item in the example
```


<hr/><hr/>

## Integrating Additional Technologies
* The project has been structured to ensure frameworks which transpile `Markdown` can be easily integrated by importing them into the project’s `/resources` directory.
    * Currently, this directory just `revealjs`, `quizdown.js`, `jquery`, and `darkreader`.






