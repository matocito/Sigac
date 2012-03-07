class AddAulasLecionadasToDisciplinaProfessor < ActiveRecord::Migration
  def self.up
    add_column :disciplina_professores, :aulas_lecionadas, :integer
  end

  def self.down
    remove_column :disciplina_professores, :aulas_lecionadas
  end
end
