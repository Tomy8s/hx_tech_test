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

  describe '#display_json' do
    it 'should return the email user in initialization' do
      expect(subject.display_json.split(",")[1].split("\":")[1].tr('"','')).to eq email
    end
    
    it 'should return a capitalize version of the given forename' do
      expect(subject.display_json.split(",")[2].split("\":")[1].tr('"','')).to eq forename.capitalize
    end
    
    it 'should return a capitalize version of the given surname' do
      expect(subject.display_json.split(",")[3].split("\":")[1].tr('"','')).to eq surname.capitalize
    end
    
    it 'should return the time and date of creation' do
      time_created = Time.now
      allow(Time).to receive(:now).and_return(time_created)
      expect(subject.display_json.split(",")[4].split("\":")[1].tr('"','')).to eq time_created.to_s
    end
  
    it 'should return null as update' do
      time_updated = Time.now
      allow(Time).to receive(:now).and_return(time_updated)
      expect(subject.display_json.split(",")[5].split("\":")[1].tr('"','').tr('}','')).to eq "null"
    end
  end

  describe '#update' do
    it 'should update the email without affecting other atributes' do
      new_email = 'test2@test2.com'
      subject.update({email: new_email})
      expect(subject.display_json.split(",")[1].split("\":")[1].tr('"','')).to eq new_email
      expect(subject.display_json.split(",")[2].split("\":")[1].tr('"','')).to eq forename.capitalize
      expect(subject.display_json.split(",")[3].split("\":")[1].tr('"','')).to eq surname.capitalize
    end

    it 'should update the forename without affecting other atributes' do
      new_forename = 'john'
      subject.update({forename: new_forename})
      expect(subject.display_json.split(",")[1].split("\":")[1].tr('"','')).to eq email
      expect(subject.display_json.split(",")[2].split("\":")[1].tr('"','')).to eq new_forename.capitalize
      expect(subject.display_json.split(",")[3].split("\":")[1].tr('"','')).to eq surname.capitalize
    end

    it 'should update the surname without affecting other atributes' do
      new_surname = 'smith'
      subject.update({surname: new_surname})
      expect(subject.display_json.split(",")[1].split("\":")[1].tr('"','')).to eq email
      expect(subject.display_json.split(",")[2].split("\":")[1].tr('"','')).to eq forename.capitalize
      expect(subject.display_json.split(",")[3].split("\":")[1].tr('"','')).to eq new_surname.capitalize
    end

    it 'should set @update to current time without affecting other atributes' do
      time_updated = Time.now
      allow(Time).to receive(:now).and_return(time_updated)
      subject.update({})
      expect(subject.display_json.split(",")[1].split("\":")[1].tr('"','')).to eq email
      expect(subject.display_json.split(",")[2].split("\":")[1].tr('"','')).to eq forename.capitalize
      expect(subject.display_json.split(",")[3].split("\":")[1].tr('"','')).to eq surname.capitalize
      expect(subject.display_json.split(",")[5].split("\":")[1].tr('"','').tr('}','')).to eq time_updated.to_s
    end
  end
end