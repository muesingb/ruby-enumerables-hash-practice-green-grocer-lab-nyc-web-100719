def consolidate_cart(cart) #cart is array [{"AVOCADO" => {:price => 3.00, :clearance => true}}, avocado, tempeh].
  #cart_hash[key] = value. key is avocado. AVOCADO is cart[0]
  #{"AVOCADO" => {:price => 3.00, :clearance => true}}
cart_hash = {}
cart.each do |item|
  cart_hash[item.keys[0]] = item.values[0]
    if cart_hash[item.keys[0]][:count]
     cart_hash[item.keys[0]][:count] += 1
    else
     cart_hash[item.keys[0]][:count] = 1
    end
  end
cart_hash

#cart.reduce({}) do |memo, (key, value)
#  end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
