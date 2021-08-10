# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :ticket_tags, dependent: :destroy
  has_many :tickets, through: :ticket_tags

  validates :name, presence: true
  validates :count, numericality: { only_integer: true }

  scope :tags_with_max_count, -> { where(count: Tag.maximum(:count)) }
end
