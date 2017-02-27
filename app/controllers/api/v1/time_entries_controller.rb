class Api::V1::TimeEntriesController < ApplicationController
  before_action :get_time_entry, only: [:show, :update, :destroy]

  def index
    @time_entries = TimeEntry.all
    render json: @time_entries
  end

  def show
    render json: @time_entry
  end

  private

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
