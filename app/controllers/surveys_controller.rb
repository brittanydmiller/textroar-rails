class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show #GET /surveys/1
    set_survey
  end

  def new #GET /surveys/new
    @survey = Survey.new
  end

  def edit #GET /surveys/1/edit
    set_survey
  end

  def create #POST /surveys
    @survey = Survey.new(params["survey"])
    @survey[:title] = "Something here"
    @survey[:user_id] = 4
    if @survey.save
      redirect_to @survey, :notice => "Successfully created survey."
    else
      render action: 'new'
    end
  end

  def update #PUT /surveys/1
    set_survey
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice  => "Successfully updated survey."
    else
      render action: 'edit'
    end
  end

  def destroy #DELETE /surveys/1
    set_survey
    @survey.destroy
    redirect_to surveys_url, :notice => "Successfully destroyed survey."
  end

  private 

  def set_survey
    @survey = Survey.find(params[:id])
  end
end