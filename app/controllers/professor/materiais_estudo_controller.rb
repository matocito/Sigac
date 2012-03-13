class Professor::MateriaisEstudoController < Professor::BaseController
  inherit_resources
  
  belongs_to :disciplina_professor
  
  def create
    create! { [:professor,@disciplina_professor] }
  end
end
