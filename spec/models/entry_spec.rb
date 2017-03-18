require 'rails_helper'

RSpec.describe Entry, type: :model do

  subject { described_class.new }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:message) }

  it 'is valid with valid attributes' do
    subject.name = 'Dan'
    subject.message = 'Hello I like your guestbook'

    expect(subject).to be_valid
  end

  it 'is not valid with missing name' do
    subject.message = 'Hello I like your guestbook'

    expect(subject).to_not be_valid
  end

  it 'is not valid with missing message' do
    subject.name = 'Dan'

    expect(subject).to_not be_valid
  end

  describe 'default scope' do
    let!(:entry1) { create(:entry, name: 'Doris', message: 'hey') }
    let!(:entry2) { create(:entry, name: 'Dave', message: 'yo') }

    it 'uses reverse chronological order by default' do
      expect(Entry.all).to eq [entry2, entry1]
    end
  end
end
