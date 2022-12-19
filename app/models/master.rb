# frozen_string_literal: true

class Master < ApplicationRecord
  has_many :service_records
  has_one_attached :face

  def mas_thumb(pic)
    pic.variant(resize_to_limit: [300, 300]).processed
  end
end
