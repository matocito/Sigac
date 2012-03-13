class Administrador::DisciplinaProfessoresController < Administrador::AdminController
  inherit_resources
  
  def create
    @disciplina = Disciplina.find(params[:disciplina_id])
    @professor = Professor.find(params[:disciplina_professor][:professor_id])
    
    bimestres = params[:disciplina_professor][:bimestre].reject(&:empty?).map(&:to_i)
    bimestres.each do |bimestre|
      @disciplina.adicionar_professor(@professor, bimestre)
    end
    
    redirect_to [:administrador, @disciplina.turma]
  end
  
  def destroy
    @disciplina = Disciplina.find(params[:disciplina_id])
    @dp = @disciplina.disciplina_professores.find(params[:id])
    @dp.destroy
    
    redirect_to [:administrador, @disciplina.turma]    
  end
end
