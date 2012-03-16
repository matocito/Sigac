class Professor::DisciplinasController < Professor::BaseController
  inherit_resources
  
  belongs_to :turma
  
  def show
    @turma = Turma.find(params[:turma_id])
    @disciplina = @turma.disciplinas.find(params[:id])
    @disciplinas_professor = current_professor.
      disciplina_professores.where(:disciplina_id => @disciplina)
    
  end
end
