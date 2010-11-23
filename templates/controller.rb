class #{@camelized_module}::#{@camelized_model}sController < ApplicationController
   # unloadable
   respond_to :html,  :js
   def index
      @#{@underscored_model}s = #{@camelized_module}::#{@camelized_model}.all
   end

   def show
      @#{@underscored_model} = #{@camelized_module}::#{@camelized_model}.find(params[:id])
   end

   def new
      @#{@underscored_model} = #{@camelized_module}::#{@camelized_model}.new
   end

   def edit
      @#{@underscored_model} = #{@camelized_module}::#{@camelized_model}.find(params[:id])
   end

   def create
      @#{@underscored_model} = #{@camelized_module}::#{@camelized_model}.new(params[:#{@underscored_module}_#{@underscored_model}])
      if @#{@underscored_model}.save
         redirect_to(#{@underscored_model}s_path, :notice => '#{@camelized_model} was successfully created.')
      else
         render :action => "new"
      end
   end

   def update
      @#{@underscored_model} = #{@camelized_module}::#{@camelized_model}.find(params[:id])
      if @#{@underscored_model}.update_attributes(params[:#{@underscored_module}_#{@underscored_model}])
         redirect_to(@#{@underscored_model}, :notice => '#{@camelized_model} was successfully updated.')
      else
         render :action => "edit"
      end
   end

   def destroy
      @#{@underscored_model} = #{@camelized_module}::#{@camelized_model}.find(params[:id])
      @#{@underscored_model}.destroy
      redirect_to(#{@underscored_model}s_url)
   end
   
end