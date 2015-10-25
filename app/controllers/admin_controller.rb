class AdminController < ApplicationController
    def index
    end

    def show
      @admins = Admin.all
    end

    def login
      # login form
    end

    def new
    end

    def menu
    end
    def attempt_login
      if params[:name].present? && params[:password].present?
        found_user = Admin.where(:name => params[:name]).first
        if found_user
          authorized_user = found_user.authenticate(params[:password])
        end
      end
      if authorized_user
        # mark user as logged in
        session[:id] = authorized_user.id
        session[:name] = authorized_user.name
        flash[:notice] = "You are now logged in."
        redirect_to(:action => 'menu')
      else
        flash[:notice] = "Invalid username/password combination."
        redirect_to(:action => 'login')
      end
    end
    def logout
      # mark user as logged out
      session[:id] = nil
      session[:name] = nil
      flash[:notice] = "Logged out"
      redirect_to(:action => "login")
    end
  def create
    if session.has_key?(:name) && session.has_key?(:id)
      @admin = Admin.new
      @admin.name = params[:name]
      @admin.password = (params[:password])
      respond_to do |format|
        if @admin.save
          format.html { redirect_to 'admin#menu', notice: 'New administrator was successfully added.' }
        else
          format.html { render :login }
          format.json { render json: @room_type.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to 'root'
    end
  end
end
