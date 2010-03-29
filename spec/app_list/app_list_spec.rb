require 'spec_helper'
require 'yaml'  
require 'adm'

module AppList
  describe "Adm" do
    let(:options)  { {:name => 'hel*', :platform => 'ruby'} }
    let(:filename)     { 'adm.yml' }

    describe "#load" do      
      it "loads the ADM from a yaml file" do
        yml_content = YAML.load_file(filename)
        adm_list ||= []
        yml_content.each do |value|
          a = AdmEntry.new
          a.load(value) 
          adm_list << a
        end  
        adm_list.extend(AdmEntries)  
        adm_list.entries.should include("name: hello, location: c:/my_apps/demo/hello_world")
        
        filtered_adm_list = adm_list.select do |adm|
          adm.matches?(options)
        end
        filtered_adm_list.extend(AdmEntries)        
        filtered_adm_list.entries.should include("name: hello, location: c:/my_apps/demo/hello_world")

        filtered_adm_list.entries.each{|item| puts item }
        
      end      
    end # start
    
  end
end