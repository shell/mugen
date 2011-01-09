module MugenHelper
  def d(timestamp)
    if timestamp
      Time.at(timestamp).to_s(:short)
    end
  end
  
  def eta(timestamp)    
    time_ago_in_words(Time.at(timestamp)) unless timestamp.empty?
  end
end