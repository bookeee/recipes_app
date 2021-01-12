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
