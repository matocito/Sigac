class Professor < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, 
    :rememberable, :trackable, :validatable

  validates :nome, :presence => true
  validates :cpf, :uniqueness => true, :cpf => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true
  
  has_many :disciplina_professores
  has_many :materiais_estudo, :through => :disciplina_professores
  has_many :avaliacoes, :through => :disciplina_professores
  has_many :disciplinas, :through => :disciplina_professores
  has_one  :usuario, :as => :autenticavel
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nome, :cpf, :nascimento, :telefone, :foto
  
  def to_s
    nome
  end
  
  def self.disponiveis_para_disciplina(disciplina)
    ids = Disciplina.find(disciplina).professores.map(&:id)
    if ids.empty?
      all
    else
      where('id not in (?)', ids)
    end
  end
  
  def as_json(options={})
    { :id => id, :nome => nome }
  end
end
