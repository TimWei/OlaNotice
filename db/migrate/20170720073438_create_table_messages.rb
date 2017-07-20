class CreateTableMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
        t.integer :service_id
        t.text :body      
        t.timestamps null: false
        t.boolean :is_delete, default: false
    end
  end
end
