class Mygengo::CommentsController < ApplicationController
  def create                                       
    flag = Mugen::Job.create_comment(params[:id], params[:comment])
    redirect_to mygengo_job_path(params[:id])
  end
end