# frozen_string_literal: true

class SessionBarComponent < ViewComponent::Base
  def authenticated?
    Current.session.present?
  end
end
