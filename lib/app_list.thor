require 'thor/group'
require 'yaml'
require 'adm'

class AppList < Thor::Group
  include Thor::Actions

  # Define arguments 
  argument :name, :optional => true, :desc => 'regular expression to filter name on'

  # games, utils
  class_option :category, :type => :array, :default => [], :aliases => '-c', :desc => 'filter on categories', :banner => 'cat1 cat2'  

  # ruby, java
  class_option :platform, :type => :array, :default => [], :aliases => '-p', :desc => 'filter on platforms', :banner => 'platf1 platf2'  

  # native, browser
  class_option :runtype, :type => :array, :default => [], :aliases => '-r', :desc => 'filter on categories', :banner => 'rt1 rt2'     
  
  # cli, desktop, mobile, other                
  class_option :environment, :type => :array, :default => [], :aliases => '-e', :desc => 'filter on categories', :banner => 'env1 env2'  

  # windows, unix, ...
  class_option :os, :type => :array, :default => [], :desc => 'filter on categories', :banner => 'os1 os2'      
  
  # fun, prof, other
  class_option :use, :type => :array, :default => [], :aliases => '-u', :desc => 'filter on categories', :banner => 'use1 use2'      

  # mine, foreign
  class_option :origin, :type => :array, :default => [], :aliases => '-o', :desc => 'filter on categories', :banner => 'o1 o2'       

  # incubation, young, mature
  class_option :maturity, :type => :array, :default => [], :aliases => '-m', :desc => 'filter on categories', :banner => 'm1 m2'      


  def load_repo
    repo_root = ENV['ADM_DB'] || File.join(ENV['HOME'], '.adm')
    filename = File.join(repo_root, 'adm_repo.yml')
    yml_content = YAML.load_file(filename)
    adm_list ||= []
    yml_content.each do |key, value|
      a = AdmEntry.new
      a.load(value) 
      adm_list << a
    end    
  end   
  
  def search_repo       
    filtered_adm_list = adm_list.select do |adm|
      adm.matches?(options)
    end
  end

  def display_search_results         
    filtered_adm_list.each{|item| puts "App: #{item.name}, Location: #{item.location}" }
  end

protected
  attr_accessor adm_list, filtered_adm_list
end
                  

apps:list