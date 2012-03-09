class Turma < ActiveRecord::Base
  validates :sala, :presence => true
  
  belongs_to  :serie
  belongs_to  :ano
  has_many    :disciplinas
  has_many    :alunos
  has_many    :horarios
  
  after_create :criar_disciplinas
  
  protected
  def criar_disciplinas
    serie.materias.each do |materia|
      disciplinas.create(:turma => self, :materia => materia)
    end
  end
end
