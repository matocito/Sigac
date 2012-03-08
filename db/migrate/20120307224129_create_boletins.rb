class CreateBoletins < ActiveRecord::Migration
  def self.up
    create_table :boletins do |t|
      t.float :media
      t.integer :frequencia
      t.string :disciplina
      t.integer :bimestre
      t.integer :ano
      t.string :serie
      t.references :aluno

      t.timestamps
    end
  end

  def self.down
    drop_table :boletins
  end
end
