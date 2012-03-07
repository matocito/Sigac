require 'spec_helper'

describe Avaliacao do
  before do
    @avaliacao = FactoryGirl.create(:avaliacao)
  end
  
  subject { @avaliacao }
  
  it { should validate_presence_of :titulo }
  it { should validate_numericality_of :peso }
  it { should_not allow_value(0).for :peso }
  
  it { should belong_to :disciplina_professor }
end
