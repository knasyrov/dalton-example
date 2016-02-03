class Item < ActiveRecord::Base

  def method_missing(m, *args)
    if /^(\w+)=$/ =~ m 
      self.description ||= {}
      self.description[:"#{$1}"] = args[0]
    end
  end  
end
