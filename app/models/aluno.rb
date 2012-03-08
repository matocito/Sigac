class Aluno < ActiveRecord::Base
  validates :nome, :presence => true
  validates :identidade, :presence => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  belongs_to :turma
  has_many   :boletins
  has_many   :resultados
  has_one    :usuario, :as => :autenticavel
end
