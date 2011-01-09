class Hash
  
  def sorted_hash
    self.keys.sort
  end
  
  # This hack to enables CGI::escape instead of URI.encode in to_params
  def normalize_param(key, value)
    param = ''
    stack = []

    if value.is_a?(Array)
      param << value.map { |element| normalize_param("#{key}[]", element) }.join
    elsif value.is_a?(Hash)
      stack << [key,value]
    else
      param << "#{key}=#{CGI::escape(value.to_s)}&"            
    end

    stack.each do |parent, hash|
      hash.each do |key, value|
        if value.is_a?(Hash)
          stack << ["#{parent}[#{key}]", value]
        else
          param << normalize_param("#{parent}[#{key}]", value)
        end
      end
    end

    param
  end
end