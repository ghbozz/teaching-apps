class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  enum role: { read_only: 0, admin: 1 }

  after_update_commit :turbo_stream_update

  def turbo_stream_update
    broadcast_replace_to "users", partial: "users/user", locals: { user: self }
  end
end
