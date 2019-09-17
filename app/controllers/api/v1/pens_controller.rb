
module Api::V1
  class PensController < ApiController
  respond_to :json

    # POST /v1/users
              def index
                @pens = Pen.all
                             render json:{status: 'Error', message:'created User failed', data:@pen}
              end
            
            def update
              if (authenticate_pen!)
              @pen.update( params.require(:pen).permit(:name, :password))
 
              else 
                render json:{status: 'Error', message:'created User failed', data:@pen.errors}
              end
            end
                    
            private 
            def pen_params
              params.require(:pen).permit(:name, :password, :token)
            end
  end
end
