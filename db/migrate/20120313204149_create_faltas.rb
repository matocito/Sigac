class CreateFaltas < ActiveRecord::Migration
  def self.up
    create_table :faltas do |t|
      t.integer :total
      t.references :aluno
      t.references :disciplina_professor

      t.timestamps
    end
  end

  def self.down
    drop_table :faltas
  end
end
