
module Api::V1
  class UsersController < ApiController
  respond_to :json

    # POST /v1/users
    def index
      respond_with User.first(5)
    end
    
  def create
     @user = User.new(user_params)   
     
      if @user.save
        render json:{status: 'Success', message:'created User', data:@user} 
      else
        render json:{status: 'Error', message:'created User failed', data:@user.errors} 
      end
    end
  private 
      
      def user_params
          params.require(:user).permit(:name, :email, :password,
                                         :password_confirmation)
      end
  
  end
end