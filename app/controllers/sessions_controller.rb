class SessionsController < ApplicationController
    def new
        sign_out
    end
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        Rails.logger.debug "-------sessioncontroller----------------"
        Rails.logger.debug user.inspect
        if user && user.authenticate(params[:session][:password])
            Rails.logger.debug "-------ログイン成功----------------"
            Rails.logger.debug user.inspect
            # ユーザーをサインインさせ、ユーザーページ (show) にリダイレクトする。
            sign_in user
            # ユーザIDをセッションに詰め込む
            session[:user_id]=user.id
            redirect_to user
        else
            flash.now[:error] = 'EmailまたはPasswordが間違っています。' # 誤りあり!
            render 'new'
        end
    end
    def destroy
        sign_out
        flash[:success] = 'サインアウトしました。' # 誤りあり!
        redirect_to root_url
    end
end
