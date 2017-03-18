class EntriesController < ApplicationController

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:notice] = 'Thank you for your message!'
    else
      flash[:error] = 'Error saving entry'
    end

    redirect_to root_path
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :message)
  end
end
