ActiveAdmin.register_page "Dashboard" do
  # include ActionView::Helpers::DateHelper
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: "Welcome Hamish and Ollie" do
    columns do
      column do
        panel "Recently updated nightclubs" do
          table_for Nightclub.last(5) do
            column("Club") {|nightclub| link_to(nightclub.name, admin_nightclub_path(nightclub)) }
            column("Last Updated") {|nightclub| time_ago_in_words(nightclub.updated_at) + " ago" }
          end
        end
      end

      column do
        panel "Useful links" do
            link_to "BopNightLife", root_path
        end
      end
    end
  end
end
