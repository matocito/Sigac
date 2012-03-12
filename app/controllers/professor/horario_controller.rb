class Professor::HorarioController < Professor::BaseController
  def index
    @professor = current_professor
  end
end
