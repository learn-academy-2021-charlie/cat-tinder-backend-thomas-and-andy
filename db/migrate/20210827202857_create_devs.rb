class CreateDevs < ActiveRecord::Migration[6.1]
  def change
    create_table :devs do |t|
      t.string :name
      t.integer :age
      t.text :technologies
      t.text :skills
      t.text :enjoys
      t.text :img

      t.timestamps
    end
  end
end
