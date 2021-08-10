# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  def current_user
    'james' # imagine that the session user is james
  end
end
