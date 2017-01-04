require 'spec_helper'

describe User do
  let(:email) { 'test@test.com' }
  let(:forename) { 'tom' }
  let(:surname) { 'yates' }
  let(:subject) { User.new({email: email, forename: forename, surname: surname}) }

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

  describe '#get_forename' do
    it 'should return a capitalize version of the given forename' do
      expect(subject.get_forename).to eq forename.capitalize
    end
  end

  describe '#get_surname' do
    it 'should return a capitalize version of the given surname' do
      expect(subject.get_surname).to eq surname.capitalize
    end
  end

  describe '#get_created' do
    it 'should return the time and date of creation' do
      time_created = Time.now
      allow(Time).to receive(:now).and_return(time_created)
      expect(subject.get_created).to eq time_created
    end
  end

  describe '#update' do
    it 'should update the id' do
      new_id = rand 1000
      subject.update({id: new_id})
      expect(subject.get_id).to eq new_id
      expect(subject.get_email).to eq email
      expect(subject.get_forename).to eq forename.capitalize
      expect(subject.get_surname).to eq surname.capitalize
    end

    it 'should update the email' do
      new_email = 'test2@test2.com'
      subject.update({email: new_email})
      expect(subject.get_email).to eq new_email
      expect(subject.get_forename).to eq forename.capitalize
      expect(subject.get_surname).to eq surname.capitalize
    end

    it 'should update the forename' do
      new_forename = 'john'
      subject.update({forename: new_forename})
      expect(subject.get_email).to eq email
      expect(subject.get_forename).to eq new_forename.capitalize
      expect(subject.get_surname).to eq surname.capitalize
    end

    it 'should update the surname' do
      new_surname = 'smith'
      subject.update({surname: new_surname})
      expect(subject.get_email).to eq email
      expect(subject.get_forename).to eq forename.capitalize
      expect(subject.get_surname).to eq new_surname.capitalize
    end

    it 'should set @update to current time' do
      time_updated = Time.now
      allow(Time).to receive(:now).and_return(time_updated)
      expect(subject.get_email).to eq email
      expect(subject.get_forename).to eq forename.capitalize
      expect(subject.get_surname).to eq surname.capitalize
      expect(subject.get_updated).to be time_updated
    end
  end

  describe '#get_updated' do
    context 'not updated' do
      it 'should return nil' do
        time_updated = Time.now
        allow(Time).to receive(:now).and_return(time_updated)
        expect(subject.get_updated).to be nil
      end
    end
  end
end