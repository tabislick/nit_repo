class User < ActiveRecord::Base
  class << self
    def from_omniauth(auth)
      provider = auth.provider
      uid = auth.uid
      info = auth.info.symbolize_keys!
      user = User.find_or_initialize_by(uid: uid, provider: provider)
      user.name = info.name
      has_many :comments, dependent: :delete_all
      user.save!
      user
    end
  end
end
