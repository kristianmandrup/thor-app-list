require 'spec_helper'

module AppList
  describe Basic do
    let(:output)  {double('output').as_null_object}
    let(:game)    {Game.new(output)}

    describe "#start" do      
      it "starts the app" do
        output.should_receive(:puts).with("Welcome to #{app_name}!")
        game.start('1234')
      end      
    end # start
  
    context "logged in" do
      describe "#welcome" do          
        # ...
      end  
    end
  
  end
end