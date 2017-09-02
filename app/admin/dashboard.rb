# encoding: utf-8
ActiveAdmin.register_page "Dashboard" do
  menu :priority => 0, :label => "Консоль управления"

  content :title => "Консоль управления" do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span "Добро пожаловать в Active Admin. Это стандартная страница управления сайтом."
        small "Чтобы добавить сюда что-нибудь загляните в 'app/admin/dashboard.rb'"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
