class Avaliacao < ActiveRecord::Base
  validates :titulo, :presence => true
  validates :peso, :numericality => 
    { :only_integer => true, :greater_than => 0 }

  belongs_to :disciplina_professor
  has_many   :resultados
  
  after_create :criar_resultados
  
  #protected
  def criar_resultados
    disciplina_professor.disciplina.turma.alunos.each do |aluno|
      resultados.create!(:aluno => aluno, :nota => 0)
    end
  end
  
  def nota_aluno(aluno)
    resultados.includes(:aluno).where('alunos.id' => aluno).first.nota
  end
  
end
