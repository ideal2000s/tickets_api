# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe WebHooksService do
  before do
    stub_request(:post, /webhook.site/).to_return(status: 200, body: '{"vid":"123"}')
  end

  describe '#send_tags_with_highest_count' do
    it 'posts request to web hook' do
      described_class.send_tags_with_highest_count
      expect(WebMock).to have_requested(:post, URI(WebHooksService::URL))
    end
  end
end
