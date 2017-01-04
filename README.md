# Sinatra User Persistence Awesome API (SUPAAPI)

_pronounced as_ "super API"  

Available at: <http://holiday-extras-api-tomy8s.herokuapp.com/>  

## What is it?

It is a simple API, built in Ruby on the Sinatra framework. The API persists user credentials through its lifetime. Users can be created, read, updates and deleted as outlined below.

## How do I install it?  

You will need Ruby 2.3.1 (similar versions may work) to run the app and bundler for setup.  

1. Clone the repo and run ``` bundle install ```.
2. Run the app using ```ruby lib/api.rb ```.
3. By default the app runs at ``` http://localhost:4567 ```.

## How do I create a user?  

example:  
    The server is running at ``` http://localhost:4567 ```  
    The user's forename: John  
    The user's name: smith  
    The user's email: john.smith@example.com

1. Start the server as above.  
2. Enter ``` http://localhost:4567/new?forename=John&surname=Smith&email=john.smith@example.com ```.  
3. An ID and creation timestamp will be added by the server.  

## How do I view a user?

To view the last added user:  
``` http://localhost:4567/get ```  

To view a user with a known ID (in this example 13):  
``` http://localhost:4567/get?id=13 ```  

User information in returned in JSON format.  

## How do I update a user's details?  

You will need to know the user's ID (in this example 13):  
``` http://localhost:4567/update?id=13&forename=new_forename&surname=new_surname&email=new_email ```  
note: you need only include details to change, other information will not be affected.  

## How do I delete a user?

You will need to know the user's ID (in this example 13):  
``` http://localhost:4567/delete?id=13 ```
