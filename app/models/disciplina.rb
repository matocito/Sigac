class Disciplina < ActiveRecord::Base

  validates :turma_id, :presence => true
  validates :materia_id, :presence => true
  
  belongs_to :turma
  belongs_to :materia
  has_many   :disciplina_professores
  has_many   :professores, :through => :disciplina_professores
end
