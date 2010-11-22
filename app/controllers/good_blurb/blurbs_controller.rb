class GoodBlurb::BlurbsController < ApplicationController
   # unloadable
   respond_to :html,  :js
   def index
      @blurbs = GoodBlurb::Blurb.all
   end

   def show
      @blurb = GoodBlurb::Blurb.find(params[:id])
   end

   def new
      @blurb = GoodBlurb::Blurb.new
   end

   def edit
      @blurb = GoodBlurb::Blurb.find(params[:id])
   end

   def create
      @blurb = GoodBlurb::Blurb.new(params[:good_blurb_blurb])
      if @blurb.save
         redirect_to(blurbs_path, :notice => 'Blurb was successfully created.')
      else
         render :action => "new"
      end
   end

   def update
      @blurb = GoodBlurb::Blurb.find(params[:id])
      if @blurb.update_attributes(params[:good_blurb_blurb])
         redirect_to(@blurb, :notice => 'Blurb was successfully updated.')
      else
         render :action => "edit"
      end
   end

   def destroy
      @blurb = GoodBlurb::Blurb.find(params[:id])
      @blurb.destroy
      redirect_to(blurbs_url)
   end
   
end