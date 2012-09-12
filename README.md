[![Build Status](https://secure.travis-ci.org/shell/mugen.png)](https://secure.travis-ci.org/shell/mugen.png)
## Introduction
  Mugen is API wrapper for MyGengo(<http://mygengo.com/>) and scaffold generator for existing rails app
   
## Installation       
  Working best with Rails3 and jQuery
  
## Rails 3.x

  Add gems to your Gemfile and bundle install it:
    gem 'haml'
    gem 'mugen'
  
  Generate scaffold:
    $ rails generate mugen

  Install rails3_before_render plugin
    $ rails plugin install git://github.com/shell/rails3_before_render.git
    
  Configure API keys in config/initializers/mugen.rb:
    Mugen.api_key = ''
    Mugen.private_key = ''
  
   Start server and enjoy

## Rails 2.x
  Add gems to config/environment.rb
    config.gem 'haml'
    config.gem 'mugen'
    
  Next install gems via 
    gem install mugen    
    or 
    rake gems:install
    
  Next generate scaffold
    
    $ script/generate mugen

  Install rails3_before_render plugin
    $ rails plugin install git://github.com/shell/rails3_before_render.git
    
  Configure API keys in config/initializers/mugen.rb
  Start server and enjoy
  
## Usage
  See routes.rb for url mappings.
  Default page is here (<http://localhost:3000/mygengo/account>)

## Debugging

  To debug http-requests, uncomment following line in lib/mugen/client.rb:
  
    debug_output $stderr

## TODO
- remove csrf_tag in layout file for rails2
- I18n
- made js agnostic
- cover everything with tests   
- Something really bad happening with css
               

## Author
Copyright (c) 2011 Vladimir Penkin
