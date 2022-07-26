class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.float :price
      t.integer :status
      t.integer :frequency
      t.string :tea_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
