# encoding: utf-8
ActiveAdmin.register Carousel do
  menu :priority => 3, :label => "Реклама"

  filter :header
  filter :body
  filter :created_at, as: :date_range
  filter :updated_at, as: :date_range

  index do
    column :dealer do |is_it|
      is_it.dealer ? '✓' : ''
    end
    column :header
    column :body
    column :banner do |image|
      image_tag image.banner.url, width: '300px'
    end
    default_actions
  end

  form do |f|
    f.inputs "Реклама" do
      f.input :dealer
      f.input :header
      f.input :body
      f.input :link
      f.input :new_window
      f.input :banner
    end
    f.actions
  end
end
