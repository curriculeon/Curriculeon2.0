# Jekyll

### Creating a Blog

* `jekyll new some-blog`
* `cd some-blog`
* `bundle exec jekyll serve`
    * Every subsequent serve can be ran by executing `jekyll serve`

### Project Structure
* `_site`
    * the directory that is transpiled to HTML from the project; the finished build.
* `_config.yml`
    * authorship, description, plugins, theme (`minima` by default)
    * default front matter definition
    * View the sample `_config.yml` below

```
theme: jekyll-theme-cayman
defaults:
  -
    scope:
      path: ""
    values:
      layout: post
```

* `Gemfile`
    * stores all of the dependencies for Ruby
    * also includes the theme we're using on the site.

### Front Matter
* Meta data placed at the top of `.md` files

```
---
layout:post
title:"new Title"
date: 2020-11-18 18:43:23 -0700
categories: jekyll update
--
```