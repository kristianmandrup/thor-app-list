require 'yaml'
require 'adm'

options ={:name => 'bl?_*1+', :platform => 'ruby', :os => 'mobile'}

filename = 'adm.yml'
yml_content = YAML.load_file(filename)
adm_list ||= []
yml_content.each do |value|
  a = AdmEntry.new
  a.load(value) 
  adm_list << a
end    

filtered_adm_list = adm_list.select do |adm|
  adm.matches?(options)
end

filtered_adm_list.each{|item| puts "App: #{item.name}, Location: #{item.location}" }