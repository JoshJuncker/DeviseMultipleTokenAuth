# DeviseMultipleTokenAuth

> If you like to use Devise, but wish it had an easy token authentication system that handles a user logging in from multiple devices, DeviseMultipleTokenAuth is for you.

Dependencies
------
######Devise User
DeviseMultipleTokenAuth depends on devise.  Currently it has deep hooks into the User model.  Thus, first add devise to your gem file and install it, and then make sure you create the User model at app/models/user.rb.  If you don't already have that model, you can use devise's generator shown below.

```ruby
rails generate devise User
```

Installation
------

######Add this line to your application's Gemfile:

    gem 'devise_multiple_token_auth'

######And then execute:

    bundle install

######Run the generator

    rails g devise_multiple_token_auth:install
This will add an initializer at
  config/initializers/devise_multiple_token_auth.rb
and a new migration called
  create_devise_multiple_token_auth_devices.rb
It will also add devise_token_authenticatable to app/models/user.rb

######Run the migrations
    rake db:migrate

Example API Usage
------

######How to login
Send an http post with content-type 'application/json' to /devise_multiple_token_auth/auth/login using the following params: :email or :username and :password

If successful, you'll get back the following json

```json
{
  "auth_token": "a1afa8c4622af2d373d042aa43de5f26"
}
```

Set the client's Authorization header to the value of the returned auth_token

```ruby
Authorization: "my_shiny_new_auth_token_string_identifier"
```

######How to enforce authentication
Add the following code to any controller to enforce token authentication

```ruby
before_filter :authenticate_token_user!
```

######How to logout
Send an http delete with content-type 'application/json', and Authorization 'your_shiny_token_that_you_received_from_logging_in' to /devise_multiple_token_auth/auth/logout

If successful, you will receive a 204 with no body

#####Want to do your own login/logout?  Do something like the following in your auth controller

```ruby
respond_to :json
before_filter :authenticate_token_user!
skip_filter :authenticate_token_user!, only: [:login]

def login
  email = params[:email] || params[:username]
  password = params[:password]
  user = User.find_by(email: email)
  if user.present? && user.valid_password?(params[:password])
    device = user.create_device
    render json: {auth_token: device.auth_token}, status: :ok
  else
    render json: {error: 'Invalid credentials', code: '401'}, status: :unauthorized
  end
end

def logout
  @device.destroy
  head :no_content
end
```

#####To add push notification structure to devices
Install the migration to add :platform and :push_token to the devices table

    rails g devise_multiple_token_auth:add_push_notification_functionality

Update the current users device with an auth token by sending a PUT to /devise_multiple_token_auth/update_push_token with the params: :push_token and :platform.  Platform accepts any of these three values: ios, android, windowsphone.

Credits
-------

DeviseMultipleTokenAuth is written and maintained by Josh Juncker and friends.

Currently funded and maintained by [Verdad Technologies](http://verdadtech.com)


## Contributing

1. Fork it ( https://github.com/joshjuncker/DeviseMultipleTokenAuth/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
