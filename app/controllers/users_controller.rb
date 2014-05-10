class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_filter :authorize, :except=>:login

    # GET /users
    # GET /users.json
    def index
        @users = User.all
    end

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    # POST /users.json
    def create
        @user = User.new(user_params)
        Rails.logger.debug "--------------------------"
        Rails.logger.debug @user.inspect
        Rails.logger.debug "--------------------------"

        if @user.save
            Rails.logger.debug "--------------------------"
            Rails.logger.debug "成功"
            Rails.logger.debug "--------------------------"
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            Rails.logger.debug "--------------------------"
            Rails.logger.debug "失敗"
            Rails.logger.debug "--------------------------"
            render 'new'
        end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url }
            format.json { head :no_content }
        end
    end

    def login 
        session[:userName] = nil
        @user = params['userName']
        @password = params['password']
        if ( @user != nil ) && ( @password != nil )
            if Authentication.authorize(@user, @password) != false
                session[:userName] = @user
                flash.discard
                if session[:jumpto] != nil
                    redirect_to session[:jumpto]
                else
                    redirect_to({:controller=>'user', :action => 'loggedin'})
                end
            else
                flash[:notice] = "invalid username or password."
            end
        end
    end

    def loggedin
    end

    def logout
        session[:userName] = nil
    end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:name, :fname, :lname, :email, :password, :password_confirmation)
    end


    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
    end
end
