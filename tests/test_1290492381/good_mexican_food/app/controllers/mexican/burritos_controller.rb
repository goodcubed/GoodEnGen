class Mexican::BurritosController < ApplicationController
   # unloadable
   respond_to :html,  :js
   def index
      @burritos = Mexican::Burrito.all
   end

   def show
      @burrito = Mexican::Burrito.find(params[:id])
   end

   def new
      @burrito = Mexican::Burrito.new
   end

   def edit
      @burrito = Mexican::Burrito.find(params[:id])
   end

   def create
      @burrito = Mexican::Burrito.new(params[:mexican_burrito])
      if @burrito.save
         redirect_to(burritos_path, :notice => 'Burrito was successfully created.')
      else
         render :action => "new"
      end
   end

   def update
      @burrito = Mexican::Burrito.find(params[:id])
      if @burrito.update_attributes(params[:mexican_burrito])
         redirect_to(@burrito, :notice => 'Burrito was successfully updated.')
      else
         render :action => "edit"
      end
   end

   def destroy
      @burrito = Mexican::Burrito.find(params[:id])
      @burrito.destroy
      redirect_to(burritos_url)
   end
   
end