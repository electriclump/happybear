class EntriesController < ApplicationController
  before_action :find_entries

  def index
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:success] = 'Thank you for your message!'
      redirect_to root_url
    else
      flash[:error] = 'Error saving entry'
      render :index
    end
  end

  def destroy
    if Entry.find(params[:id]).destroy
      flash[:success] = 'Entry has been deleted'
    else
      flash[:error] = "Couldn't delete entry"
    end

    redirect_to root_url
  end

  private

  def find_entries
    @entries ||= Entry.all
  end

  def entry_params
    params.require(:entry).permit(:name, :message)
  end
end
