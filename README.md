# README

Things you may want to cover:

* Ruby version

    ruby 3.0.1
    
* Rails version

    rails 6.1.4   

* Database setup

    - Postgresql
    
    - rails db:setup
    
    - rails db:migrate

* Run server

    - rails s
    
* Api endpoint

    - url: api/v1/tickets
    
    - method: post
    
    - params: 
    
        {
        
            "user_id": 1,
            
            "title": "test title",
            
            "tags": ["tag1", "tag2"]
            
        }
        
    - response:
    
        - success(201)
    
            {
            
                "created_ticket": {
                
                    "user_id": 1,
                            
                    "title": "test title",
                            
                    "tags": ["tag1", "tag2"]
                
                }
            
            }
            
        - Failed(422)
        
            {
            
                errors: ['...']
            
            }
            
* Webhook url

    https://webhook.site/#!/a3418478-a628-4a76-a1a6-8caedfe26908
    
* Rspec

    rspec spec

* Rubocop

    rubocop app