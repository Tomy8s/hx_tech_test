require 'spec_helper'

describe User do
  let(:email) { 'test@test.com' }
  let(:forename) { 'tom' }
  let(:subject) { User.new({email: email, forename: forename}) }
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

  describe '#forename' do
    it 'should return a capitalize version of the given forename' do
      expect(subject.get_forename).to eq forename.capitalize
    end
  end
end