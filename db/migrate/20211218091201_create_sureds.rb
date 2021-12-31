class CreateSureds < ActiveRecord::Migration[6.1]
  def change
    create_table :sureds do |t|
      t.text :content
      t.string :time
      t.integer :like, default: 0
      t.integer :idnomber
      t.integer :bool

      t.timestamps
    end
  end
end
