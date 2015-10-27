# yunpian-carrier

[![Build Status](https://api.travis-ci.org/emn178/yunpian-carrier.png)](https://travis-ci.org/emn178/yunpian-carrier)
[![Coverage Status](https://coveralls.io/repos/emn178/yunpian-carrier/badge.svg?branch=master)](https://coveralls.io/r/emn178/yunpian-carrier?branch=master)

An [sms_carrier](https://github.com/emn178/sms_carrier) delivery method for Yunpian(云片) SMS service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yunpian-carrier'
```

And then execute:

    bundle

Or install it yourself as:

    gem install yunpian-carrier

## Usage

Set up delivery method and Yunpian settings in you rails config, eg. `config/environments/production.rb`
```Ruby
config.sms_carrier.delivery_method = :yunpian
config.sms_carrier.yunpian_settings = {
  :apikey => 'YOUR YUNPIAN APIKEY',

  # prepend to SMS body, you can also leave it empty and add manually.
  :signature => 'YOUR YUNPIAN SIGNATURE'
}
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/yunpian-carrier  
Author: emn178@gmail.com
