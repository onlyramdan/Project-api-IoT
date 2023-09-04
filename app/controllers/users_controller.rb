class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end
  
  def show_role
    user = User.find(params["id"])
    if user.present?
      data = {
        id: user._id.to_s,
        email:  user.email,
        role: user.user_role.user_role
      }
    end
    render json: data

  end

  # if @user.present?
  #   data = {
  #     id: @user._id.to_s,
  #     email: @user.email,
  #     role: @user.user_role_id
  #   }
  # end
  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: {
                    status: true,
                    massage: "Sign Up Berhasil",
                    content: @user
                }
    else
      render json: {
                    status: false,
                    massage: "Sign Up Tidak Berhasil",
                    content: nil
                }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :password, :nama, :status, :user_role_id, :id)
    end
end
