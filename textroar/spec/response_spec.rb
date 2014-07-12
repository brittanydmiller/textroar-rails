require 'spec_helper'

describe Response do 
  it 'is valid with text and a key' do
    response = Response.new(
      survey_id: 11,
      response_text: 'Marge',
      response_key: '448')
    expect(response).to be_valid
  end

  it 'is invalid without a survey_id' do
    expect(Response.new(survey_id: nil)).to have(1).errors_on(:survey_id)
  end

  it 'is invalid without text' do
    expect(Response.new(response_text: nil)).to have(1).errors_on(:response_text)
  end

  it 'is invalid without a key' do
    expect(Response.new(response_key: nil)).to have(1).errors_on(:response_key)
  end

  describe "prevents duplicate responses in the same survey" do

    before :each do
      @survey = Survey.create(
        title: 'Favorite Futurama Crew Member',
        descr: 'Which core crew member is your favorite?',
        vote_start: 'Thurs, 08 May 2014 00:29:23 +0000',
        vote_end: 'Fri, 09 May 2014 00:29:23 +0000',
        poll_key: 'SJ45%',
        phone: '5556667777',
        user_id: 2,
        latitude: '37.784816',
        longitude: '-122.397387'
        )
      @survey.responses.create(
        survey_id: @survey.id,
        response_text: 'Bender',
        response_key: '92')
    end

    it 'is invalid with a duplicate key, in the scope of the survey' do
      response = @survey.responses.build(
        survey_id: @survey.id,
        response_text: 'Leela',
        response_key: '92')        
      expect(response).to have(1).errors_on(:response_key)
    end

    it 'is invalid with duplicate text, in the scope of the survey' do  
      response = @survey.responses.build(
        survey_id: @survey.id,
        response_text: 'Bender',
        response_key: '447')  
      expect(response).to have(1).errors_on(:response_text)
    end
  end
end