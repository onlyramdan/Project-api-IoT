class LoginController < ApplicationController
    def login
        res_user = User.where(email: params[:email], password: params[:password])
        if res_user.present?
            data = {
                email: res_user[0]['email'],
                nama: res_user[0]['nama'],
                user_role: res_user[0].user_role['user_role']
            }
            if res_user[0]['status'].to_s != "1"
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
        else
            render json: {
                    status: false,
                    massage: "Email atau Password Salah",
                    content: nil
                }
        end

    end
    def login_params
        params.permit(:email, :password)
    end
end
