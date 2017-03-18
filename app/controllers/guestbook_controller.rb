class GuestbookController < ApplicationController
  def index
    @entry = Entry.new
    @entries = Entry.all
 end
end
