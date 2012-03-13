class Disciplina < ActiveRecord::Base

  validates :turma_id, :presence => true
  validates :materia_id, :presence => true
  
  belongs_to :turma
  belongs_to :materia
  has_many   :disciplina_professores
  has_many   :professores, :through => :disciplina_professores
  has_many   :avaliacoes, :through => :disciplina_professores
  
  def adicionar_professor(professor, bimestre)
    disciplina_professores.create!(:professor => professor, :bimestre => bimestre)
  end
  
  def gerar_boletim(aluno)
    
    raise "error" if aluno.resultados.empty?
    
    notas = aluno.resultados.map { |r| r.avaliacao.peso * r.nota }
    
    media = notas.sum / 10
    
    
    boletim = Boletim.new :media => media, :frequencia => 89,
      :disciplina => 'Biologia', :bimestre => 2, :ano => 2011,
      :serie => '2 Ano', :aluno => aluno
    boletim
  end
  
  def to_s
    materia.nome
  end
  
end
