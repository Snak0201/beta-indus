# frozen_string_literal: true

class SidebarComponent < ViewComponent::Base
  def initialize
    @nearer_birthday_characters = Birthday::Character.nearer_birthday
    @nearer_birthday_brands = Birthday::Brand.nearer_birthday
  end
end
