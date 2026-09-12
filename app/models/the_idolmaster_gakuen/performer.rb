class TheIdolmasterGakuen::Performer < ApplicationRecord
  belongs_to :set_list
  belongs_to :character
end
