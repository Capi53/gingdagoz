class User < ApplicationRecord  
  def show
    @member = User.find(params[:id])
  end  
end
