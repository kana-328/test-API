ActiveAdmin.register User do
  permit_params :name, :email, :descript, :password
  form do |f|
    f.inputs 'package' do
      f.input :name
      f.input :descript
      f.input :email
      f.input :password
    end
    f.actions
  end
end
