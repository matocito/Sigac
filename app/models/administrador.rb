class Administrador < ActiveRecord::Base
  validates :nome, :presence => true
  validates :cpf, :uniqueness => true, :cpf => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  has_one :usuario, :as => :autenticavel
end
