class FeatureFlagsController < ApplicationController

  def index
    #@features = FeatureFlag.all   
  end

  def update 
    @features = FeatureFlag.all   
    feature_flag = FeatureFlag.find(params[:id])

    respond_to do |format|
      if feature_flag.update_attributes(params[:feature_flag])        
        flash[:message] = "#{feature_flag.feature} feature successfully updated"
        format.html{
          redirect_to feature_flags_url
        }

        format.js{
          render :json => {:status => true, :message => flash[:message]}
        }       
      else        
        flash[:error] = "#{feature_flag.feature} feature could not be updated"
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
    
  end

end