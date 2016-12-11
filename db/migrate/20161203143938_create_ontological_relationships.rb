class CreateOntologicalRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :ontological_relationships do |t|
      t.integer :subject_id, null: false
      t.integer :predicate_id, null: false
      t.integer :object_id, null: false
    end

    add_foreign_key :ontological_relationships, :ontological_categories, column: :subject_id
    add_foreign_key :ontological_relationships, :ontological_categories, column: :predicate_id
    add_foreign_key :ontological_relationships, :ontological_categories, column: :object_id
  end
end
