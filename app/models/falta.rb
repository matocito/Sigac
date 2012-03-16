class Falta < ActiveRecord::Base
  belongs_to :aluno
  belongs_to :disciplina_professor
  
  default_value_for :total, 0
  
  def to_s
    total
  end
end
