class Wine < ApplicationRecord
    has_many :wine_strains
    has_many :strains, through: :wine_strains, dependent: :destroy

    has_many :enologist_wines
    has_many :enologists, through: :enologist_wines, dependent: :destroy

    validates :name, presence: true

    accepts_nested_attributes_for :wine_strains, reject_if: ->(attributes){ attributes['strain_id'].blank? || attributes['porcentaje'].blank? }
    accepts_nested_attributes_for :enologist_wines, reject_if: ->(attributes){attributes['enologist_id'].blank? || attributes ['puntaje'].blank?}
    
    def to_s
        score
    end
    
end
