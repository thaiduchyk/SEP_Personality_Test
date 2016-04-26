class OwnResultCounter

  def initialize(answers, user_id)
    @user = User.find(user_id)
    @e = countE(answers)
    @i = countI(answers)
    @s = countS(answers)
    @n = countN(answers)
    @t = countT(answers)
    @f = countF(answers)
    @j = countJ(answers)
    @p = countP(answers)
    @diff_ar = [(@e - @i).abs, (@s - @n).abs, (@t - @f).abs, (@j - @p).abs]
    @keys = Array.new
  end

  def call
    save_results
  end

  private

  def save_results
    [first_key, second_key, third_key].each do |key|
      result = Result.find_by_user_and_key(@user, key)
      result.update(own_result: true)
    end
  end

  def first_key
    @e > @i ? @first_key = 'e' : @first_key = 'i'
    @s > @n ? @first_key += 's' : @first_key += 'n'
    @t > @f ? @first_key += 't' : @first_key += 'f'
    @j > @p ? @first_key += 'j' : @first_key += 'p'
    @first_key
  end

  def second_key
    index = @diff_ar.index(@diff_ar.min)
    @diff_ar[index] = 1000
    change_key(@first_key, index)
  end

  def third_key
    index = @diff_ar.index(@diff_ar.min)
    change_key(@first_key, index)
  end

  def change_key (first_key, index)
    key = first_key.dup
    case index
      when 0
        key[0] == 'e' ? key[0] = 'i' : key[0] = 'e'
        return key
      when 1
        key[1] == 's' ? key[1] = 'n' : key[1] = 's'
        return key
      when 2
        key[2] == 't' ? key[2] = 'f' : key[2] = 't'
        return key
      when 3
        key[3] == 'j' ? key[3] = 'p' : key[3] = 'j'
        return key
    end
  end


  def countE(answers)
    result = 0
    (1..70).step(7) do |x|
      result += answers[x.to_s][:a].to_i
    end
    result
  end

  def countI(answers)
    result = 0
    (1..70).step(7) do |x|
      result += answers[x.to_s][:b].to_i
    end
    result
  end

  def countS(answers)
    result = 0
    (2..70).step(7) do |x|
      result += answers[x.to_s][:a].to_i
    end
    (3..70).step(7) do |x|
      result += answers[x.to_s][:a].to_i
    end
    result
  end

  def countN(answers)
    result = 0
    (2..70).step(7) do |x|
      result += answers[x.to_s][:b].to_i
    end
    (3..70).step(7) do |x|
      result += answers[x.to_s][:b].to_i
    end
    result
  end

  def countT(answers)
    result = 0
    (4..70).step(7) do |x|
      result += answers[x.to_s][:a].to_i
    end
    (5..70).step(7) do |x|
      result += answers[x.to_s][:a].to_i
    end
    result
  end

  def countF(answers)
    result = 0
    (4..70).step(7) do |x|
      result += answers[x.to_s][:b].to_i
    end
    (5..70).step(7) do |x|
      result += answers[x.to_s][:b].to_i
    end
    result
  end

  def countJ(answers)
    result = 0
    (6..70).step(7) do |x|
      result += answers[x.to_s][:a].to_i
    end
    (7..70).step(7) do |x|
      result += answers[x.to_s][:a].to_i
    end
    result
  end

  def countP(answers)
    result = 0
    (6..70).step(7) do |x|
      result += answers[x.to_s][:b].to_i
    end
    (7..70).step(7) do |x|
      result += answers[x.to_s][:b].to_i
    end
    result
  end

end





