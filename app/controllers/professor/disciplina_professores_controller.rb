class Professor::DisciplinaProfessoresController < Professor::BaseController
  def show
    @disciplina_professor = 
      current_professor.disciplina_professores.find(params[:id])
    
    respond_with @disciplina_professor
  end
  
  def aulas_lecionadas
    @disciplina_professor = 
      current_professor.disciplina_professores.find(params[:id])
      
    @disciplina_professor.aulas_lecionadas += 
      params[:disciplina_professor][:aulas_do_dia].to_i
    @disciplina_professor.save
  end
end
