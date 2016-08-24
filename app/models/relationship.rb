class Relationship < ActiveRecord::Base
  belongs_to :user # The user that initiates the follow (stalker)
  belongs_to :friend, class_name: "User" # This is the user being followed
end
