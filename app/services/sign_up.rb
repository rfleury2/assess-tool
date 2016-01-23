class SignUp 
  attr_reader :user

  def initialize(user_params)
    @user = User.new(user_params)
    # TODO: Send confirmation email
  end
end