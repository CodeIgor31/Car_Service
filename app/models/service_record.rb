# frozen_string_literal: true

class ServiceRecord < ApplicationRecord
  belongs_to :master
  belongs_to :user
  belongs_to :service
  belongs_to :service_point
  validates :date, :user_id, presence: true
  enum status: %i[prepared ready]
  has_many_attached :pictures

  def picture_thumb(pic)
    pic.variant(resize_to_limit: [300, 300]).processed
  end
end
