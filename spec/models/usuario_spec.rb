require 'spec_helper'

describe Usuario do
  before do
    @usuario = FactoryGirl.create(:usuario)
  end
  
  subject { @usuario }
  
  describe "when usuario is an aluno" do
    before { @usuario_aluno = FactoryGirl.create(:usuario_aluno) }
    it { @usuario_aluno.autenticavel_type.should == Aluno.to_s }
  end
  
  describe "when usuario is a professor" do
    before do 
      @usuario_professor = FactoryGirl.create(:usuario_professor)
    end
    it { @usuario_professor.autenticavel_type.should == Professor.to_s }
  end
  
  it { should belong_to :autenticavel }
end
