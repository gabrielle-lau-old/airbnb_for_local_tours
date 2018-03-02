class SignUp < ApplicationRecord
  # Direct associations

  belongs_to :event,
             :class_name => "LocalEvent"

  # Indirect associations

  # Validations

end
