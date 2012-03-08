class CreateResultados < ActiveRecord::Migration
  def self.up
    create_table :resultados do |t|
      t.float :nota
      t.references :avaliacao
      t.references :aluno

      t.timestamps
    end
  end

  def self.down
    drop_table :resultados
  end
end
