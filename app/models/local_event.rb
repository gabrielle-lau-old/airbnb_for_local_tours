class LocalEvent < ApplicationRecord
  # Direct associations

  has_many   :sign_ups,
             :foreign_key => "event_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
