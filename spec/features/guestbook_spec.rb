require 'spec_helper'

feature 'visitor leaves a message' do

  scenario 'with valid name and message' do
    leave_message 'dan', 'hey cool site'

    expect(page).to have_content('Thank you for your message')
    expect(page).to have_content('hey cool site')
  end

  scenario 'with invalid name' do
    leave_message '', 'hey cool site'

    expect(page).to have_content('Error saving entry')
  end

  scenario 'with invalid message' do
    leave_message 'trevor', ''

    expect(page).to have_content('Error saving entry')
  end

  def leave_message(name, message)
    visit root_path
    fill_in 'Name', with: name
    fill_in 'Message', with: message
    click_button 'Add Entry'
  end
end
