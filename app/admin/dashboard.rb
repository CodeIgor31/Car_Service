# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    end
    
    columns do
      column do
        panel "Recent Records" do
          ul do
            ServiceRecord.limit(5).map do |rec|
              li link_to(rec.date, admin_service_records_path(rec))
            end
          end
        end
      end

      column do
        panel "Recent works" do
          ul do
            Work.limit(5).map do |work|
              li link_to(work.created_at, admin_work_path(work))
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
