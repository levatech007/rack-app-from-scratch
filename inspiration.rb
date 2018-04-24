class Inspiration
  def initialize
    @inspiration_list = [
      'Only I can change my life',
      'Life is 10% what happens to you and 90% how you react to it',
      'Good, better, best',
      'Optimism is the faith that leads to achievement',
      'With the new day comes new strength and new thoughts',
      'The past cannot be changed',
      'Failure will never overtake me if my determination to succeed is strong enough'
    ]
  end

  def generate
    @inspiration_list.sample
  end
end
