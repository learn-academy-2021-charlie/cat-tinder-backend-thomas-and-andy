class JobsController < ApplicationController

    def index
        jobs = Job.all
        render json: jobs
    end
  
    def create
        job = Job.create(job_params)
       if job.valid?
         render json: job
       else
        render json: job.errors, status: 422
       end
    end
  
    def update
        job = Job.find(params[:id])
        job.update(job_params)
        render json: job
    end
  
    def destroy
        job = Job.find(params[:id])
        job.destroy
        render json: job
    end


    private
    def job_params
      params.require(:job).permit( :job_title, :job_description,:job_salary,:might_enjoy, :img)
    end
end
