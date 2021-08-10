# frozen_string_literal: true

class TicketTag < ApplicationRecord
  belongs_to :ticket
  belongs_to :tag

  validates :ticket, presence: true, uniqueness: {
    scope: :tag,
    message: 'already has the tag'
  }
  validates :tag, presence: true
end
