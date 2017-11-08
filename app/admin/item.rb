ActiveAdmin.register Item do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :code, :name, :specification, :price, :stock, :delivery_days
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
	column :code
	column :name
	column :specification
	column :stock
	column :delivery_days
	column :price, :sortable => :price do |item|
		number_to_currency item.price
	end
	actions
end

end
