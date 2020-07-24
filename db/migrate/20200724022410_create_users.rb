class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :created_at
      t.date :updated_at

      t.timestamps null: false
    end
  end
end
