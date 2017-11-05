ActiveAdmin.register News do
  menu :priority => 2, :label => 'Новости'

  index do
    column :updated_at
    column :title
    actions
  end

  filter :title
  filter :content
  filter :created_at, as: :date_range
  filter :updated_at, as: :date_range

  form do |f|
    within @head do
      script :src => javascript_path('active_admin_summernote.js'), :type => "text/javascript"
    end
    f.inputs 'Новости' do
      f.input :title
      f.input :content, input_html: { data: { provider: :summernote }}
      f.has_many :cover, allow_destroy: true do |f|
        f.input :filename, as: :file, hint: f.object.filename.url ? image_tag(f.object.filename.url(:thumb)) : ''
      end
    end
    f.actions
  end
end
