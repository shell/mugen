class Mygengo::CommentsController < Mygengo::MygengoController
  def create                                       
    mygengo_requests do
      flag = Mugen::Job.create_comment(params[:id], params[:comment])
    end
    redirect_to mygengo_job_path(params[:id])
  end
end