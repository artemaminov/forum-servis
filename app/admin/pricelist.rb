# encoding: utf-8
ActiveAdmin.register Pricelist do
  menu :priority => 4, :label => "Техника в наличии (прайс-лист)"

  index do
    column :filename
    default_actions
  end

  form do |f|
    f.inputs "Техника в наличии (прайс-лист)" do
      f.input :filename
    end
    f.actions
  end
end
