class EnologistWine < ApplicationRecord
  belongs_to :enologist
  belongs_to :wine
  
end
