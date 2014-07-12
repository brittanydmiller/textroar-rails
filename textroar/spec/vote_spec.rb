require 'spec_helper'

describe Vote do
  it 'is valid with a phone and choice (and all optional attributes)' do 
    vote = Vote.new(
      phone: '3443443444',
      choice: 'Bart',
      latitude: '34.824824',
      longitude: '-122.234567',
      ticket: 'G345',
      survey_id: 44)
    expect(vote).to be_valid
  end

  it 'is valid with only a phone and a choice' do
    vote = Vote.new(phone: '1221221112', choice: 'Lisa')
    expect(vote).to be_valid
  end

  it 'is invalid with a duplicate phone, in the scope of the survey' 
  it 'is invalid with a duplicate ticket, in the scope of the survey'
  it 'is invaild with a latitude more than XX miles from survey location'
  it 'is invalid with a longitude more than XX miles from survey location'


end