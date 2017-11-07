class DashboardsController < ApplicationController
	before_action :authenticate_user!
	require 'csv'

	def index
		@user_orders = Order.where("user_id =?", current_user.id)
		@merchant_items = Item.where("user_id =?", current_user.id)
	end

	def import
		csv_text = File.read(params[:file].path)
	    if !csv_text.blank?
	    	csv = CSV.parse(csv_text, :headers => true)
	        csv.each do |row|
	        	Item.create!(user_id: current_user.id, code: row["code"], name: row["name"], specification: row["specification"], price: row["price"], stock: row["stock"], delivery_days: row["delivery_days"])
	      	end
		end
		flash[:success] = "CSV has been uploaded!!"
		redirect_to request.referer
	end
end
