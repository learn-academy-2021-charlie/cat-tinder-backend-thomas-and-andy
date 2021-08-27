class DevsController < ApplicationController
    def index
        devs = Dev.all
        render json: devs
    end
  
    def create
        dev = Dev.create(dev_params)
       if dev.valid?
         render json: dev
       else
        render json: dev.errors, status: 422
       end
    end
  
    def update
        dev = Dev.find(params[:id])
        dev.update(dev_params)
        render json: dev
    end
  
    def destroy
        dev = Dev.find(params[:id])
        dev.destroy
        render json: dev
    end


    private
    def dev_params
      params.require(:dev).permit( :name, :age, :technologies ,:skills , :enjoys, :img)
    end
end

