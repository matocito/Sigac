class Aluno < ActiveRecord::Base
  validates :nome, :presence => true
  validates :identidade, :presence => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  belongs_to :turma
  has_many   :boletins
  has_many   :resultados
  has_one    :usuario, :as => :autenticavel
  has_many   :avaliacoes, :through => :resultados
  
  accepts_nested_attributes_for :usuario
  
  def responsavel
    atr = read_attribute(:responsavel)
    atr.blank? ? read_attribute(:nome) : atr
  end
end
