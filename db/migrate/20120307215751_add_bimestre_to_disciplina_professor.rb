class AddBimestreToDisciplinaProfessor < ActiveRecord::Migration
  def self.up
    add_column :disciplina_professores, :bimestre, :integer
  end

  def self.down
    remove_column :disciplina_professores, :bimestre
  end
end
