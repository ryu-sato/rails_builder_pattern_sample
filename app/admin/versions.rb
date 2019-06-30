ActiveAdmin.register Version do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :item_type, :item_id, :event, :whodunnit, :object, :created_at

  actions :all, except: [:new, :show, :edit]

  index do
    selectable_column
    column :item_type
    column :item_id
    column :event
    column :whodunnit
    column :object
    column :created_at
    actions
  end
end
