class MexicanFood::TacosController < ApplicationController
   # unloadable
   respond_to :html,  :js
   def index
      @tacos = MexicanFood::Taco.all
   end

   def show
      @taco = MexicanFood::Taco.find(params[:id])
   end

   def new
      @taco = MexicanFood::Taco.new
   end

   def edit
      @taco = MexicanFood::Taco.find(params[:id])
   end

   def create
      @taco = MexicanFood::Taco.new(params[:mexican_food_taco])
      if @taco.save
         redirect_to(tacos_path, :notice => 'Taco was successfully created.')
      else
         render :action => "new"
      end
   end

   def update
      @taco = MexicanFood::Taco.find(params[:id])
      if @taco.update_attributes(params[:mexican_food_taco])
         redirect_to(@taco, :notice => 'Taco was successfully updated.')
      else
         render :action => "edit"
      end
   end

   def destroy
      @taco = MexicanFood::Taco.find(params[:id])
      @taco.destroy
      redirect_to(tacos_url)
   end
   
end