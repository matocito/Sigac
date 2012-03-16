class Professor::AvaliacoesController < Professor::BaseController
  inherit_resources
  
  belongs_to :disciplina_professor
end
