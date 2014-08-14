require 'spec_helper'

describe SurveysController do
  
  describe 'GET #index' do
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested survey to @survey' do
      survey = create(:survey)
      get :show, id: survey
      expect(assigns(:survey)).to eq survey
    end

    it 'renders the :show template' do
      survey = create(:survey)
      get :show, id: survey
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new Survey to @survey' do
      get :new
      expect(assigns(:survey)).to be_a_new(Survey)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested survey to @survey' do
      survey = create(:survey)
      get :edit, id: survey
      expect(assigns(:survey)).to eq survey
    end
    it 'renders the :edit template' do 
      survey = create(:survey)
      get :edit, id: survey
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do

    context 'with valid attributes' do  
      it 'saves the new survey in the database' do
        expect{ post :create, survey: attributes_for(:survey)}.to change(Survey, :count).by(1) 
      end
      it ' redirects to surveys#show' do
        post :create, survey: attributes_for(:survey)
        expect(response).to redirect_to survey_path(assigns[:survey])
      end
    end

    context 'with invalid attributes' do  
      it "doesn't save the new survey in the database" do
        expect{ 
          post :create, survey: attributes_for(:invalid_survey) 
        }.to_not change(Survey, :count)
      end
      it 're-renders the :new template' do
        post :create, survey: attributes_for(:invalid_survey)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @survey = create(:survey, title: "Who's your favorite possum?")
    end
    context 'with valid attributes' do
      it 'locates the requested @survey' do
        put :update, id: @survey, survey: attributes_for(:survey)
        expect(assigns(:survey)).to eq(@survey)
      end
      it 'changes @survey attributes' do
        put :update, id: @survey, survey: attributes_for(:survey, title: "Will Max end up famous or suspended?")
      end 
      it 'redirects to the updated survey' do
        put :update, id: @survey, survey: attributes_for(:survey)
        expect(response).to redirect_to @survey
      end
    end

    context 'with invalid attributes' do 
      it'does not update the survey' do
        put :update, id: @survey, survey: attributes_for(:invalid_survey)
        @survey.reload
        expect(@survey.title).to_not eq("Will Max end up famous or suspended?")
        expect(@survey.title).to eq("Who's your favorite possum?")
      end
      it 're-renders the #edit template' do
        put :update, id: @survey, survey: attributes_for(:invalid_survey)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @survey = create(:survey)
    end
    it 'deletes the survey from the database' do
      expect{
        delete :destroy, id: @survey
      }.to change(Survey,:count).by(-1)
    end
    it 'redirects to surveys#index' do
      delete :destroy, id: @survey
      expect(response).to redirect_to surveys_url
    end
  end
end