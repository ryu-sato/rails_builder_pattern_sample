ActiveAdmin.register PaperTrail::Version, as: "Version" do
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
