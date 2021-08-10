# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe TicketTag, type: :model do
  describe '#Validation' do
    it { is_expected.to validate_presence_of(:ticket) }
    it { is_expected.to validate_presence_of(:tag) }
  end

  describe '#Associations' do
    it { is_expected.to belong_to(:ticket) }
    it { is_expected.to belong_to(:tag) }
  end
end
