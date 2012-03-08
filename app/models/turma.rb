class Turma < ActiveRecord::Base
  validates :sala, :presence => true
  
  belongs_to  :serie
  belongs_to  :ano
  has_many    :disciplinas
  has_many    :alunos
  has_many    :horarios
end
