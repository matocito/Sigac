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
  
  default_value_for :aulas_lecionadas, 0
  default_value_for :bimestre do
    1
  end
end
