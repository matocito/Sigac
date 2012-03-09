class Administrador::AlunosController < ApplicationController
  inherit_resources
  
  def new
    @aluno = Aluno.new
    @aluno.build_usuario
  end
end
