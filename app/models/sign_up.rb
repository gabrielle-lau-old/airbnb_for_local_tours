class SignUp < ApplicationRecord
  # Direct associations

  belongs_to :tourist,
             :class_name => "User"

  belongs_to :event,
             :class_name => "LocalEvent"

  # Indirect associations

  # Validations

end
