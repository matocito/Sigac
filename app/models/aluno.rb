class Aluno < ActiveRecord::Base
  validates :nome, :presence => true
  validates :identidade, :presence => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  belongs_to :turma
  has_many :boletins
end
