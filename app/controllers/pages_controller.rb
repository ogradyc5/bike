class PagesController < ApplicationController
    #before_action :authenticate_user!, :except => [:show, :index]
    def search
        if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!") and return  
        else  
           # @parameter = params[:search].downcase  
            #@results = Store.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
            @results = Bicycle.search(params[:search]) + Store.search(params[:search]).order("stores.name DESC")
            #@results = Bicycle.joins(:store).search(params[:search]).order("stores.name DESC")
        end
    end 
end