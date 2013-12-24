class FeatureFlagsController < ApplicationController
  layout FeatureFlags.configuration.layout.downcase

  def index
    @features = Feature.all   
  end

  def new
    @feature = Feature.new
  end

  def edit
    @feature = Feature.find(params[:id])
  end

  def create
    @features = Feature.all
    @feature = Feature.new(params[:feature])
    respond_to do |format|
      if @feature.save
        flash[:notice] = "#{@feature.name} feature successfully created"
        format.html{
          redirect_to feature_flags_url
        }
      else
        flash[:error] = "#{@feature.name} feature could not be created"
        format.html{
          render :new
        }
      end
    end
  end

  def update 
    @features = Feature.all   
    feature = Feature.find(params[:id])

    respond_to do |format|
      if feature.update_attributes(params[:feature])  
        flash[:notice] = "#{feature.name} feature successfully updated"
        format.html{
          redirect_to feature_flags_url
        }

        format.js{
          render :json => {:status => true, :message => flash[:notice]}
        }       
      else        
        flash[:error] = "#{feature.name} feature could not be updated"
        format.html{
          redirect_to feature_flags_url
        }
        format.js{
          render :json => {:status => false, :message => flash[:error]}
        }       
      end     
    end
  end

  def destroy
    @features = Feature.all   
    feature = Feature.find(params[:id])

    respond_to do |format|
      if feature.destroy
        Feature.update_hash
        flash[:notice] = "Feature successfully removed"
        format.html{
          redirect_to feature_flags_url
        }

        format.js{
          render :json => {:status => true, :message => flash[:notice]}
        }       
      else        
        flash[:error] = "This feature could not be removed"
        format.html{
          redirect_to feature_flags_url
        }
        format.js{
          render :json => {:status => false, :message => flash[:error]}
        }       
      end     
    end
  end
end