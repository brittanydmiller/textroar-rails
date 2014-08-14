require 'spec_helper'

describe Survey do 
  it 'is valid with a title, description, start, end, poll_key, and phone' do
    survey = Survey.new(
      title: 'Favorite Futurama Crew Member',
      descr: 'Which core crew member is your favorite?',
      vote_start: 'Thurs, 08 May 2014 00:29:23 +0000',
      vote_end: 'Fri, 09 May 2014 00:29:23 +0000',
      poll_key: 'SJ47%',
      phone: '5556667777',
      user_id: 2,
      latitude: '37.784816',
      longitude: '-122.397387')
    expect(survey).to be_valid
  end

  it 'has a valid factory' do
    expect(build(:survey)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:survey, title: nil)).to have(1).errors_on(:title)
  end
  
  it 'is invalid without a poll key' do
    expect(build(:survey, poll_key: nil)).to have(1).errors_on(:poll_key)
  end
  
  it 'is invalid with a duplicate poll key' do 
    create(:survey, poll_key: 'SJ46%')
    expect(build(:survey, poll_key: 'SJ46%')).to have(1).errors_on(:poll_key)
  end
  
  it 'is invalid without a phone number' do
    expect(build(:survey, phone: nil)).to have(1).errors_on(:phone)
  end

  it 'is invalid without a user_id' do
    expect(Survey.new(user_id:nil)).to have(1).errors_on(:phone) #can't use factory due to association
  end

  it 'returns an array of lat/long coordinates' do
    survey = build(:survey, latitude: '37.784816', longitude: '-122.397387')
    expect(survey.lat_long).to eq(['37.784816', '-122.397387'])
  end
end