# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(link_text:, path:)
    @link_text = link_text
    @path = path
  end
end
