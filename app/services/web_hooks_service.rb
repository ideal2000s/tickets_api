# frozen_string_literal: true

class WebHooksService
  include Mixins::Interactor
  include Mixins::NetBase

  URL = 'https://webhook.site/a3418478-a628-4a76-a1a6-8caedfe26908'

  def send_tags_with_highest_count
    params = {
      tags_with_max_count: Tag.tags_with_max_count.map { |tag| { name: tag.name, count: tag.count } }
    }
    post_request(URL, params)
    Rails.logger.info("sending tags having highest count to a url #{URL}")
  end
end
