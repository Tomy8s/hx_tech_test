require 'spec_helper'

describe 'creating a user' do
  context 'no user specified to return' do
    it 'returns the last user' do
      visit 'http://localhost:4567/new?email=test@test.com&forename=tom&surname=yates'
      expect(page).to have_content '{"id":1,"email":"test@test.com","forename":"Tom","surname":"Yates"'
    end
  end

  context 'user specified to return' do
    it 'returns the last user' do
      10.times{ visit "http://localhost:4567/new?email=test@test.com&forename=tom&surname=yates" }
      visit 'http://localhost:4567/get?id=2'
      expect(page).to have_content '{"id":2,"email"'
    end
  end
end

describe 'updating an entry' do
  it 'updates an entry' do
    visit 'http://localhost:4567/new?email=test@test.com&forename=tom&surname=yates'
    visit 'http://localhost:4567/update?id=1&surname=smith'
    expect(page).to have_content '"email":"test@test.com","forename":"Tom","surname":"Smith'
  end
end

describe 'deleting an entry' do
  it 'deletes a user' do
    10.times{ visit "http://localhost:4567/new?email=test@test.com&forename=tom&surname=yates" }
    visit 'http://localhost:4567/get?id=2'
    expect(page).to have_content '{"id":2,"email"'
    visit 'http://localhost:4567/delete?id=2'
    expect(page).to have_content 'entry deleted'
    visit 'http://localhost:4567/get?id=2'
    expect(page).to have_content 'not found'
  end
end