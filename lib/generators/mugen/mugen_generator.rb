class MugenGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def install  
    # Create directories 
    %W( 
      app/controllers/mygengo
      app/views/mygengo/account
      app/views/mygengo/comments
      app/views/mygengo/jobs
      public/stylesheets/mygengo
      public/images/mygengo
    ).each {|dir|
      directory dir 
    }
    
    # Copy files 
    %W(
      config/initializers/mugen.rb    
      app/helpers/mugen_helper.rb
      app/views/layouts/mygengo.html.erb
    ).each do |filename|
      copy_file filename, filename
    end 
    
    # Add routes
    sentinel = '::Application.routes.draw do'
    new_routes = IO.read(File.dirname(__FILE__) + '/templates/config/routes3.rb')
    
    gsub_file 'config/routes3.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
      "#{match}\n #{new_routes}"
    end
    
    

    puts MugenGenerator.description
  end 

  def self.description
    <<-DESCRIPTION
*******************************************************************    
MyGengo scaffold complete


*******************************************************************    
    DESCRIPTION
  end
  desc(description)

end