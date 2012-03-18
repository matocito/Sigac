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
  
  def horario
    turma.horarios.group_by{|horario| horario.hora.dia}
  end
  
  def aula_horario(dia, intervalo)
    Horario.includes(:hora).where(:turma_id => turma.id, 
    'horas.intervalo' => intervalo, 'horas.dia' => dia).first.disciplina_professor || '-'
  end
  
  def faltas_disciplina_total(disciplina, bimestre)
    faltas.includes(:disciplina_professor).
      where('disciplina_professores.disciplina_id' => disciplina, 'disciplina_professores.bimestre' => bimestre).sum(:total)
  end
  
  def frequencia(disciplina, bimestre)
    total_aulas = disciplina.total_aulas(bimestre)
    return 0 if total_aulas == 0

    total_faltas = faltas_disciplina_total(disciplina, bimestre)
    (total_faltas.to_f / total_aulas) * 100
  end
end
