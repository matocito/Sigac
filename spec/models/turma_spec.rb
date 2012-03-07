require 'spec_helper'

describe Turma do
  before do
    @turma = Factory.create(:turma)
  end
  
  subject { @turma }
  
  it { should respond_to(:sala) }
  it { should respond_to(:nome) }
end
