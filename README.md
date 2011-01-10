## Introduction
  Mugen is API wrapper for MyGengo(<http://mygengo.com/>) and scaffold generator for existing rails app
   
## Installation
### Rails 2.x
  Add gems to config/environment.rb
    config.gem 'haml'
    config.gem 'mugen'
    
  Next install gems via 
    gem install mugen
    
  or 
    rake gems:install
    
  Next generate scaffold
    
    $ script/generate mugen
    
  Configure API keys in config/initializers/mugen.rb:
    Mugen.api_key = ''
    Mugen.private_key = ''

  Start server and enjoy
  
### Rails 3.x

  Add gems to your Gemfile and bundle install it:
    gem 'haml'
    gem 'mugen'
  
  Generate scaffold:
    $ rails generate mugen
    
  Configure API keys in config/initializers/mugen.rb:
    Mugen.api_key = ''
    Mugen.private_key = ''
  
   Start server and enjoy

### Usage


### TODO
- remove csrf_tag in layout file for rails2
- I18n
- made js agnostic
- cover everything with tests   
               

Copyright (c) 2011 Vladimir Penkin
