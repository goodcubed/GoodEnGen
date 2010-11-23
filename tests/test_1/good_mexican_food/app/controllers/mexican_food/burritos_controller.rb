class MexicanFood::BurritosController < ApplicationController
   # unloadable
   respond_to :html,  :js
   def index
      @burritos = MexicanFood::Burrito.all
   end

   def show
      @burrito = MexicanFood::Burrito.find(params[:id])
   end

   def new
      @burrito = MexicanFood::Burrito.new
   end

   def edit
      @burrito = MexicanFood::Burrito.find(params[:id])
   end

   def create
      @burrito = MexicanFood::Burrito.new(params[:mexican_food_burrito])
      if @burrito.save
         redirect_to(burritos_path, :notice => 'Burrito was successfully created.')
      else
         render :action => "new"
      end
   end

   def update
      @burrito = MexicanFood::Burrito.find(params[:id])
      if @burrito.update_attributes(params[:mexican_food_burrito])
         redirect_to(@burrito, :notice => 'Burrito was successfully updated.')
      else
         render :action => "edit"
      end
   end

   def destroy
      @burrito = MexicanFood::Burrito.find(params[:id])
      @burrito.destroy
      redirect_to(burritos_url)
   end
   
end