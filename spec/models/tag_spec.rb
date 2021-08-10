# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Tag, type: :model do
  describe '#Validation' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_numericality_of(:count).only_integer }
  end

  describe '#Associations' do
    it { is_expected.to have_many(:ticket_tags).dependent(:destroy) }
    it { is_expected.to have_many(:tickets).through(:ticket_tags) }
  end

  describe '#tags_with_max_count' do
    before do
      Tag.create(name: 'tag1')
    end

    def scope
      described_class.tags_with_max_count
    end

    it 'returns tags having highest count' do
      tag2 = Tag.create(name: 'tag2', count: 5)
      expect(scope).to include(tag2)
    end
  end
end
