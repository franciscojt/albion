class Result < ApplicationRecord
  belongs_to :user
  mount_uploader :attachment, ResultUploader
end
