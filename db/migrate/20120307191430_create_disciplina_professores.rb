class CreateDisciplinaProfessores < ActiveRecord::Migration
  def self.up
    create_table :disciplina_professores do |t|
      t.references :disciplina
      t.references :professor

      t.timestamps
    end
  end

  def self.down
    drop_table :disciplina_professores
  end
end
