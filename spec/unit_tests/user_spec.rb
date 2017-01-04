require 'spec_helper'

describe User do
  let(:email) { 'test@test.com' }
  let(:subject) { User.new({email: email}) }
  describe '#get_id' do
    it 'should return an integer as an id' do
      expect(subject.get_id).to be_a Fixnum
    end
  end

  describe '#get_email' do
    # email = 'test@test.com'
    it 'should return the email user in initialization' do
      expect(subject.get_email).to eq email
    end
  end
end