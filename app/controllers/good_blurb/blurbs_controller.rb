class GoodBlurb::BlurbsController < ApplicationController
   unloadable
   respond_to :html,  :js
   def index
      @blurbs = Blurb.all
   end

   def show
      @blurb = Blurb.find(params[:id])
   end

   def new
      @blurb = Blurb.new
   end

   def edit
      @blurb = Blurb.find(params[:id])
   end

   def create
      @blurb = Blurb.new(params[:blurb])
      if @blurb.save
         redirect_to(@blurb, :notice => 'Blurb was successfully created.')
      else
         render :action => "new"
      end
   end

   def update
      @blurb = Blurb.find(params[:id])
      if @blurb.update_attributes(params[:blurb])
         redirect_to(@blurb, :notice => 'Blurb was successfully updated.')
      else
         render :action => "edit"
      end
   end

   def destroy
      @blurb = Blurb.find(params[:id])
      @blurb.destroy
      redirect_to(blurbs_url)
   end
   
end