# DeviseMultipleTokenAuth

> If you like to use Devise, but wish it had an easy token authentication system that handles a user logging in from multiple devices, DeviseMultipleTokenAuth is for you.


Installation
------

######Add this line to your application's Gemfile:

    gem 'devise_multiple_token_auth'

######And then execute:

    bundle install

######Or install it yourself as:

    gem install devise_multiple_token_auth

######Setup

Make sure your user model is defined in
    app/models/user.rb
and called User.

######Run the generator

    rails g devise_multiple_token_auth:install
This will add an initializer at
  config/initializers/devise_multiple_token_auth.rb
and a new migration called
  create_devise_multiple_token_auth_devices.rb

######Run the migrations
    rake db:migrate

Example API Usage
------

API login example using the new user method 'create_device'

```ruby
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
```

API logout example using the @device variable that is set
```ruby
def logout
  @device.destroy
  head :no_content
end
```

Set the client's Authorization header to the value of the returned auth_token

```ruby
Authorization: "my_shiny_new_auth_token_string_identifier"
```

Then add the following code to any controller to enforce token authentication

```ruby
before_filter :authenticate_token_user!
```


Credits
-------

DeviseMultipleTokenAuth is written and maintaned by Josh Juncker and friends.

Currently funded and maintained by [Verdad Technologies](http://verdadtech.com)


## Contributing

1. Fork it ( https://github.com/joshjuncker/DeviseMultipleTokenAuth/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
