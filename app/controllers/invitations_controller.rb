class InvitationsController < ApplicationController

	def create
		o_id = params[:id]
		my_id = session[:user_id]

		puts o_id
		puts my_id

		invite = Invitation.where(user:User.find(session[:user_id]), otheruser:Otheruser.find(params[:id]))[0]

		if invite
			redirect_to '/users'
		else
			Invitation.create(user:User.find(session[:user_id]), otheruser:Otheruser.find(params[:id]))
			redirect_to '/professional_profile'
		end
	end


	def destroy
		puts "helloooo"
		puts params[:id]
		puts params[:id]
		puts params[:id]
		puts session[:user_id]

		Invitation.where(user_id:params[:id], otheruser_id:session[:user_id])[0].destroy

		redirect_to '/professional_profile'
	end


end
