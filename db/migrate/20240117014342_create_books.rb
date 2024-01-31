class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :ndc
      t.string :name
      t.string :auther
      t.integer :price
      t.string :publisher
      t.date :published
      t.text :notes

      t.timestamps
    end
  end
end
