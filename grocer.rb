def consolidate_cart(cart) #cart is array [{"AVOCADO" => {:price => 3.00, :clearance => true}}, avocado, tempeh].
  #cart_hash[key] = value. key is avocado. AVOCADO is cart[0]
  #{"AVOCADO" => {:price => 3.00, :clearance => true}}
cart_hash = {}
cart.each do |item|
  cart_hash[item.keys[0]] = item.values[0]

cart_hash[item.keys[0]][:count]? cart_hash[item.keys[0]][:count] += 1 : cart_hash[item.keys[0]][:count] = 1
  end
cart_hash

#cart.reduce({}) do |memo, (key, value)
#  end
end

def apply_coupons(cart, coupons)
  coupons.each do |array|
    coupon_item = "#{array[:item]}" #get item name out of array
    cart_item = cart[coupon_item] #get item of same name out of cart
    coupon_already_applied = cart[(coupon_item + " W/COUPON")] #Has coupon been applied - does name already exist in cart?
    if cart_item
      cart[(coupon_item + " W/COUPON")] = {:price => (array[:cost]/array[:num]),
        :clearance => (cart_item[:clearance]),
        :count => (if coupon_already_applied
          coupon_already_applied[:count] + array[:num]
          else array[:num]
        end)
      }
    cart_item[:count] = (cart_item[:count] - array[:num]) #update count of non-couponed items of same name
    end
  end
  return cart
end

def apply_clearance(cart) #discount the price of every item on clearance by 20 percent
  cart.map { |cart_key, cart_value|
    cart_value[:clearance]? cart_value[:price] = ((cart_value[:price])*0.8).round(2) : cart_value[:price]}
  return cart
end

def checkout(cart, coupons)
  cart.consolidate_cart
end
