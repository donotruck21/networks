class UsersController < ApplicationController
	def index

	end

	def create
		user = User.create(name: params[:name], email: params[:email], description: params[:description], password: params[:password], password_confirmation: params[:password_confirmation])

		Otheruser.create(o_name: params[:name], o_email: params[:email], o_description: params[:description])

		if user.errors.full_messages.empty?
			session[:user_id] = user.id
  			redirect_to "/professional_profile"
		else
			flash[:errors] = user.errors.full_messages
			redirect_to "/"
		end
	end

	def login
		user = User.where(email: params[:email])[0]
		
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to "/professional_profile"

		else @user
			flash[:email] = "Invalid combination"
			redirect_to "/"
		end
	end

	def show
		@user = User.find(session[:user_id])

		@invitations = Invitation.where(otheruser_id:session[:user_id]).joins(:user).select("*")

		puts "0000" * 20
		puts @invitations

		@connections = Connection.where(user_id:session[:user_id]).joins(:otheruser).select("*")
	end

	def show_all
		@all_users = Otheruser.all
		@invitations = Invitation.all
	end

	def show_user
		@user = User.find(params[:id])
	end











	def logout
		session.clear
		redirect_to "/"
	end
end
