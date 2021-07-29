class Comment < ApplicationRecord
  has_rich_text :content
  belongs_to :ticket

  broadcasts_to :ticket
  # Using broadcasts_to as done above is the same as calling the following 3 callbacks:
  # after_create_commit -> { broadcast_append_to ticket }
  # after_update_commit -> { broadcast_replace_to ticket }
  # after_destroy_commit -> { broadcast_remove_to ticket }
end
