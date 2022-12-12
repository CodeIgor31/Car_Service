# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end
    
    columns do
      column do
        panel "Recent Users" do
          ul do
            User.limit(5).map do |us|
              li link_to(us.email, admin_user_path(us))
            end
          end
        end
      end

      column do
        panel "Recent Records" do
          ul do
            ServiceRecord.limit(5).map do |rec|
              li link_to(rec.date, admin_service_record_path(rec))
            end
          end
        end
      end

      column do
        panel "Recent Serveces" do
          ul do
            Service.limit(5).map do |ser|
              li link_to(ser.title, admin_service_path(ser))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end # content
end
