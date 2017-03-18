class Entry < ApplicationRecord
  validates :name, presence: true
  validates :message, presence: true

  default_scope { order(created_at: :desc) }
end
