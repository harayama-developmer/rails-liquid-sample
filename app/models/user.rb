class User < ApplicationRecord
  has_many :notifications, dependent: :destroy
end
