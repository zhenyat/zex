################################################################################
# Model:  Call
#
# Purpose: API calls for a definite Dotcom
#
# Call attributes:
#   api_id  - FK
#   name    - call name:            string,  not NULL, unique
#   title   - call title:           string,  not NULL
#   kind    - Kind of REST Request: enum { get (0) | post (1) }
#   link    - link to description:  string
#   status  - enum { active (0) | archived (1) }
#
#   content - Active Text attachement
#
#  18.10.2022 ZT
#  13.11.2022 kind
################################################################################
class Call < ApplicationRecord
  has_rich_text :content
  belongs_to :api, required: true

  enum kind:   %w(rest_get rest_post)
  enum status: %w(active archived)

  validates :api,   presence: true
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
