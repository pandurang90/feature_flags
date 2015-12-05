class FeatureFlagsController < ApplicationController
  layout "feature_flags"
  before_filter :load_features, :only => [:index,:create,:update,:destroy]

  def index
  end

  def new
    @feature = Feature.new
  end

  def edit
    @feature = Feature.find(params[:id])
  end

  def create
    @feature = Feature.new(feature_params)
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

  def enable_all
    FeatureFlags.enable_all
  end

  def disable_all
    FeatureFlags.disable_all
  end

  def update 
    feature = Feature.find(params[:id])
    enabled_all = params[:enable_all].present? ? enable_all : false
    disabled_all = params[:disable_all].present? ? disable_all : false

    respond_to do |format|
      if enabled_all || disabled_all || feature.update_attributes(feature_params)  
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
    feature = Feature.find(params[:id])

    respond_to do |format|
      if feature.destroy
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

  def load_features
    @features = Feature.all
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :status)
  end
end