class Aluno < ActiveRecord::Base

  devise :database_authenticatable, :recoverable, 
    :rememberable, :trackable, :validatable

  validates :nome, :presence => true
  validates :identidade, :presence => true
  validates :nascimento, :presence => true
  validates :telefone, :presence => true

  default_scope :order => 'nome ASC'
  
  belongs_to :turma
  has_many   :boletins
  has_many   :resultados
  has_one    :usuario, :as => :autenticavel
  has_many   :avaliacoes, :through => :resultados
  has_many   :faltas
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nome, :identidade, :nascimento, :telefone, :responsavel, :foto
  
  after_update :criar_faltas
  
  def criar_faltas
    if turma_id_changed?
      turma.disciplina_professores.each do |dp|
        dp.faltas.create(:aluno => self)
      end
    end
  end
  
  def responsavel
    atr = read_attribute(:responsavel)
    atr.blank? ? read_attribute(:nome) : atr
  end
  
  def faltas_disciplina(dp)
    faltas.where(:disciplina_professor_id => dp).first || faltas.build
    #Falta.find_by_aluno_id_and_disciplina_professor_id(self,dp)
  end
end
