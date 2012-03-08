require 'spec_helper'

describe DisciplinaProfessor do
  before do
    @disciplina_professor = Factory.create(:disciplina_professor)
  end

  it { should validate_numericality_of :aulas_lecionadas }
  it { should validate_numericality_of :bimestre }
  it { should ensure_inclusion_of(:bimestre).in_range(1..4) }
  
  it { should belong_to :disciplina }
  it { should belong_to :professor }
  it { should have_many :materiais_estudo }
  it { should have_many :avaliacoes }
end
