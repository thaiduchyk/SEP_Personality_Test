class FriendResultCounter

  def initialize(answers, user_id)
      @user_id = user_id
      @answers = answers
  end

  def call
    save_results
  end

  private

  def save_results
    @answers.each do |key, value|
       result = Result.find_by_user_and_pers(@user_id, key)
       rate = result.friend_rate + value
       result.update(friend_rate: rate)
    end
  end

end