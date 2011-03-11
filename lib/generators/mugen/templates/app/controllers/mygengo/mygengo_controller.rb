class Mygengo::MygengoController < ApplicationController
  before_render :parse_errrors
  layout 'mygengo'        

  protected

  def parse_errrors  
    unless Mugen.errors.empty?
      if flash[:error]
        flash[:error] << Mugen.errors.join(' | ')
      else
        flash[:error] = Mugen.errors.join(' | ')
      end
      Mugen.errors.clear
    end
  end
          
end  