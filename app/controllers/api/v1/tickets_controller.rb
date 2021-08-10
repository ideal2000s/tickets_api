# frozen_string_literal: true

module Api
  module V1
    class TicketsController < ApplicationController
      def create
        authorize_action
        result = TicketsService.create!(ticket_params)
        if result.success?
          render status: :created, json: { created_ticket: Builders::TicketBuilder.build_for_ticket(result.ticket) }
        else
          render status: :unprocessable_entity, json: { errors: result.errors }
        end
      end

      private

      def ticket_params
        params.permit(:user_id, :title, tags: [])
      end

      def policy_class
        TicketPolicy
      end

      def authorize_action(record = Ticket)
        authorize(record, "#{action_name}?", policy_class: policy_class)
      end
    end
  end
end
