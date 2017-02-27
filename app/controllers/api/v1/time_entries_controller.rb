class Api::V1::TimeEntriesController < ApplicationController
  before_action :get_time_entry, only: [:show, :update, :destroy]

  def index
    @time_entries = TimeEntry.all
    render json: @time_entries
  end

  def show
    render json: @time_entry
  end

  def create
    time_entry = TimeEntry.new(time_entry_params)

    if time_entry.save
      render json: time_entry, status: :created
    else
      time_entry.errors.add(:id, "The Timecard for this entry does not exist")
      render_error(time_entry, :unprocessable_entity)
    end
  end

  def destroy
    @time_entry.destroy
    head 200
  end

  private

  def time_entry_params
    params.require(:time_entry).permit(:time, :timecard_id)
  end

  def get_time_entry
    begin 
      @time_entry = TimeEntry.find params[:id]
    rescue ActiveRecord::RecordNotFound
      timeentry = TimeEntry.new
      timeentry.errors.add(:id, "No Time Entry for this ID.")
      render_error(timeentry, 422) and return
    end
  end
end
