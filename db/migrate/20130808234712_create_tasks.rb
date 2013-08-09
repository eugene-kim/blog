class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :complete, default: false, null: false
      t.string :name

      t.timestamps
    end
  end
end
