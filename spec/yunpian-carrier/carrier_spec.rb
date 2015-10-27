require 'spec_helper'

describe YunpianCarrier::Base do
  before { 
    @posts = []
    allow(Net::HTTP).to receive(:start) do |*args, &block|
      allow(self).to receive(:request) do |post|
        @posts << post
        OpenStruct.new(
          :body => '{"code": 0}'
        )
      end
      block.call self
    end
    sms.deliver_now
  }
  let(:sms) { SmsCarrier::Base.sms(message) }
  subject { @posts[0] }

  context "with single to" do
    let(:message) { {:to => '+886912345678', :body => 'SMS Body'} }
    it { expect(@posts.length).to eq 1 }
    its(:body) { should eq 'apikey=APIKEY&mobile=%2B886912345678&text=%E3%80%90SIGNATURE%E3%80%91SMS+Body'}
    it { expect(Yunpian.apikey).to eq 'OTHER_APIKEY'}
    it { expect(Yunpian.signature).to eq '【OTHER_SIGNATURE】'}
  end

  context "with multiple to" do
    let(:message) { {:to => ['+886912345678', '+886963852741'], :body => 'SMS Body'} }
    it { expect(@posts.length).to eq 2 }
    its(:body) { should eq 'apikey=APIKEY&mobile=%2B886912345678&text=%E3%80%90SIGNATURE%E3%80%91SMS+Body'}
    it { expect(@posts[1].body).to eq 'apikey=APIKEY&mobile=%2B886963852741&text=%E3%80%90SIGNATURE%E3%80%91SMS+Body'}
  end
end
