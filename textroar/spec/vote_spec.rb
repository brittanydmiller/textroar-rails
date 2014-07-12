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

  it 'is valid with only a phone, choice, and survey_id' do
    vote = Vote.new(phone: '1221221112', choice: 'Lisa', survey_id: 42)
    expect(vote).to be_valid
  end

  it 'is invalid with a duplicate phone, in the scope of the survey' do
    survey = Survey.create(
      title: 'Favorite Futurama Crew Member',
      descr: 'Which core crew member is your favorite?',
      vote_start: 'Thurs, 08 May 2014 00:29:23 +0000',
      vote_end: 'Fri, 09 May 2014 00:29:23 +0000',
      poll_key: 'SJ47%',
      phone: '5556667777',
      user_id: 2,
      latitude: '37.784816',
      longitude: '-122.397387')    
    vote1 = survey.votes.create(
      phone: '3443443444',
      choice: 'Kimberly',
      latitude: '34.824824',
      longitude: '-122.234567',
      ticket: 'G345',
      survey_id: survey.id)
    vote2 = survey.votes.build(phone: '3443443444', choice: 'Lisa', survey_id: survey.id)
    expect(vote2).to have(1).errors_on(:phone)
  end

  it 'is invalid with a duplicate ticket, in the scope of the survey' do
    survey = Survey.create(
      title: 'Favorite Futurama Crew Member',
      descr: 'Which core crew member is your favorite?',
      vote_start: 'Thurs, 08 May 2014 00:29:23 +0000',
      vote_end: 'Fri, 09 May 2014 00:29:23 +0000',
      poll_key: 'SJ47%',
      phone: '5556667777',
      user_id: 2,
      latitude: '37.784816',
      longitude: '-122.397387') 
    vote1 = survey.votes.create(phone: '3223223332', choice: 'The Professor', ticket: 'G444', survey_id: survey.id)
    vote2 = survey.votes.build(phone: '4554554445', choice: 'Nibbler', ticket: 'G444', survey_id: survey.id)
    expect(vote2).to have(1).errors_on(:ticket) 
  end

  it 'is invaild with a latitude more than XX miles from survey location'
  it 'is invalid with a longitude more than XX miles from survey location'


end