# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe TicketsService do
  let(:valid_params) do
    {
      user_id: 1,
      title: Faker::Lorem.characters(5),
      tags: ['tag 1', 'tag 2', 'tag 3']
    }
  end
  let(:invalid_params) do
    {
      user_id: 1,
      title: Faker::Lorem.characters(5),
      tags: ['tag 1', 'tag 2', 'tag 3', 'tag 4', 'tag 5', 'tag 6']
    }
  end

  describe '#create!' do
    context 'with valid params' do
      it 'creates a ticket and send to web hook' do
        expect_any_instance_of(WebHooksService).to receive(:send_tags_with_highest_count).once
        result = described_class.create!(valid_params)
        expect(result).to be_success
      end
    end

    context 'with invalid tags' do
      it 'returns with errors' do
        result = described_class.create!(invalid_params)
        expect(result).to be_failed
      end
    end

    context 'with ActiveRecord::RecordInvalid' do
      before do
        allow_any_instance_of(Tag).to receive(:save!).and_raise(ActiveRecord::RecordInvalid.new(Tag.new))
      end

      it 'returns with errors' do
        result = described_class.create!(valid_params)
        expect(result).to be_failed
      end
    end
  end
end
