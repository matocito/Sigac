class Administrador::HorariosController < Administrador::AdminController
  inherit_resources
  
  def update
    #@horario = Horario.new(params[:horario])
    update!{ horario_administrador_turma_path @horario.turma }
  end
end
