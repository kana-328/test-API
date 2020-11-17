ActiveAdmin.register User do
  permit_params :name, :email, :discript
end
