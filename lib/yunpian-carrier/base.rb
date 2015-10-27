require 'yunpian'

module YunpianCarrier
  class Base
    attr_accessor :settings

    def initialize(settings)
      self.settings = settings
    end

    def deliver!(sms)
      apikey = Yunpian.apikey
      signature = Yunpian.signature
      Yunpian.apikey = settings[:apikey]
      Yunpian.signature = settings[:signature] || ''
      sms.to.each do |to|
        Yunpian.send_to!(to, sms.body)
      end
      Yunpian.apikey = apikey
      Yunpian.signature = signature
    end
  end
end
