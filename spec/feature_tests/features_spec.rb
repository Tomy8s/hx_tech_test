require 'spec_helper'

describe 'creating a user' do
  it 'visits the site' do
    visit 'http://localhost:4567/new?email=test@test.com&forename=tom&surname=yates'
    expect(page).to have_content '"email":"test@test.com","forename":"Tom","surname":"Yates"'
  end
end