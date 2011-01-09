class MugenGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def install  
    # Create directories 
    %W( 
      app/controllers/mygengo
      app/views/mygengo/account
      app/views/mygengo/comments
      app/views/mygengo/jobs
    ).each {|dir|
      directory dir 
    }
    
    # Copy files 
    %W(
      config/initializers/mugen.rb
      app/controllers/mygengo/account_controller.rb
      app/controllers/mygengo/comments_controller.rb
      app/controllers/mygengo/jobs_controller.rb
      app/helpers/mugen_helper.rb
      app/views/layouts/mygengo.html.erb
      app/views/mygengo/account/index.haml
      app/views/mygengo/account/_balance.haml
      app/views/mygengo/account/_stats.haml
      app/views/mygengo/comments/_comment.haml
      app/views/mygengo/comments/_form.haml
      app/views/mygengo/jobs/_comments.haml
      app/views/mygengo/jobs/_feedback.haml
      app/views/mygengo/jobs/_revision.haml
      app/views/mygengo/jobs/index.haml
      app/views/mygengo/jobs/new.haml
      app/views/mygengo/jobs/reject_form.haml
      app/views/mygengo/jobs/review_form.haml
      app/views/mygengo/jobs/revise_form.haml
      app/views/mygengo/jobs/revision.haml
      app/views/mygengo/jobs/show.haml      
    ).each do |filename|
      copy_file filename, filename
    end 
    
    # Add routes
    sentinel = '::Application.routes.draw do'
    new_routes = IO.read(File.dirname(__FILE__) + '/templates/config/routes3.rb')
    
    gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
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