require 'spec_helper'

describe Resultado do
  before do
    @resultado = FactoryGirl.create(:resultado)
  end
  
  subject { @resultado }
  
  it { should validate_numericality_of :nota }
  it { should belong_to :aluno }
  it { should belong_to :avaliacao }
end
