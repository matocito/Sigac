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
 
  def gerar_boletim(bimestre)
    turma.alunos.each do |aluno|
      gerar_boletim_aluno(aluno, bimestre)
    end
  end
 
  def gerar_boletim_aluno(aluno, bimestre)
    return false if aluno.resultados.empty?
    
    boletim = Boletim.new.tap do |b|
      b.aluno = aluno
      b.media = media_aluno(aluno, bimestre)
      b.frequencia = aluno.frequencia(self, bimestre)
      b.disciplina = materia.nome
      b.bimestre   = bimestre 
      b.ano        = Time.now.strftime('%Y')
      b.serie      = turma.serie.titulo 
    end
    
    boletim.save
  end
  
  def media_aluno(aluno, bimestre)
    resultados = aluno.resultados.includes(:avaliacao => :disciplina_professor).
      where('disciplina_professores.disciplina_id' => self, 
      'disciplina_professores.bimestre' => bimestre) 
    
    notas = resultados.map { |r| r.avaliacao.peso * r.nota }.sum
    peso = resultados.map { |r| r.avaliacao.peso }.sum
    
    if notas == 0
      0.0
    else
      notas.to_f/peso
    end
  end
  
  def total_aulas(bimestre)
    disciplina_professores.where(:bimestre => bimestre).sum(:aulas_lecionadas)
  end
  
  def to_s
    materia.nome
  end
  
  def avaliacoes_bimestre(bimestre)
    avaliacoes.includes(:disciplina_professor).where('disciplina_professores.bimestre' => bimestre)
  end
  
end
