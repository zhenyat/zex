################################################################################
# Model:  Dotcom
#
# Purpose:  ZEX platforms
#
# Dotcom attributes:
#   name    - string,  not NULL, unique
#   title   - string,  not NULL
#   status  - enum { active (0) | archived (1) }
#
#   avatar  - ActiveStorage image
#   content - Active Text attachement
#
#  15.10.2022 ZT
################################################################################
class Dotcom < ApplicationRecord
  include Avatarable

  has_rich_text :content
  has_many :apis, dependent: :destroy

  has_and_belongs_to_many :pairs, join_table: :dotcoms_pairs

  enum status: %w(active archived)
  
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
