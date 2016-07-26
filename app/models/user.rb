# Slack user info
class User < ActiveRecord::Base
  belongs_to :team

  validates :slack_uid, uniqueness: true
end
