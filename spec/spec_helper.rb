require 'simplecov'
require 'coveralls'

SimpleCov.add_filter "/spec/"

if ENV["COVERAGE"]
  SimpleCov.start
elsif ENV["COVERALLS"]
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  Coveralls.wear!
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'yunpian-carrier'
require 'rspec/its'
require 'ostruct'

SmsCarrier::Base.delivery_method = :yunpian
SmsCarrier::Base.yunpian_settings = {
  :apikey => 'APIKEY',
  :signature => '【SIGNATURE】'
}

Yunpian.apikey = 'OTHER_APIKEY'
Yunpian.signature = '【OTHER_SIGNATURE】'
