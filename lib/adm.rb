class AdmEntry
  attr_accessor :name, :location, :categories, :platforms, :runtype, :environment, :os, :maturity, :origin, :use 
  
  def initialize()
    @location = 'unknown'         
    @name = 'unknown'    
    @categories = []
    @platforms = []    
    @runtype = []
    @environment = []    
    @os = []   
    @maturity = []
    @origin = []
    @use = []    
  end

  def has_name?(name)
    regexp = case name 
    when String
      /#{normalize(name)}/ 
    when Regexp
      name
    end   
    puts regexp
    name ? self.name =~ regexp : true 
    rescue
      true   
  end

  def has_category?(category)
    category ? categories.include?(category) : true    
  end

  def has_platform?(platform)
    platform ? platforms.include?(platform) : true    
  end

  def has_runtype?(runtype)
    runtype ? runtypes.include?(runtype) : true    
  end

  def has_environment?(environment)
    environment ? environments.include?(environment) : true    
  end

  def has_os?(os)
    os ? os.include?(os) : true    
  end

  def has_maturity?(maturity)
    maturity ? maturities.include?(maturity) : true    
  end

  def has_origin?(origin)
    origin ? origins.include?(origin) : true    
  end

  def has_use?(use)
    use ? usees.include?(use) : true    
  end
  
  def matches?(options)
    has_name?(options[:name]) && has_category?(options[:category]) && has_platform?(options[:platform]) && has_runtype?(options[:runtype]) && has_environment?(options[:environment]) && has_os?(options[:os]) && has_maturity?(options[:maturity]) && has_origin?(options[:origin]) && has_use?(options[:use])
  end


  def load(yml_entry)                        
    instance_variables.each do |iv|               
      key = iv.to_s[1..-1]      
      value = yml_entry[key]         
      self.instance_variable_set(iv, value)
    end
  end 
  
  def to_s
    puts "name: #{name}, location: #{location}"
  end
  
protected
  
  def normalize(name)
    name = name.gsub /\*/, '.*'
    name = name.gsub /\?/, '.?'      
    name = name.gsub /\+/, '.+'      
  end
  
end           






