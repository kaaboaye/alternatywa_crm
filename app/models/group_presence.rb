class GroupPresence < ApplicationRecord
  belongs_to :group
  belongs_to :member

  validates_associated :group
  validates_associated :member

  validates :datetime,
    presence: true
end
