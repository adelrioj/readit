class User < ApplicationRecord
  # Adds two methods on the User model: password and password_confirmation.
  # Also adds validations to ensure that the password and password_confirmation attributes match when creating a user.
  # Additionally, the password value is encrypted and stored in the password_digest field in the users table
  # that we discussed earlier.
  # Finally, has_secure_password adds an authenticate instance method to the User model,
  # which we'll use to authenticate our users.
  has_secure_password
  has_many :stories
  has_many :votes
end
