module Ontological
  class Category < ApplicationRecord
    has_many :subjects, class_name: 'Relationship', foreign_key: 'object_id', inverse_of: :object
#    has_many :children, class_name: 'Category', through: :subjects, source: :subject
    has_many :objects, class_name: 'Relationship', foreign_key: 'subject_id', inverse_of: :subject
#    has_many :parents, class_name: 'Category', through: :objects, source: :object
    has_many :translations, as: :translatable, class_name: 'Multilingual::Translation', dependent: :destroy

    validates :uri, presence: true,
                    uniqueness: true,
                    format: { with: /[[:lower:]]+/,
                      message: 'only allows lowercase letters' }
    validates_associated :translations

    # TODO: include is_a or instance_of WHERE clause
    scope :roots, -> { Category.joins('INNER JOIN (SELECT DISTINCT object_id FROM ontological_category_relationships EXCEPT SELECT DISTINCT subject_id FROM ontological_category_relationships) AS sub ON sub.object_id = ontological_categories.id') }
  end
end
