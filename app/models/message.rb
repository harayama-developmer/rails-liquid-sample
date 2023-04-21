class Message < ApplicationRecord
  validates :title, :body, presence: true

  after_create_commit :notify_users

  def notify_users
    User.all.each do |user|
      user.notifications.create!(title: title, body: body)
    end
  end
end
