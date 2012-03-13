class Professor::DisciplinaProfessoresController < Professor::BaseController
  def show
    @disciplina_professor = 
      current_professor.disciplina_professores.find(params[:id])
    
    respond_with @disciplina_professor
  end
end
