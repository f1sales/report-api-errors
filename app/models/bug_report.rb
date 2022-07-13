class BugReport < ApplicationRecord
  validates :status, presence: true
end
