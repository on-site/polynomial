require 'minitest/autorun'
require 'polynomial/ultraspherical'

class TestUltraspherical < MiniTest::Test

  @@epsilon = 1e-12

  def test_invalid_range
    assert_raises(RangeError) { Polynomial::Ultraspherical.us(-3,-3) }
    assert_raises(RangeError) { Polynomial::Ultraspherical.us(-2,1) }
    assert_raises(RangeError) { Polynomial::Ultraspherical.us(-1,0) }
    assert_raises(RangeError) { Polynomial::Ultraspherical.us(2,-1) }
  end

  def test_ok_range
    Polynomial::Ultraspherical.us(1,-0.5)
    Polynomial::Ultraspherical.us(2,-0.99)
    Polynomial::Ultraspherical.us(3,0.1)
    Polynomial::Ultraspherical.us(0,-3)
    Polynomial::Ultraspherical.us(7,1)
  end

  def test_coefficients
    in_out = {
      [0,3] => [1],
      [1,3] => [0,6],
      [2,3] => [-3,0,24],
      [3,3] => [0,-24,0,80],
      [4,3] => [6, 0, -120, 0, 240],
      [5,2] => [0, 24, 0, -160, 0, 192],
      [6,1] => [-1, 0, 24, 0, -80, 0, 64],
      [2,-0.5] => [0.5, 0, -0.5],
      [4,0] => [1, 0, -8, 0, 8],
      [4,1.quo(2)] => [Rational(3, 8), Rational(0, 1), Rational(-15, 4), Rational(0, 1), Rational(35, 8)],
      [4,0.5] => [Rational(3, 8), Rational(0, 1), Rational(-15, 4), Rational(0, 1), Rational(35, 8)],
      [4,1] => [1, 0, -12, 0, 16],
    }
    in_out.each_pair do |args, coefs|
      assert_equal Polynomial[*coefs], Polynomial::Ultraspherical.us(*args)
    end

  end

end
