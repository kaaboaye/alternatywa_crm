class School < ApplicationRecord
  has_many :members

  validates :name,
    presence: true,
    length: { minimum: 3 }
end
