class EntriesController < ApplicationController

  def create
    @entry = Entry.create(entry_params)
    redirect_to root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :message)
  end
end
