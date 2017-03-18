require 'spec_helper'

feature 'visitor leaves a message' do
  scenario 'with valid name and message' do
    leave_message 'Dan', 'hey cool site'

    expect(page).to have_content('Thank you for your message')
    expect(page).to have_content('hey cool site')
  end

  scenario 'with invalid name' do
    leave_message '', 'hey cool site'

    expect(page).to have_content('Error saving entry')
    expect(page).to have_content('Name is mandatory')
  end

  scenario 'with invalid message' do
    leave_message 'trevor', ''

    expect(page).to have_content('Error saving entry')
    expect(page).to have_content('Message is mandatory')
  end
end

feature 'listing entries' do
  scenario 'shows all entries in reverse chronological order' do
    leave_message('name1', 'message1')
    leave_message('name2', 'message2')
    leave_message('name3', 'message3')

    expect(page.body.index('name3')).to be < page.body.index('name2')
    expect(page.body.index('name2')).to be < page.body.index('name1')

    expect(page).to have_content('message1')
    expect(page).to have_content('message2')
    expect(page).to have_content('message3')
  end
end

feature 'deleting entries' do
  scenario 'deleting an entry' do
    leave_message 'Dan', 'hey cool site'
    click_link('Delete')

    expect(page).to have_content('Entry has been deleted')
    expect(page).to_not have_content('hey cool site')
  end
end

private

def leave_message(name, message)
  visit root_path
  fill_in 'Name', with: name
  fill_in 'Message', with: message
  click_button 'Add Entry'
end
