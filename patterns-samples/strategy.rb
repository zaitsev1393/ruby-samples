# Extending array (perhaps overriding but not sure)

class Array
  def to_xml
    xml = ''
    self.each { |attr| attr.each { |k,v| xml += "<#{k}>#{v}</#{k}>"} }
    xml
  end
end

# Strategy (the same inputs and xml/json output depending on given strategy)

class Review
	
  attr_accessor :title, :author, :rate
  attr_accessor :logger

  def initialize(title, author, rate, logger=JSONReviewLogger.new)
    @title = title
    @author = author
    @rate = rate
    @logger = logger
  end

  def info
    info = []
    instance_variables.each do |instance_variable| 
      info << { instance_variable.to_s.sub('@', '') => instance_variable_get(instance_variable) } if instance_variable != :@logger # could be included but i think it would be clearer this way
    end
    info
  end

  def print_review	
    logger.print_result(self)
  end

end

class JSONReviewLogger
  require 'json'
  def print_result(context)
    context.info.to_json
  end
end

class XMLReviewLogger
  def print_result(context)
    context.info.to_xml
  end
end

r = Review.new("title 1", 'author 1', '5.0') #JSON as default

p r.print_review
# "[{\"title\":\"title 1\"},{\"author\":\"author 1\"},{\"rate\":\"5.0\"}]"

r.logger = XMLReviewLogger.new

p r.print_review
# "<title>title 1</title><author>author 1</author><rate>5.0</rate>"