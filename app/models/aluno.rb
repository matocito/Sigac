class Aluno < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, 
    :rememberable, :trackable, :validatable

  validates :nome, :presence => true
  validates :identidade, :presence => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  belongs_to :turma
  has_many   :boletins
  has_many   :resultados
  has_one    :usuario, :as => :autenticavel
  has_many   :avaliacoes, :through => :resultados
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nome, :identidade, :nascimento, :telefone, :responsavel, :foto
  
  def responsavel
    atr = read_attribute(:responsavel)
    atr.blank? ? read_attribute(:nome) : atr
  end
end
