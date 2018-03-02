class LocalEvent < ApplicationRecord
  # Direct associations

  belongs_to :host,
             :class_name => "User"

  has_many   :sign_ups,
             :foreign_key => "event_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
