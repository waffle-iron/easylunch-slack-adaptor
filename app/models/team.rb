# Slack team's EasyLunch app info
class Team < ActiveRecord::Base
  has_many :users

  validates :access_token, presence: true
  validates :slack_team_name, presence: true
  validates :slack_team_id, presence: true, uniqueness: true
  validates :bot_access_token, presence: true
end
