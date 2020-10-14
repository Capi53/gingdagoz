class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.int :id
      t.int :roll_id
      t.text :name
      t.text :mail
      t.text :password

      t.timestamps
    end
  end
end
