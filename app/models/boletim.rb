class Boletim < ActiveRecord::Base
  validates :media, :numericality => true
  validates :frequencia, :numericality => true  
  validates :bimestre, :numericality => true
  validates :ano, :numericality => true
  validates :disciplina, :presence => true
  validates :serie, :presence => true
  
  belongs_to :aluno
end
