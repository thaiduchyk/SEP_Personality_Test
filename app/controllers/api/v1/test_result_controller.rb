class TestResultController #< ApplicationController
  def count

  end

  #private

  def countE(hash)
    result = 0
    (1..10).step(7) do |x|
      result += hash[x][:a]
    end
    result
  end

  def countI(hash)
    result = 0
    (1..70).step(7) do |x|
      result += hash[x][:b]
      puts result
    end
  end

  def countS(hash)
    result = 0
    (2..70).step(7) do |x|
      result += hash[x][:a]
    end
    (3..70).step(7) do |x|
      result += hash[x][:a]
    end
  end

  def countN(hash)
    result = 0
    (2..70).step(7) do |x|
      result += hash[x][:b]
    end
    (3..70).step(7) do |x|
      result += hash[x][:b]
    end
  end

  def countT(hash)
  result = 0
  (4..70).step(7) do |x|
    result += hash[x][:a]
  end
  (5..70).step(7) do |x|
    result += hash[x][:a]
  end
  end

  def countF(hash)
  result = 0
  (6..70).step(7) do |x|
    result += hash[x][:b]
  end
  (7..70).step(7) do |x|
    result += hash[x][:b]
  end
  end

  def countJ(hash)
  result = 0
  (8..70).step(7) do |x|
    result += hash[x][:a]
  end
  (9..70).step(7) do |x|
    result += hash[x][:a]
  end
  end

  def countP(hash)
  result = 0
  (10..70).step(7) do |x|
    result += hash[x][:b]
  end
  (11..70).step(7) do |x|
    result += hash[x][:b]
  end
  end

end

test = TestResultController.new

hash = { 1 => {'a': 5, 'b': 7}, 2 => {'a': 5, 'b': 7}, 3 => {'a': 5, 'b': 7}, 4 => {'a': 5, 'b': 7}, 5 => {'a': 5, 'b': 7}, 6 => {'a': 5, 'b': 7}, 7 => {'a': 5, 'b': 7}, 8 => {'a': 5, 'b': 7}, 9 => {'a': 5, 'b': 7}}
puts test.countE(hash)