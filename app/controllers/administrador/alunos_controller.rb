class Administrador::AlunosController < Administrador::AdminController
  inherit_resources
  
  def new
    @aluno = Aluno.new
    @aluno.build_usuario
  end
end
