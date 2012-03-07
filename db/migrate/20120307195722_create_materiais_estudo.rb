class CreateMateriaisEstudo < ActiveRecord::Migration
  def self.up
    create_table :materiais_estudo do |t|
      t.string :titulo
      t.references :disciplina_professor

      t.timestamps
    end
  end

  def self.down
    drop_table :materiais_estudo
  end
end
