class CreateOntologicalCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :ontological_categories do |t|
      t.string :uri, null: false, unique: true, index: true
    end
  end
end
