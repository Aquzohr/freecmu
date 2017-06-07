class User < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :subjects, through: :votes
  has_many :subjects

	class << self
    def from_omniauth(auth)
      uid = auth.uid
      info = auth.info.symbolize_keys!
      user = User.find_or_initialize_by(uid: uid)
      user.name = info.name
      user.image_url = info.image
      user.save!
      user
    end
  end

  def voted?(subject)
    votes.any? {|v| v.subject == subject}
  end

  def owner?(subject)
    # puts id
    # puts subject.user_id
    # puts "=============="
    return (id == subject.user_id)
  end

end
