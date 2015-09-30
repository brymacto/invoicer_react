class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  private

    def entry_params
      params.require(:entry).permit(:date, :minutes, :rate, :invoiced)
    end
end
