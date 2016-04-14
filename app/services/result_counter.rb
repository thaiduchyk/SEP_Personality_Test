class ResultCounter

  def initialize(answer_hash, user_id)

    @user = User.find(user_id)
    @e = countE(answer_hash)
    @i = countI(answer_hash)
    @s = countS(answer_hash)
    @n = countN(answer_hash)
    @t = countT(answer_hash)
    @f = countF(answer_hash)
    @j = countJ(answer_hash)
    @p = countP(answer_hash)
    @diff_ar = [(@e - @i).abs, (@s - @n).abs, (@t - @f).abs, (@j - @p).abs]
  end

  def call
    save_personalities
  end

  private

  def save_personalities
    @user.personalities << Personality.where('key = ?', first_personality)
    @user.personalities << Personality.where('key = ?', second_personality)
    @user.personalities << Personality.where('key = ?', third_personality)
  end

  def first_personality
    @e > @i ? @first_key = 'e' : @first_key = 'i'
    @s > @n ? @first_key += 's' : @first_key += 'n'
    @t > @f ? @first_key += 't' : @first_key += 'f'
    @j > @p ? @first_key += 'j' : @first_key += 'p'
    @first_key
  end

  def second_personality
    index = @diff_ar.index(@diff_ar.min)
    @diff_ar[index] = 1000
    change_key(@first_key, index)
  end

  def third_personality
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


  def countE(answer_hash)
    result = 0
    (1..70).step(7) do |x|
      result += answer_hash[x.to_s][:a].to_i
    end
    result
  end

  def countI(answer_hash)
    result = 0
    (1..70).step(7) do |x|
      result += answer_hash[x.to_s][:b].to_i
    end
    result
  end

  def countS(answer_hash)
    result = 0
    (2..70).step(7) do |x|
      result += answer_hash[x.to_s][:a].to_i
    end
    (3..70).step(7) do |x|
      result += answer_hash[x.to_s][:a].to_i
    end
    result
  end

  def countN(answer_hash)
    result = 0
    (2..70).step(7) do |x|
      result += answer_hash[x.to_s][:b].to_i
    end
    (3..70).step(7) do |x|
      result += answer_hash[x.to_s][:b].to_i
    end
    result
  end

  def countT(answer_hash)
    result = 0
    (4..70).step(7) do |x|
      result += answer_hash[x.to_s][:a].to_i
    end
    (5..70).step(7) do |x|
      result += answer_hash[x.to_s][:a].to_i
    end
    result
  end

  def countF(answer_hash)
    result = 0
    (4..70).step(7) do |x|
      result += answer_hash[x.to_s][:b].to_i
    end
    (5..70).step(7) do |x|
      result += answer_hash[x.to_s][:b].to_i
    end
    result
  end

  def countJ(answer_hash)
    result = 0
    (6..70).step(7) do |x|
      result += answer_hash[x.to_s][:a].to_i
    end
    (7..70).step(7) do |x|
      result += answer_hash[x.to_s][:a].to_i
    end
    result
  end

  def countP(answer_hash)
    result = 0
    (6..70).step(7) do |x|
      result += answer_hash[x.to_s][:b].to_i
    end
    (7..70).step(7) do |x|
      result += answer_hash[x.to_s][:b].to_i
    end
    result
  end

end





