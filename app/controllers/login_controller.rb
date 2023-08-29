class LoginController < ApplicationController
    def login
        res_user = User.find_by(email: params[:email], password: params[:password])
        if res_user.present?
            data = {
                email: res_user['email'],
                nama: res_user['nama'],
                user_role: res_user.user_role['user_role']
            }
            if res_user['status'].to_s != "1"
                render json: {
                    status: false,
                    massage: "User tidak aktif!, Silahkan hubungin administrator",
                    content: nil
                } 
            else
                render json: {
                    status: true,
                    massage: "Berhasil Login",
                    content: data
                }
            end
        end
    end
    def login_params
        params.permit(:email, :password)
    end
end
