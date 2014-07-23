# Snom

Ruby client for the Snom service. Additional information for the [Snom API] [snom-api].

## Installation

Add this line to your application's Gemfile:

    gem 'snom'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snom

## Usage

```ruby
snom = Snom.new('username', 'password')

snow.check_device('mac_address')
snow.register_device('mac_address')
snow.deregister_device('mac_address')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/snom/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


[snom-api]: http://wiki.snom.com/Features/Auto_Provisioning/Redirection/XMLRPC#redirect.deregisterPhoneList  "Snom API"
