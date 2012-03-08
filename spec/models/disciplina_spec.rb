require 'spec_helper'

describe Disciplina do
  before do
    @disciplina = Factory.create(:disciplina)
  end
  
  subject { @disciplina }
  
  it { should belong_to :turma }
  it { should belong_to :materia }
  
  it { should validate_presence_of :turma_id }
  it { should validate_presence_of :materia_id }
  
  
  it { should have_many :disciplina_professores }
  it { should have_many(:professores).through(:disciplina_professores) } 
  it { should have_many(:avaliacoes).through(:disciplina_professores) }
  
  describe "#gerar_boletim" do
    before do
      
    end
    
    it "should calculate and save a boletim for each aluno" do
      @aluno = @disciplina.turma.alunos.first
      @boletim = FactoryGirl.build(:boletim, :aluno => @aluno)
      @boletim_gerado = @disciplina.gerar_boletim(@aluno)
      
      @boletim_gerado.media.should == @boletim.media
      @boletim_gerado.frequencia.should == @boletim.frequencia
      @boletim_gerado.disciplina.should == @boletim.disciplina
      @boletim_gerado.bimestre.should == @boletim.bimestre
      @boletim_gerado.serie.should == @boletim.serie
      @boletim_gerado.aluno.should == @boletim.aluno
    end
  end
end
