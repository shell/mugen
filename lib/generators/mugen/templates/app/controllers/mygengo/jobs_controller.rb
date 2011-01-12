class Mygengo::JobsController < ApplicationController
  layout 'mygengo'        
  before_filter :flash_errors
  after_filter :parse_errrors
  
  # GET /jobs
  # GET /jobs.xml
  def index
    @job_ids = Mugen::Jobs.all
    @jobs = @job_ids.collect {|j| 
      Mugen::Job.find(j['job_id']).merge('comments' => Mugen::Job.comments(j['job_id']))
    }

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def show
    @job = Mugen::Job.find(params[:id])
    @preview = Mugen::Job.preview(@job['job_id'])
    @comments = Mugen::Job.comments(@job['job_id']) 
    @job.merge!('comments' => @comments)    
    @feedback = Mugen::Job.feedback(@job['job_id'])
    @revisions = Mugen::Job.revisions(@job['job_id'])
    @revisions = [@revisions] if @revisions.is_a?(Hash)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job }
    end
  end  
  
  def review_form
    @job = Mugen::Job.find(params[:id])
    @preview = Mugen::Job.preview(@job['job_id'])
    @comments = Mugen::Job.comments(@job['job_id']) 
    @job.merge!('comments' => @comments)        
    @feedback = Mugen::Job.feedback(@job['job_id'])    
  end

  def reject_form
    @job = Mugen::Job.find(params[:id])
    @preview = Mugen::Job.preview(@job['job_id'])
    @comments = Mugen::Job.comments(@job['job_id']) 
    @job.merge!('comments' => @comments)        
  end

  def revise_form
    @job = Mugen::Job.find(params[:id])
    @preview = Mugen::Job.preview(@job['job_id'])
    @comments = Mugen::Job.comments(@job['job_id']) 
    @job.merge!('comments' => @comments)        
  end

  # GET /jobs/1
  # GET /jobs/1.xml
  def revision
    @job = Mugen::Job.find(params[:job_id])    
    @revision = Mugen::Job.revision(params[:job_id], params[:id])
    
    respond_to do |format|
      format.html {}
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.xml
  def new
    @job = Mugen::Job                                                    
    @languages = Mugen::Service.languages
    @language_pairs = Mugen::Service.language_pairs
    @language_src = @languages.collect { |lp| [ lp["language"], lp['lc'] ] }.uniq.sort
    @language_tgt = @languages.collect { |lp| [ lp["language"], lp['lc']  ] }.uniq.sort

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Mugen::Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.xml
  def create      
    params[:job]['body_src'] = sanitize(params[:job]['body_src'])
    flag = Mugen::Job.create(params[:job])    
    redirect_to mygengo_jobs_path
  end

  # PUT /jobs/1
  # PUT /jobs/1.xml
  def update
    @job = Mugen::Job.update(params[:id])
    
    redirect_to mygengo_jobs_path
  end             
  
  def purchase
    @job = Mugen::Job.purchase(params[:id])
    
    redirect_to mygengo_jobs_path
  end

  def approve
    @job = Mugen::Job.approve(params[:id])
    
    redirect_to mygengo_jobs_path
  end

  def revise
    @job = Mugen::Job.revise(params[:id], params[:job])
    
    redirect_to mygengo_jobs_path
  end

  def reject
    @job = Mugen::Job.reject(params[:id], params[:job])
    
    redirect_to mygengo_jobs_path
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.xml
  def destroy
    @job = Mugen::Job.delete(params[:id])
    
    respond_to do |format|
      format.html { redirect_to(mygengo_jobs_url) }
      format.xml  { head :ok }
    end
  end
 
  # POST /jobs/1/callback
  def callback
    # The job was updated as per http://mygengo.com/services/api/dev-docs/callback-urls
    # Handle locally
  
    if params[:job].present?
      job = ActiveSupport::JSON.decode(params[:job])
      handle_job_update(job)
    elsif params[:comment].present?
      comment = ActiveSupport::JSON.decode(params[:comment])
      handle_job_comment(comment)
    end
  end
    
  private 
    def sanitize(text)
      return text.gsub(/<\/?.*?>/, "")
    end
    
    def handle_job_update(job)
    end
    
    def handle_job_comment(comment)
    end
    
    # FIXME
    def flash_errors
      if session[:errors] && !session[:errors].empty?
        flash[:errors] = session[:errors]
      end              
    end    
    
    # FIXME
    def parse_errrors  
      unless Mugen.errors.empty?
        session[:errors] << Mugen.errors.join('<br />')      
        Mugen.errors.clear
      end
    end
end