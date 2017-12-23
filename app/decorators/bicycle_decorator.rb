class BicycleDecorator < Draper::Decorator
  delegate_all

  def price_status
    if price > 15.00?
      "Professional Bicycle #{price}"
    else
      "Recreational Bicycle"
    end 
  end 
  
  def price 
    object.price
  end 
  
end
