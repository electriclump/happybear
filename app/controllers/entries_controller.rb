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
    @entry = Entry.find(params[:id])
    @entry.destroy

    flash[:success] = 'Message has been deleted'
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
