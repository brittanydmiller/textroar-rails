require 'spec_helper'

describe Response do 
  it 'is valid with text and a key' do
    response = Response.new(
      survey_id: 11,
      response_text: 'Marge',
      response_key: '448')
    expect(response).to be_valid
  end

  it 'has a valid factory' do
    expect(build(:response)).to be_valid
  end

  it 'is invalid without a survey_id' do
    expect(build(:response, survey_id: nil)).to have(1).errors_on(:survey_id)
  end

  it 'is invalid without text' do
    expect(build(:response, response_text: nil)).to have(1).errors_on(:response_text)
  end

  it 'is invalid without a key' do
    expect(build(:response, response_key: nil)).to have(1).errors_on(:response_key)
  end

  describe "prevents duplicate responses in the same survey" do

    before :each do
      @survey = create(:survey)
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