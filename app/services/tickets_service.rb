# frozen_string_literal: true

class TicketsService
  include Mixins::Interactor

  attr_accessor :ticket

  def create!(attributes)
    user_id = attributes[:user_id]
    title = attributes[:title]
    tag_names = attributes[:tags] || []

    return unless valid_tags?(tag_names)

    create_tickets!(user_id: user_id, title: title, tag_names: tag_names)

    WebHooksService.send_tags_with_highest_count
  end

  private

  def valid_tags?(tags)
    return true if tags.length < 5

    add_error('Tags must be fewer than 5 counts.') and return false
  end

  def create_tickets!(user_id:, title:, tag_names:)
    ActiveRecord::Base.transaction do
      tags = tag_names.map do |tag_name|
        tag = Tag.find_or_create_by!(name: tag_name.downcase)
        tag.update!(count: tag.count + 1)
        tag
      end
      @ticket = Ticket.create!({ user_id: user_id, title: title, tags: tags })
    rescue ActiveRecord::RecordNotUnique, ActiveRecord::RecordInvalid => e
      add_error(e.message) and raise ActiveRecord::Rollback
    end
  end
end
