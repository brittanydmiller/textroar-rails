class ResponsesController < ApplicationController
  def create
    p "inside response#create"
    p params
  end
end