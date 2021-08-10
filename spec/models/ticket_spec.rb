# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe Ticket, type: :model do
  describe '#Validation' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_numericality_of(:user_id) }
    it { is_expected.to validate_presence_of(:title) }
  end

  describe '#Associations' do
    it { is_expected.to have_many(:ticket_tags).dependent(:destroy) }
    it { is_expected.to have_many(:tags).through(:ticket_tags) }
  end
end
