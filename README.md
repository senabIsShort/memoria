# README

This is a first time project using **Ruby on Rails**.  
The objective is to have a blog accessible to any readers,
but with a limited number of writers (mainly the owner).  

## Development

### Getting the server started

Use `bin/rails server`

### Creating a writer

Open up the Rails console using `bin/rails console`.  

Then, create a new user following this template :  
> new_user = User.new(email: "tester@email.com", username: "Tester", password: "testedpassword", admin: "true")

Don't forget to save the changes using :
> new_user.save!

The `admin` argument allows you to decide if you want to give the user rights to create, edit and delete posts as well as deleting comments on a post.
