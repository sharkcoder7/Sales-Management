DATA = {
  :user_keys =>
  ["name", "password"],
  :users => [
  ["rick", "password"],
  ["larry", "password"],
  ["john", "password"]
  ],

  :item_keys =>
  ["name", "description", "category", "price"],

  :items => [
    ["PS4", "Sony Play Station 4", "Electronics", 199.99],
    ["X-Box", "Microsoft X Box", "Electronics", 199.99],
    ["Sony 55 Inch TV", "Sony Plasma TV", "Appliances", 600.50],
    ["Frigidaire Fridge", "Keep your food cool", "Appliances", 700.50],
    ["Roshi", "Nike Sneakers", "Apparel", 100.00]
  ],
  :admins => [
    "Wali"
  ]
}

def main
  make_users
  make_admin
  make_items
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |name|
    User.create(name: name, admin: true, password: 'test')
  end
end

def make_items
  DATA[:items].each do |item|
    new_item = Item.new
    item.each_with_index do |attribute, i|
      new_item.send(DATA[:item_keys][i]+"=", attribute)
    end
    new_item.save
  end
end

main


