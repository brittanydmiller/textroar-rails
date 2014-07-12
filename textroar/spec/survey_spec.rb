require 'spec_helper'

describe Survey do 
  it 'is valid with a title, description, start, end, poll_key, and phone' do
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
    expect(survey).to be_valid
  end

  it 'is invalid without a title' do
    expect(Survey.new(title: nil)).to have(1).errors_on(:title)
  end

  it 'is invalid without a start' do
    expect(Survey.new(vote_start: nil)).to have(1).errors_on(:vote_start)
  end

  it 'is invalid without an end' do
    expect(Survey.new(vote_end: nil)).to have(1).errors_on(:vote_end)
  end
  
  it 'is invalid without a poll key' do
    expect(Survey.new(poll_key: nil)).to have(1).errors_on(:poll_key)
  end
  
  it 'is invalid with a duplicate poll key'
  
  it 'is invalid without a phone number' do
    expect(Survey.new(phone: nil)).to have(1).errors_on(:phone)
  end

  it 'is invalid wihtout a user_id' do
    expect(Survey.new(user_id:nil)).to have(1).errors_on(:phone)
  end

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