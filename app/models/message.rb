class Message < ApplicationRecord
  validates :title, :body, presence: true
end
