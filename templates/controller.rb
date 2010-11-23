class CamelizedModule::CamelizedModelsController < ApplicationController
   # unloadable
   respond_to :html,  :js
   def index
      @UnderscoredModels = CamelizedModule::CamelizedModel.all
   end

   def show
      @UnderscoredModel = CamelizedModule::CamelizedModel.find(params[:id])
   end

   def new
      @UnderscoredModel = CamelizedModule::CamelizedModel.new
   end

   def edit
      @UnderscoredModel = CamelizedModule::CamelizedModel.find(params[:id])
   end

   def create
      @UnderscoredModel = CamelizedModule::CamelizedModel.new(params[:UnderscoredModule_UnderscoredModel])
      if @UnderscoredModel.save
         redirect_to(UnderscoredModels_path, :notice => 'CamelizedModel was successfully created.')
      else
         render :action => "new"
      end
   end

   def update
      @UnderscoredModel = CamelizedModule::CamelizedModel.find(params[:id])
      if @UnderscoredModel.update_attributes(params[:UnderscoredModule_UnderscoredModel])
         redirect_to(@UnderscoredModel, :notice => 'CamelizedModel was successfully updated.')
      else
         render :action => "edit"
      end
   end

   def destroy
      @UnderscoredModel = CamelizedModule::CamelizedModel.find(params[:id])
      @UnderscoredModel.destroy
      redirect_to(UnderscoredModels_url)
   end
   
end