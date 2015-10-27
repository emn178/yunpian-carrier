require "sms_carrier"
require "yunpian-carrier/version"
require "yunpian-carrier/base"

module YunpianCarrier
  SmsCarrier::Base.add_delivery_method :yunpian, Base
end
