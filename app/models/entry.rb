class Entry < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :name, presence: true
  validates :message, presence: true

  default_scope { order(created_at: :desc) }

  def created_at
    time_ago_in_words(self[:created_at])
  end
end
