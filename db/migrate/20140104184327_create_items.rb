class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :url
      t.integer :visits, default: 0

      t.timestamps
    end
  end
end
