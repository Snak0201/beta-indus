# frozen_string_literal: true

class SessionBarComponent < ViewComponent::Base
  def initialize(cookies:)
    @cookies = cookies
  end

  def authenticated?
    Session.find_by(id: @cookies.signed[:session_id]) if @cookies.signed[:session_id]
  end
end
