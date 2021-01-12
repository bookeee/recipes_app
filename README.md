# README


### Install all dependencies:

    bundle install 

### Run application: 

    rails s 

### Tests:

    rspec 

results:

    Finished in 0.0874 seconds (files took 2.68 seconds to load)
    14 examples, 0 failures
    
    Coverage report generated for RSpec to /home/en/Desktop/tt/apps/mrl_spn/recipes_app/coverage. 74 / 86 LOC (86.05%) covered.


### Rubocop:

    rubocop

### Recipes page

    http://localhost:3000/recipes

### Recipe page    

    http://localhost:3000/recipes/4dT8tcb6ukGSIg2YyuGEOm


### curls

curl 1 (all recipes):

    curl -H 'Accept: application/vnd.contentful.delivery.v1+json' -H "Authorization: Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c" https://cdn.contentful.com/spaces/kk2bw5ojx476/environments/master/entries?content_type=recipe

curl 2 (specific recipe):

    curl -H 'Accept: application/vnd.contentful.delivery.v1+json' -H "Authorization: Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c" https://cdn.contentful.com/spaces/kk2bw5ojx476/environments/master/entries?sys.id=4dT8tcb6ukGSIg2YyuGEOm

curl 3 (recipe with incorrect id)

    curl -H 'Accept: application/vnd.contentful.delivery.v1+json' -H "Authorization: Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c" https://cdn.contentful.com/spaces/kk2bw5ojx476/environments/master/entries?sys.id=11111111111111111111111111111111111111111


### pictures 

https://postimg.cc/v1tb5cyc

https://postimg.cc/WFpj8TpS



## Task Description

Overview

We are providing you with an API key and Space ID to an API for Marley Spoon recipes on Contentful (Content Delivery API). All the information necessary will be available in Contentul's documentation. Your challenge is to write a small application to consume the data from this API and display it.

Implementation requirements:

Create a sample web application that uses the Contentful API to fetch data
You can choose to write the application in Ruby and any of its frameworks
There should be 2 views: 1) a list view of all the recipes & 2) A detail view of a recipe
When clicking on a recipe on the list view, you should then show the detailed view
The application should be as production-ready as possible, but no deployment is needed
Data to render

List view

Display a preview of all recipes, including:
Title
Image
Details View

Display all the data for a recipe:
Title
Image
List of Tags
Description
Chef Name
Deliverables

Please send us a link to a hosted repository with your code. It can be hosted anywere (ex: Github, Gitlab, ...) as long as you provide us access. You should include all the code necessary to run the app and documentation on how to do it.

Credentials

The Space ID is:  kk2bw5ojx476
The Environment ID (if necessary) is:  master
The Access Token is:  7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c

