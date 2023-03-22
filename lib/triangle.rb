class Triangle
  # write code here
  attr_accessor :tri1, :tri2, :tri3

  def initialize(tri1, tri2, tri3)
    @tri1= tri1
    @tri2= tri2
    @tri3= tri3
  end

  def kind
    validate_triangle
    if tri1 == tri2 && tri2 == tri3
      :equilateral
    elsif tri1 == tri2 || tri2 == tri3 || tri1 == tri3
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [tri1, tri2, tri3].all?(&:positive?)
  end

  def valid_triangle_inequality?
    tri1 + tri2> tri3 && tri1 + tri3> tri2 && tri2 + tri3 > tri1
  end

  
  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
    
  end

end
