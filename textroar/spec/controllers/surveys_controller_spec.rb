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
      it 'saves the new survey in the database'
      it ' redirects to surveys#show'
    end

    context 'with invalid attributes' do  
      it "doesn't save the new survey in the database"
      it 're-renders the :new template'
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the survey in the database'
      it 'redirects to the survey'
    end

    context ' with invalid attributes' do 
      it'does not update the survey'
      it 're-renders the #edit template'
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the survey from the database'
    it 'redirects to surveys#index'
  end
end