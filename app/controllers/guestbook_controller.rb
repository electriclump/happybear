class GuestbookController < ApplicationController
  def index
    @entry = Entry.new
  end
end
