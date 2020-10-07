crumb :root do
  link "Home", root_path
end

crumb :login do
  link "Login", new_user_session_path
  parent :root
end

crumb :sign_up do
  link "Sign_up", new_user_registration_path
  parent :root
end

crumb :sell_product do
  link "Sell_product", new_product_path
  parent :root
end

crumb :detail do
  unless params[:id] == nil
    link "Detail", product_path(params[:id])
  else 
    link "Detail", product_path(params[:product_id])
  end
  parent :root
end

crumb :edit do
  link "Edit", edit_product_path
  parent :detail
end

crumb :purchase do
  link "Purchase", product_orders_path
  parent :detail
end

crumb :pick_up do
  link "Pick_up", products_search_path
  parent :root
end