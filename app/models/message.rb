class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body_or_image, presence: true

  private
  def body_or_image
    body.presence || image.presence
  end
end

