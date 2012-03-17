class Aluno::ProfessoresController < Aluno::BaseController
  def show
    @disciplina = current_aluno.turma.disciplinas.find params[:disciplina_id]
    @disciplinas_professor = @disciplina.disciplina_professores.where(:professor_id => params[:id]) 
  end
end
