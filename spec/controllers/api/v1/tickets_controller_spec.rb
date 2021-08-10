# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

module Api
  module V1
    RSpec.describe TicketsController, type: :controller do
      let(:tag) { Tag.create(name: 'tag1') }
      let(:ticket) { Ticket.create(user_id: 1, title: 'test ticket', tags: [tag]) }
      let(:succeeded_ticket_service) { instance_double(TicketsService, create!: true, success?: true, ticket: ticket) }
      let(:failed_ticket_service) do
        instance_double(TicketsService, create!: false, success?: false, errors: ['failed the creation!!!'])
      end

      describe '#create' do
        it 'succeeded a creation' do
          allow(TicketsService).to receive(:new).and_return(succeeded_ticket_service)
          post :create, format: :json
          expect(response).to have_http_status(:created)
          expect(JSON.parse(response.body)['created_ticket']).to be_present
        end

        it 'failed a creation' do
          allow(TicketsService).to receive(:new).and_return(failed_ticket_service)
          post :create, format: :json
          expect(response).to have_http_status(:unprocessable_entity)
          expect(JSON.parse(response.body)['errors'][0]).to eq('failed the creation!!!')
        end
      end
    end
  end
end
