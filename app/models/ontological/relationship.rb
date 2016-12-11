module Ontological
  class Relationship < ApplicationRecord
    belongs_to :subject, class_name: 'Category', inverse_of: :objects
    belongs_to :predicate, class_name: 'Category'
    belongs_to :object, class_name: 'Category', inverse_of: :subjects

    validates :subject, :predicate, :object, presence: true
  end
end
