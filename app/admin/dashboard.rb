ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Items" do
            table_for Item.order("delivery_days desc").limit(5) do
                column :name do |item|
                    link_to item.name, [:admin, item]
                end
                column :delivery_days
            end
            strong { link_to "View All Products", admin_items_path }
        end
      end
      column do
        panel "Recent Users" do
            table_for User.order("created_at desc").limit(5) do
                column :name do |user|
                    link_to user.name, [:admin, user]
                end
                column :created_at
            end
            strong { link_to "View All Users", admin_users_path }
        end
      end
    end
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
