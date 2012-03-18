#encoding: UTF-8

class Turma < ActiveRecord::Base
  validates :sala, :presence => true
  
  belongs_to  :serie
  belongs_to  :ano
  has_many    :disciplinas
  has_many    :disciplina_professores, :through => :disciplinas
  has_many    :alunos
  has_many    :horarios
  
  after_create :criar_disciplinas
  after_create :criar_horarios
  
  def gerar_boletim(bimestre)
    disciplinas.each do |disciplina|
      disciplina.gerar_boletim(bimestre)
    end
  end
  
  def dias_horas
    Hora.all.group_by(&:dia)
  end
  
  def dias_aulas
    dias_horas.keys
  end
  
  def horas_aulas
    horarios.group_by { |h| h.hora.intervalo }
  end
  
  def professores
    DisciplinaProfessor.where(:disciplina_id => disciplina_ids)
  end
  
  def to_s
    "#{nome} - #{serie} #{sala}"
  end
  
  #protected
  def criar_horarios
    Hora.find_each do |hora|
      horarios.create!(:hora => hora)
    end 
  end
  
  def criar_disciplinas
    serie.materias.each do |materia|
      disciplinas.create(:turma => self, :materia => materia)
    end
  end
end
