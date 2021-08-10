# frozen_string_literal: true

module Api
  module V1
    class TicketPolicy < ApplicationPolicy
      def create?
        true # imagine that the user has permissions
      end
    end
  end
end
