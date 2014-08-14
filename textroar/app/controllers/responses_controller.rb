class ResponsesController < ApplicationController
  def create
    @response = Response.new(text: params["text"], key: params["key"])
    @response[:survey_id] = params["survey_id"]
    if @response.save
      #redirect_to @survey, :notice => "Successfully added response."
    else
      #render action: 'new'
    end
  end
end