class Administrador::DisciplinaProfessoresController < Administrador::AdminController
  inherit_resources
  
  def create
    @disciplina = Disciplina.find(params[:disciplina_id])
    @disciplina.disciplina_professores.create!(params[:disciplina_professor])
    
    redirect_to [:administrador, @disciplina.turma]
  end
  
  def destroy
    @disciplina = Disciplina.find(params[:disciplina_id])
    @dp = @disciplina.disciplina_professores.find(params[:id])
    @dp.destroy
    
    redirect_to [:administrador, @disciplina.turma]    
  end
end
