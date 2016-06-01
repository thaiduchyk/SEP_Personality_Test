class Question < ActiveRecord::Base


  VALID_QUESTION_REGEX = /\A[A-Z+][a-z]{2,}\-*(\s*[a-z*]*\-*)+\s*.\z/
  VALID_ANSWER_REGEX = /\A[A-Z+][a-z]{2,}\-*(\s*[a-z*]*\-*)*\z/
  # validates :qst_txt, presence:true,
  #           format: { with: VALID_QUESTION_REGEX }
  # validates :a, presence:true,
  #           format: { with: VALID_ANSWER_REGEX }
  # validates :b, presence:true,
  #           format: { with: VALID_ANSWER_REGEX }
end
