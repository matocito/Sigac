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
  has_many :horarios, :through => :disciplina_professores
  has_one  :usuario, :as => :autenticavel
  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nome, :cpf, :nascimento, :telefone, :foto
  
  def turmas
    disciplina_professores.group_by { |dp| dp.disciplina.turma } 
  end
  
  def dias_aula
    Hora.all.group_by(&:dia)
  end
  
  def aulas_horario(dia, intervalo)
    Horario.includes(:hora).where(:disciplina_professor_id => disciplina_professor_ids, 
    'horas.intervalo' => intervalo, 'horas.dia' => dia)
  end
  
  def teste_horario
    Horario.where(:disciplina_professor_id => disciplina_professor_ids).
      group_by { |h| h.hora.dia }
  end
  
  def horario_agrupado
    Horario.includes(:hora).order('horas.intervalo').
      where(:disciplina_professor_id => disciplina_professor_ids).
      group_by { |h| h.hora.intervalo }
  end
  
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
