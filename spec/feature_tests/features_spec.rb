require 'spec_helper'

describe 'creating a user' do
  context 'no user specified to return' do
    it 'returns the last user' do
      visit 'http://localhost:4567/new?email=test@test.com&forename=tom&surname=yates'
      expect(page).to have_content '"email":"test@test.com","forename":"Tom","surname":"Yates"'
    end
  end

  context 'user specified to return' do
    it 'returns the last user' do
      n = 1
      10.times{ Users.create({email: "test@test.com#{n}", forename: "tom#{n}", surname: "yates#{n}"}) }
      visit 'http://localhost:4567/get?id=2'
      expect(page).to have_content '"email":"test@test.com2","forename":"Tom2","surname":"Yates2"'
    end
  end
end
