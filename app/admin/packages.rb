ActiveAdmin.register Package do
  permit_params :user_id, :title, :descript, :price, :day, :image, city_id: [], prefecture_id: []
end
