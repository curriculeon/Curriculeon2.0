# Jekyll

<!-- https://www.smashingmagazine.com/2016/02/content-modeling-with-jekyll/#generating-pages-from-our-objects -->

## Themes

### Using Prebuilt Themes
* Navigate to `rubygems.org/search`
* Fetch theme name from `README.md`
    * `theme: name-of-desired-theme`
* Fetch the list of layout names from the `_layouts` directory
    * ensure that any use of `layout` field in _front-matter_ reflects the desired 
* Ensure `Gemfile` includes the Jekyll theme dependency
    * `gem "name-of-desired-theme"`
* Ensure `Jekyll` fetches the newly included dependency
    * `bundle install`
* Ensure `_config.yml` declares the Jekyll theme dependency.
    * `theme: name-of-desired-theme`

