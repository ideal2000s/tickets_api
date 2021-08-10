# frozen_string_literal: true

module Builders
  class TicketBuilder
    class << self
      def build_for_ticket(ticket)
        ticket_hash = {}
        ticket_hash[:user_id] = ticket.user_id
        ticket_hash[:title] = ticket.title
        ticket_hash[:tags] = ticket.tags.map(&:name)
        ticket_hash
      end
    end
  end
end
