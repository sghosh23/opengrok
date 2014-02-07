class Api::RestApisController < ApplicationController
  
  #before_filter :authenticate_user!  

  def index
  	@tokens = RestApi.last(100).reverse
  	
  	respond_to do |format|
      format.html
      format.json { render :json => @tokens }
      format.xml { render :xml => @tokens }
    end
  end

end
