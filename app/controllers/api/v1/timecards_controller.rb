class Api::V1::TimecardsController < ApplicationController
  def index
    timecards = Timecard.all
    render json: timecards
  end
end
