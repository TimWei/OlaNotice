class CreateTableService < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
        t.string :name
        t.string :access_token      
        t.timestamps null: false
        t.boolean :is_delete, default: false
    end
  end
end
