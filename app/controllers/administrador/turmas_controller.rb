class Administrador::TurmasController < Administrador::AdminController
  inherit_resources
  
  def horario
    @turma = Turma.find(params[:id])
  end
  
  def add_aluno
    @aluno = Aluno.find(params[:aluno][:id])
    @aluno.update_attribute(:turma_id, params[:id])
    
    redirect_to administrador_turma_path(params[:id])
  end
  
  def remover_aluno
    @turma = Turma.find(params[:id])
    @turma.alunos.delete Aluno.find(params[:aluno])
    
    redirect_to administrador_turma_path @turma
  end
end
