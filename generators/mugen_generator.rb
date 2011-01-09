class MugenGenerator < Rails::Generator::Base
  attr_reader :model_name
  
  def initialize(runtime_args, runtime_options = {})
    runtime_args << "user"  if runtime_args.empty?
    super
  end
    
  def manifest
     record do |m|
       
       # Initializer
       m.file 'config/initializers/mugen.rb', 'config/initializers/mugen.rb'

       # Controller
       m.directory 'app/controllers/mygengo'
       m.file "app/controllers/mygengo/account_controller.rb", "app/controllers/mygengo/account_controller.rb" 
       m.file "app/controllers/mygengo/comments_controller.rb", "app/controllers/mygengo/comments_controller.rb" 
       m.file "app/controllers/mygengo/jobs_controller.rb", "app/controllers/mygengo/jobs_controller.rb" 

       # Helpers
       m.file "app/helpers/mugen_helper.rb", "app/helpers/mugen_helper.rb"
       
       # Views
       m.file 'app/views/layouts/mygengo.html.erb', 'app/views/layouts/mygengo.html.erb'
       m.directory 'app/views/mygengo/account'
       m.directory 'app/views/mygengo/comments'
       m.directory 'app/views/mygengo/jobs'   
       m.directory 'public/stylesheets/mygengo'   
       m.directory 'public/images/mygengo'   
       m.file 'app/views/mygengo/account/index.haml', 'app/views/mygengo/account/index.haml'
       m.file 'app/views/mygengo/account/_balance.haml', 'app/views/mygengo/account/_balance.haml'
       m.file 'app/views/mygengo/account/_stats.haml', 'app/views/mygengo/account/_stats.haml'
       m.file 'app/views/mygengo/comments/_comment.haml', 'app/views/mygengo/comments/_comment.haml'
       m.file 'app/views/mygengo/comments/_form.haml', 'app/views/mygengo/comments/_form.haml'
       m.file 'app/views/mygengo/jobs/_comments.haml', 'app/views/mygengo/jobs/_comments.haml'
       m.file 'app/views/mygengo/jobs/_feedback.haml', 'app/views/mygengo/jobs/_feedback.haml'
       m.file 'app/views/mygengo/jobs/_revision.haml', 'app/views/mygengo/jobs/_revision.haml'
       m.file 'app/views/mygengo/jobs/index.haml', 'app/views/mygengo/jobs/index.haml'
       m.file 'app/views/mygengo/jobs/new.haml', 'app/views/mygengo/jobs/new.haml'
       m.file 'app/views/mygengo/jobs/reject_form.haml', 'app/views/mygengo/jobs/reject_form.haml'
       m.file 'app/views/mygengo/jobs/review_form.haml', 'app/views/mygengo/jobs/review_form.haml'
       m.file 'app/views/mygengo/jobs/revise_form.haml', 'app/views/mygengo/jobs/revise_form.haml'
       m.file 'app/views/mygengo/jobs/revision.haml', 'app/views/mygengo/jobs/revision.haml'
       m.file 'app/views/mygengo/jobs/show.haml', 'app/views/mygengo/jobs/show.haml'
       m.file 'public/stylesheets/mygengo/base.css', 'public/stylesheets/mygengo/base.css'
       m.file 'public/stylesheets/mygengo/mugen.css', 'public/stylesheets/mygengo/mugen.css'
       m.file 'public/stylesheets/mygengo/override.css', 'public/stylesheets/mygengo/override.css'
       m.file 'public/stylesheets/mygengo/scaffold.css', 'public/stylesheets/mygengo/scaffold.css'
       m.file 'public/stylesheets/mygengo/style.css', 'public/stylesheets/mygengo/style.css'
       # m.readme "USAGE"

       # Routes
       sentinel = 'ActionController::Routing::Routes.draw do |map|'
       new_routes = IO.read(File.dirname(__FILE__) + '/templates/config/routes.rb')
       
       m.gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |match|
         "#{match}\n #{new_routes}"
       end
    end
  end
end
