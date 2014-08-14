require 'spec_helper'

describe Vote do
  describe 'validate new vote' do
    context 'required attributes and optional attributes provided' do
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
    end

    context 'only required attributes provided' do
      it 'is valid with only a phone, choice, and survey_id' do
        vote = Vote.new(phone: '1221221112', choice: 'Lisa', survey_id: 42)
        expect(vote).to be_valid
      end
    end
  end

  it 'has a valid factory' do
    expect(build(:vote)).to be_valid
  end

  describe "prevent duplicate voters" do

    before :each do
      @survey = create(:survey)
      @survey.votes << create(:vote, phone: '3443443444', ticket: 'G345')   
    end

    it 'is invalid with a duplicate phone, in the scope of the survey' do
      vote2 = @survey.votes.build(phone: '3443443444', choice: 'Lisa', survey_id: @survey.id)
      expect(vote2).to have(1).errors_on(:phone)
    end

    it 'is invalid with a duplicate ticket, in the scope of the survey' do
      vote2 = @survey.votes.build(phone: '4554554445', choice: 'Nibbler', ticket: 'G345', survey_id: @survey.id)
      expect(vote2).to have(1).errors_on(:ticket) 
    end
  end

  #TODO: Flesh this out later, with distance calculator
  #it 'is invalid with a latitude more than XX miles from survey location' 
  #it 'is invalid with a longitude more than XX miles from survey location'


end