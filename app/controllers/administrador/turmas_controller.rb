class Administrador::TurmasController < Administrador::AdminController
  inherit_resources
  
  def horario
    @turma = Turma.find(params[:id])
  end
end
