class Subject < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  belongs_to :user, autosave: true

  validates :sub_id, :sub_name, uniqueness: true, presence: true


  def votes_summary
    votes.count
  end

end
