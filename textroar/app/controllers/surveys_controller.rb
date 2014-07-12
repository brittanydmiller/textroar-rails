class SurveysController < ApplicationController
  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
  end


end