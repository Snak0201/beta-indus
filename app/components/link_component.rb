# frozen_string_literal: true

class LinkComponent < ViewComponent::Base
  def initialize(link_text:, path:, class_name: "color_shinosawa-hiro", data: {})
    @link_text = link_text
    @path = path
    @class_name = class_name
    @data = data
  end
end
