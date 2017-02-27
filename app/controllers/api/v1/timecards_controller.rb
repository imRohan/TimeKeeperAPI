class Api::V1::TimecardsController < ApplicationController
  before_action :get_timecard, only: [:show, :update, :destroy]

  def index
    @timecards = Timecard.all.includes(:time_entries)
    render json: @timecards
  end

  def show
    render json: @timecard
  end

  def create
    timecard = Timecard.new(timecard_params)

    if timecard.save
      render json: timecard, status: :created
    else
      timecard.errors.add(:id, "A timecard already exists for this date.")
      render_error(timecard, :unprocessable_entity)
    end
  end

  def update
    if @timecard.update_attributes(timecard_params)
      render json: @timecard, status: :ok
    else
      render_error(@timecard, :unprocessable_entity)
    end
  end

  def destroy
    @timecard.destroy
    head 200
  end

  private

  def get_timecard
    begin
      @timecard = Timecard.find params[:id]
    rescue ActiveRecord::RecordNotFound
      timecard = Timecard.new
      timecard.errors.add(:id, "No Timecard for this ID.")
      render_error(timecard, 422) and return
    end
  end

  def timecard_params
    params.require(:timecard).permit(:username, :occurrence)
  end
end
