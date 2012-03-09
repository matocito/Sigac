class Administrador::DisciplinasController < Administrador::AdminController
  inherit_resources
  
  respond_to :html, :js
  
  def add_professor
    @disciplina = Disciplina.find(params[:id])
    @disciplina_professor = @disciplina.disciplina_professores.build
    respond_with(@disciplina)
  end
end
