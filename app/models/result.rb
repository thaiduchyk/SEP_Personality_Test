class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :personality

  scope :find_by_user_and_key, ->(user, key) { where("user_id = ? AND personality_id = ?", user.id, Personality.find_by(key: key).id).first }
  scope :find_by_user_and_pers, ->(user_id, pers_id) { where("user_id = ? AND personality_id = ?", user_id, pers_id).first }
end