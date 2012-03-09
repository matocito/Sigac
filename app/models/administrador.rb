class Administrador < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, 
    :rememberable, :validatable

  validates :nome, :presence => true
  validates :cpf, :uniqueness => true, :cpf => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  has_one :usuario, :as => :autenticavel
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nome, :cpf, :nascimento, :telefone, :foto
end
