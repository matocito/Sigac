class Administrador::AlunosController < Administrador::AdminController
  inherit_resources
  respond_to :html, :json
  
  def index
    if params[:term].present?
      @alunos = Aluno.where('nome like ?', "%#{params[:term]}%")
    else
      @alunos = Aluno.all
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @alunos.map { |a| {:id => a.id, :nome => a.nome}}}
    end
  end
end
