class Subject < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  def votes_summary
    votes.count
  end

end
