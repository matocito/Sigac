#encoding: UTF-8

class Turma < ActiveRecord::Base
  validates :sala, :presence => true
  
  belongs_to  :serie
  belongs_to  :ano
  has_many    :disciplinas
  has_many    :alunos
  has_many    :horarios
  
  after_create :criar_disciplinas
  after_create :criar_horarios
  
  def dias_horas
    Hora.where(:horario_id => horario_ids).group_by(&:dia)
  end
  
  def dias_aulas
    dias_horas.keys
  end
  
  def horas_aulas
    Hora.where(:horario_id => horario_ids).group_by(&:intervalo)
  end
  
  #protected
  def criar_horarios
    dias       = %w(Segunda-Feira Terça-Feira Quarta-Feira Quinta-Feira Sexta-Feira)
    intervalos = ['13:00 - 13:50', '13:50 - 14:40', '14:40 - 15:30', '15:30 - 16:00',
      '16:00 - 16:50', '16:50 - 17:40'] 
    dias.each do |dia|
      horario = horarios.build
      intervalos.each do |intervalo|
        horario.horas.build(:dia => dia, :intervalo => intervalo)  
        horario.save!
      end
    end
  end
  
  def criar_disciplinas
    serie.materias.each do |materia|
      disciplinas.create(:turma => self, :materia => materia)
    end
  end
end
