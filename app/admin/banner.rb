# encoding: utf-8
ActiveAdmin.register Carousel do

  menu :priority => 2, :label => "Реклама"

  index do
    column :header
    column :body
    column :banner do |image|
      image_tag image.banner.url, width: '300px'
    end
    default_actions
  end

  form do |f|
    f.inputs "Реклама" do
      f.input :header
      f.input :body
      f.input :banner
    end
    f.actions
  end
end
