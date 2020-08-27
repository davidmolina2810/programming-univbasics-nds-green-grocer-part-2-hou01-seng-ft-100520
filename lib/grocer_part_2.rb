require_relative './part_1_solution.rb'
require 'pry'

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  # 1. iterate through coupons and assign each hash to 'discount_item'
  #   2. iterate through cart and assign each hash to 'item'
  #     3. if discount_item[:item] == item[:item]
  #       4. count = 0
    #       4. while (item[:count] is >= discount_item[:num]) &&
    #                 (item[:count] - discount_item[:num] != 0)
    #         5. item[:count] -= discount[:num]
    #         6. count += discount[:num]
    #         7. if item[:count] == 1
    #           8. cart << {item: item[:item] + " W/COUPON", price == discount_item[:cost] / discount_item[:num],
    #                           clearance: item[:clearance], count: count}
    #       9. if item[:count] == 0
    #         10. cart << {item: item[:item] + " W/COUPON", price == discount_item[:cost]/ discount_item[:num],
    #                           clearance: item[:clearance], count: count}
    #         11. cart.delete_at(cart.find(item))
    # 12. return cart

  coupons.each do |discount_item|
    cart.each do |item|
      #binding.pry
      if discount_item[:item] == item[:item]
        count = 0
        if item[:count] == discount_item[:num]
          discounted = {item: item[:item] + " W/COUPON", price: discount_item[:cost] / discount_item[:num],\
                          clearance: item[:clearance], count: item[:count]}
          item[:count] -= discount_item[:num]
          cart << discounted
          cart.delete_at(cart.find_index(item))
          #binding.pry
        end
        #binding.pry
        while (item[:count] >= discount_item[:num]) && (item[:count] - discount_item[:num] != 0)
          item[:count] -= discount[:num]
          count += discount[:num]
          #binding.pry
          if item[:count] == 1
            cart << {item: item[:item] + " W/COUPON", price: discount_item[:cost]/discount_item[:num],\
                      clearance: item[:clearance], count: count}
          end
        end
        binding.pry
      end
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
