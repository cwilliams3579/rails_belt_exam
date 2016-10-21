class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product
      t.string :seller
      t.date :date
      t.float :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
