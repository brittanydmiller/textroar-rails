require 'spec_helper'

describe SurveysController do
  
  describe 'GET #index' do
    it 'renders the :index template'
  end

  describe 'GET #show' do
    it 'assigns the requested survey to @survey'
    it 'renders the :show template'
  end

  describe 'GET #new' do
    it 'assigns a new Survey to @survey'
    it 'renders the :new template'
  end

  describe 'GET #edit' do
    it 'assigns the requested survey to @survey'
    it 'renders the :edit template'
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