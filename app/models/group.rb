class Group < ApplicationRecord
  has_many :group_presences

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
