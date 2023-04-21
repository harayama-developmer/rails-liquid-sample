class Message < ApplicationRecord
  validates :title, :body, presence: true

  after_create_commit :notify_users

  def notify_users
    User.all.each do |user|
      liquid_template = Liquid::Template.parse(body)
      liquid_body = liquid_template.render("name" => user.name)

      user.notifications.create!(title: title, body: liquid_body)
    end
  end
end
