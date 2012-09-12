require 'tempfile'
module Mugen
  class Job < Client
    class << self

    attr_accessor :job_id, :slug, :body_src, :body_tgt, :lc_src, :lc_tgt,
                  :unit_count, :tier, :credits, :status, :capcha_url,
                  :eta, :callback_url, :auto_approve, :ctime, :custom_data,
                  :mt, :comment, :as_group



    #
    # translate/job/{id} (GET)
    #
    # Retrieves a specific job
    #
    def find(id, options={})
      res = self.get "/translate/job/#{id}", :query => options
      check_for_errors(res)
      res['response']['job']
    end

    #
    # translate/job (POST)
    #
    # Post a new job for translation
    #
    def create(options = {})
      if options.nil? || options.empty?
        raise Exception, '"options" missing required parameters'
      end
      job = { 'job' => options }
      res = self.post "/translate/job", :body => job
      check_for_errors(res)
      res['response']
    end

    #
    # translate/job/{id} (PUT)
    #
    # Updates a job to translate.
    #
    def update(job_id, action, options = {})
      # if options.nil? || options.empty?
      #   raise Exception, '"options" missing required parameters'
      # end
      options.merge! :action => action
      job = options
      res = self.put "/translate/job/#{job_id}", :body => job
      check_for_errors(res)
      res['response']
    end

    def purchase(job_id, options = {})
      update(job_id, 'purchase', options)
    end

    def revise(job_id, options = {})
      update(job_id, 'revise', options)
    end

    def approve(job_id, options = {})
      update(job_id, 'approve', options)
    end

    def reject(job_id, options = {})
      update(job_id, 'reject', options)
    end

    #
    # translate/job/{id} (DELETE)
    #
    # Cancels the job. You can only cancel a job if it has not been
    # started already by a translator.
    #
    def delete(id, options = {})
      options.merge!('_method' => 'delete')
      res = self.delete "/translate/job/#{id}", :query => options
      check_for_errors(res)
      res['response']
    end

    #
    # translate/job/{id}/preview (GET)
    #
    # Renders a JPEG preview of the translated text
    # N.B. - if the request is valid, a raw JPEG stream is returned.
    #
    def preview(id, options = {})
      name = "#{Time.now.gmtime.to_i}.jpg"
      res = self.get "/translate/job/#{id}/preview", :query => options
      check_for_errors(res)
      fn = if defined?(Rails)
        Rails.root.join('public', 'images', 'mygengo', name)
      else
        Tempfile.new(name)
      end
      if !File.exists?(fn)
        tempfile = File.new(fn, "w+")
        tempfile << res
        tempfile.close
        "mygengo/#{name}"
      else
        nil
      end
    end

    #
    # translate/job/{id}/comment (POST)
    #
    # Submits a new comment to the job's comment thread.
    #
    def create_comment(job_id, comment)
      if comment.nil? || comment.empty?
        raise Exception, '"options" missing required parameters'
      end
      res = self.post "/translate/job/#{job_id}/comment", :body => comment
      check_for_errors(res)
      res['response']
    end

    #
    # translate/job/{id}/comments (GET)
    #
    # Retrieves the comment thread for a job
    #
    def comments(id, options = {})
      res = self.get "/translate/job/#{id}/comments", :query => options
      check_for_errors(res)
      res['response']['thread']
    end

    #
    # translate/job/{id}/feedback (GET)
    #
    # Retrieves the feedback
    #
    def feedback(id, options = {})
      res = self.get "/translate/job/#{id}/feedback", :query => options
      check_for_errors(res)
      res['response']['feedback']
    end

    #
    # translate/job/{id}/revisions (GET)
    #
    # Gets list of revision resources for a job.
    #
    def revisions(id, options = {})
      res = self.get "/translate/job/#{id}/revisions", :query => options
      check_for_errors(res)
      res['response']['revisions']
    end

    #
    # translate/job/{job_id}/revision/{id} (GET)
    #
    # Gets specific revision for a job.
    #
    def revision(job_id, id, options = {})
      res = self.get "/translate/job/#{job_id}/revision/#{id}", :query => options
      check_for_errors(res)
      res['response']['revision']
    end

    end
  end
end