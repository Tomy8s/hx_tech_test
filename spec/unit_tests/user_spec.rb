require 'spec_helper'

describe User do
  describe '#get_id' do
    it 'should return an integer as an id' do
      expect(subject.get_id).to be_a Fixnum
    end
  end
end