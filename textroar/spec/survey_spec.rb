require 'spec_helper'

describe Survey do 
  it 'is valid with a title, description, start, end, poll_key, and phone'
  it 'is invalid without a title'
  it 'is invalid without a start'
  it 'is invalid without an end'
  it 'is invalid without a poll key'
  it 'is invalid with a duplicate poll key'
  it 'is invalid without a phone number'
  it 'returns an array of lat/long coordinates' do
    survey = Survey.new(
      title: 'Favorite Futurama Crew Member',
      descr: 'Which core crew member is your favorite?',
      vote_start: 'Thurs, 08 May 2014 00:29:23 +0000',
      vote_end: 'Fri, 09 May 2014 00:29:23 +0000',
      poll_key: 'SJ45%',
      phone: '5556667777',
      user_id: 2,
      latitude: '37.784816',
      longitude: '-122.397387')
    expect(survey.lat_long).to eq(['37.784816', '-122.397387'])
  end
end