class Magazine < ApplicationRecord
    has_many :enologist_magazines
    has_many :enologists, through: :enologist_magazines, dependent: :destroy

    validates :name, presence: true
 
    accepts_nested_attributes_for :enologist_magazines, reject_if: ->(attributes){ attributes['enologist_id'].blank? || attributes['editor', 'escritor', 'critico'].blank? }, allow_destroy: true

end
