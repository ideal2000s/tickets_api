# frozen_string_literal: true

class CreateTicketTags < ActiveRecord::Migration[6.1]
  def change
    create_table :ticket_tags do |t|
      t.references :ticket, index: true, foreign_key: true, null: false
      t.references :tag, index: true, foreign_key: true, null: false

      t.timestamps
    end

    add_index :ticket_tags, %i[ticket_id tag_id], unique: true, name: 'index_ticket_tags_unique'
  end
end
