class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.boolean :complete
      t.belongs_to :group
      t.belongs_to :user

      t.timestamps
    end
  end
end
