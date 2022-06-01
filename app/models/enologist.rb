class Enologist < ApplicationRecord
    has_many :enologist_wines
    has_many :wines, through: :enologist_wines, dependent: :destroy

    has_many :enologist_magazines
    has_many :magazines, through: :enologist_magazines, dependent: :destroy


    accepts_nested_attributes_for :enologist_wines, reject_if: ->(attributes){ attributes['wine_id'].blank? || attributes['score'].blank? }, allow_destroy: true
    
    def to_s
        name
    end
    
end
