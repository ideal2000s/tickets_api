# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags

  validates :user_id, presence: true, numericality: true
  validates :title, presence: true
end
