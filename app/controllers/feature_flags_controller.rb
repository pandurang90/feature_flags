class FeatureFlagsController < ActionController::Base

  def index
    @features = FeatureFlag.all   
  end

  def update 
    @features = FeatureFlag.all   
    feature_flag = FeatureFlag.find(params[:id])

    respond_to do |format|
      if feature_flag.update_attributes(params[:feature_flag])        
        flash[:notice] = "#{feature_flag.feature} feature successfully updated"
        format.html{
          redirect_to feature_flags_url
        }

        format.js{
          render :json => {:status => true, :message => flash[:notice]}
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
    @features = FeatureFlag.all   
    feature_flag = FeatureFlag.find(params[:id])

    respond_to do |format|
      if feature_flag.destroy
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