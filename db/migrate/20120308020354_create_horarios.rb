class CreateHorarios < ActiveRecord::Migration
  def self.up
    create_table :horarios do |t|
      t.references :turma
      t.references :disciplina_professor
      t.references :hora
      
      t.timestamps
    end
  end

  def self.down
    drop_table :horarios
  end
end
