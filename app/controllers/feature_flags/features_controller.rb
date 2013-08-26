module FeatureFlags
  class FeaturesController < ::ApplicationController
    #template FeatureFlags.configuration.template.downcase

    def index
      @features = Feature.all   
    end

    def update 
      @features = Feature.all   
      feature = Feature.find(params[:id])

      respond_to do |format|
        if feature.update_attributes(params[:feature])        
          flash[:notice] = "#{feature.name} feature successfully updated"
          format.html{
            redirect_to features_url
          }

          format.js{
            render :json => {:status => true, :message => flash[:notice]}
          }       
        else        
          flash[:error] = "#{feature.name} feature could not be updated"
          format.html{
            redirect_to features_url
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
          flash[:notice] = "Feature successfully removed"
          format.html{
            redirect_to features_url
          }

          format.js{
            render :json => {:status => true, :message => flash[:notice]}
          }       
        else        
          flash[:error] = "This feature could not be removed"
          format.html{
            redirect_to features_url
          }
          format.js{
            render :json => {:status => false, :message => flash[:error]}
          }       
        end     
      end
    end

  end
end