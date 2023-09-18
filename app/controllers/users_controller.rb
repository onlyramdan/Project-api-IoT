class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @page = user_params["page"].present? ? params["page"].to_i : 1
    @limit = user_params["limit"].present? ? params["limit"].to_i : 10
    @users = User.all.page(@page).per(@limit)
    data_user = []
    if @users.present?
      @users.each do |user|
        data_array = {
          id: user._id.to_s,
          nama: user.nama,
          email: user.email,
          role: user.user_role.user_role,
          status: user.status
        }
        data_user.push(data_array)
      end
    else
      data_alat = nil
    end
    meta ={
      next_page: @users.next_page,
      prev_page: @users.prev_page,
      current_page: @users.current_page,
      total_pages: @users.total_pages
    }
    result = {
      status: true,
      messages: 'Sukses',
      content: data_user,
      meta: meta
    }
    render json: result
    return
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
  def show
    if @user.present?
      data = {
        id: @user["_id"].to_s,
        email: @user['email'],
        nama: @user['nama'],
        password: @user['password'],
        user_role_id: @user['user_role_id'],
        user_role: @user.user_role['user_role']
      }
      render json: data
    end
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
      render json:{
        status: true,
        massage: "Update berhasil",
        content: @user
      }
    else
      render json: {
        status: false,
        massage: "Edit tidak berhasil",
        content: nil
      }
    end
  end

  # DELETE /users/1
  def destroy
    if @user.destroy(user_params)
      render json: {
        status: true,
        message: "Berhasil hapus",
        content: nil
      }
    else
      render json: {
          status: false,
          message: "Gagal hapus",
          content: nil
        }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:email, :password, :nama, :status, :user_role_id , :id)
    end
end

