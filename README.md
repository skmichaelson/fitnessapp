# App Academy Final Project #
### A clone of myfitnesspal (http://www.myfitnesspal.com/). ###

[![Code Climate](https://codeclimate.com/github/skmichaelson/fitnessapp.png)](https://codeclimate.com/github/skmichaelson/fitnessapp)

Features:
* Comprehensive walk-through with a pre-populated demo account
* Food database uses data imported from the USDA
* Appropriate redirects for users who are not logged in
* Calculates BMR and calorie goals based on user-provided attributes
* Tracks calorie intake and displays calories remaining
* Allows user interaction, including friendships, messages, and a newsfeed
* Archived food diary entries are searchable

Skills:
* has_one, belongs_to, has_many, and has_many :through relationships
* Secure password digest storage using BCrypt
* before_filter on controllers
* before_validation on models
* Testing with RSPEC
* Semantic HTML
* CSS

TODO:
* Reduce bloat and complexity to bump code climate score
* Use Backbone.js for adding foods and searching for foods
* Create graphs for user reports
* Allow users to have favorite foods
* Build models for recipes and custom meals