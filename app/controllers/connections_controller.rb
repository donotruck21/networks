class ConnectionsController < ApplicationController

	def create
		my_id = session[:user_id]
		o_id = params[:id]

		connection = Connection.where(user:User.find(session[:user_id]), otheruser:Otheruser.find(params[:id]))[0]

		if connection
			redirect_to '/professional_profile'
		else
			Connection.create(user:User.find(session[:user_id]), otheruser:Otheruser.find(params[:id]))
			Invitation.where(user_id:Otheruser.find(params[:id]), otheruser_id:User.find(session[:user_id]))[0].destroy
			redirect_to '/professional_profile'
		end

	end
end
