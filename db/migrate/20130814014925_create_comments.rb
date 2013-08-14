class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post # sets up a foreign key column for the association between the two models

      t.timestamps
    end

    add_index :comments, :post_id # sets up an index for the association column
  end
end
