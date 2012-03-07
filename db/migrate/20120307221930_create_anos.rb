class CreateAnos < ActiveRecord::Migration
  def self.up
    create_table :anos do |t|
      t.integer :ano
      t.boolean :aberto

      t.timestamps
    end
  end

  def self.down
    drop_table :anos
  end
end
