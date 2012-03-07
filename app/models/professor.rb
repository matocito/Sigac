class Professor < ActiveRecord::Base
  validates :nome, :presence => true
  validates :cpf, :uniqueness => true, :cpf => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  has_many :disciplina_professores
  has_many :materiais_estudo, :through => :disciplina_professores
  has_many :avaliacoes, :through => :disciplina_professores
  
end
