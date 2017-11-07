class ItemsController < ApplicationController
	before_action :authenticate_user!
	# require 'csv'
	
	def index
		@merchant_items = Item.where("user_id =?", current_user.id)
	end
end
