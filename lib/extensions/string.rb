require 'rubygems'
require 'active_support'

class String
  def camelize(first_letter = :upper)
    case first_letter
      when :upper then ActiveSupport::Inflector.camelize(self, true)
      when :lower then ActiveSupport::Inflector.camelize(self, false)
    end
  end
  
  def underscore
    ActiveSupport::Inflector.underscore(self)
  end
  
  
  def constantize
    ActiveSupport::Inflector.constantize(self)
  end
  
  # pluralizes a string and turns it into a symbol
  # Example:
  #  "apple".pluralize_to_sym    # => :apples
  def pluralize_to_sym
    self.pluralize.to_sym
  end
  
end
 
module ActiveSupport
  module Inflector
    extend self
 
    def camelize(lower_case_and_underscored_word, first_letter_in_uppercase = true)
      if first_letter_in_uppercase
        lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
      else
        lower_case_and_underscored_word.to_s[0].chr.downcase + camelize(lower_case_and_underscored_word)[1..-1]
      end
    end
  end
end