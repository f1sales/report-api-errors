class BugReport < ApplicationRecord
  validates :status, presence: true

  scope :search, ->(term) { where('LOWER(robot) LIKE ?', "%#{term.downcase}%") if term.present? }
end
