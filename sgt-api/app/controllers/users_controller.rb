class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_user, only: %i[show update destroy]

    def create
        @user = User.new(set_params)
        if @user.save
            render json: @user
        else
            render json: @user.error
        end
    end

    def show
        # render json: @user
        if @user.nil?
            render json: ErrorSerialize.serialize(@user), status: :not_found
        else
            render json: UserSerializer.new(@user)
            # render json: @user
        end    
    end

    def index
        render json: UserSerializer.new(User.all)
    end

    def update
       if @user.update(set_params)
            render json: UserSerializer.new(@user)
       else
            render json: @user.errors
       end
    end

    def destroy
        if @user.destroy
            render json: {message: "apagado com sucesso!"}
        end    
    end


    private
    def set_user
        @user = User.find(params[:id])
    end

    def set_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
