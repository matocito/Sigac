class CreateMaterias < ActiveRecord::Migration
  def self.up
    create_table :materias do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :materias
  end
end
