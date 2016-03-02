class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
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

    respond_to do |format|
      if @user.save
<<<<<<< HEAD
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully created." }
=======
        format.html { redirect_to users_url, notice: "User was successfully created." }
>>>>>>> origin/master
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
<<<<<<< HEAD
=======
    
   	#if @user.save
   		#UserMailer.registration_confirmation(@user).deliver
   		#flash[:success] = "Please confirm your email address to continue"
   		#redirect_to root_url
   	#else
   		#flash[:error] = "Oops, something went wrong!"
   		#render 'new'
   	#end
>>>>>>> origin/master
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
<<<<<<< HEAD
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
=======
        format.html { redirect_to users_url, notice: "User was successfully updated." }
>>>>>>> origin/master
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
<<<<<<< HEAD
=======
  
  #def confirm_email
  	#user = User.find_by_confirm_token(params[:id])
  	#if user
  		#user.email_activate
  		#flash[:success] = "Welcome to Campus GPS! Your email has been confirmed. Please sign in to continue."
  		#redirect_to root_url
  	#else
  		#flash[:error] = "Sorry. User does not exist."
  		#redirect_to root_url
  	#end
  #end
>>>>>>> origin/master

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
<<<<<<< HEAD
      params.require(:user).permit(:name, :password, :password_confirmation)
=======
      params.require(:user).permit(:email, :password_digest)#, :email_confirmed, :confirm_token)
>>>>>>> origin/master
    end
end
