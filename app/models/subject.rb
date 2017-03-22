class Subject < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
end
