class Administrador::HorariosController < Administrador::AdminController
  inherit_resources
  
  def update
    #@horario = Horario.new(params[:horario])
    update!{ edit_administrador_turma_path @horario.turma }
  end
end
