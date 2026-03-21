# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(link_text:, path:, color: "shinosawa-hiro")
    @link_text = link_text
    @path = path
    @color = color
  end
end
