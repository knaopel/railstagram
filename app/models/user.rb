class User < ApplicationRecord
  include Authenticatable

  def to_param
    username
  end
end
