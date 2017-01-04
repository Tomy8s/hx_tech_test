require 'spec_helper'

describe User do
  describe '#id' do
    it 'should return an integer as an id' do
      expect(subject.id).to be_a Fixnum
    end
  end
end