class DisciplinaProfessor < ActiveRecord::Base
  validates :aulas_lecionadas, 
    :numericality => { :only_integer => true }
  validates :bimestre, 
    :numericality => { :only_integer => true },
    :inclusion => { :in => 1..4 }
  

  belongs_to :disciplina
  belongs_to :professor
  
  has_many :materiais_estudo, :class_name => 'MaterialEstudo'
  has_many :avaliacoes
  has_many :horarios
  has_many :faltas
  
  attr_accessor :aulas_do_dia
  
  validates :professor_id, :presence => true
  
  accepts_nested_attributes_for :disciplina
  accepts_nested_attributes_for :professor
  
  after_create :criar_faltas
  
  default_value_for :aulas_lecionadas, 0
  default_value_for :bimestre do
    1
  end
  
  def frequencia(aluno)
    total_faltas = faltas.where(:aluno_id => aluno).first.total
    if total_faltas == 0
      100
    else
      if aulas_lecionadas == 0
        0
      else
        100 - (total_faltas.to_f/aulas_lecionadas) * 100
      end
    end
  end
  
  def to_s
    "#{disciplina} / #{professor}"
  end
  
  def criar_faltas
    disciplina.turma.alunos.each do |aluno|
      faltas.create!(:aluno => aluno)
    end
  end
end
