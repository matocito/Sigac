class CreateHoras < ActiveRecord::Migration
  def self.up
    create_table :horas do |t|
      t.references :horario
      t.string :dia
      t.string :intervalo

      t.timestamps
    end
  end

  def self.down
    drop_table :horas
  end
end
