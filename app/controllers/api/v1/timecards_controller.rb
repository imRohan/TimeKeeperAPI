class Api::V1::TimecardsController < ApplicationController
  before_action :get_timecard, only: [:show, :update, :destroy]

  def index
    @timecards = Timecard.all.includes(:time_entries)
    render json: @timecards
  end

  def show
    render json: @timecard
  end

  private

  def get_timecard
    begin
      @timecard = Timecard.find params[:id]
    rescue ActiveRecord::RecordNotFound
      timecard = Timecard.new
      timecard.errors.add(:id, "No Timecard for this ID.")
      render_error(timecard, 404) and return
    end
  end
end
